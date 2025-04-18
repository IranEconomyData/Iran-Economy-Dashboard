# 151-Food Groups for calorie.R ---- and for prices
# Builds the Food Groups data.table for households
#
# Copyright © 2018-2020: Arin Shahbazian & Majid Einian
# Copyright © 2016-2022: Majlis Research Center (The Research Center of Islamic Legislative Assembly)
# Licence: GPL-3

rm(list=ls())
starttime <- proc.time()
library(yaml)
Settings <- yaml.load_file("Settings.yaml")

leapyears <- c(seq(1280,1308,by=4),
               seq(1313,1341,by=4),
               seq(1346,1370,by=4),
               seq(1375,1403,by=4),
               seq(1408,1469,by=4))

library(data.table)
library(stringr)
library(readxl)

cat("\n\n================ FoodGroups =====================================\n")
TFoodGroups <- data.table(read_excel(Settings$MetaDataFilePath,Settings$MDS_FoodGroups))
FoodTypeTables <- list()
for(i in 1:nrow(TFoodGroups))
  FoodTypeTables[[i]] <- data.table(read_excel(Settings$MetaDataFilePath,sheet=TFoodGroups[i,SheetName]))

for(year in (Settings$startyear:Settings$endyear)){
  cat(paste0("\n------------------------------\nYear:",year,"\n"))
  
  BigFData <- data.table(HHID=NA_integer_,FoodCode=NA_integer_,
                         FoodType=NA_character_,Price=NA_real_,
                         Expenditure=NA_real_,FGrams=NA_real_,
                         FoodKCalories=NA_real_,
                         FoodProtein=NA_real_)[0]
  
  
  
  load(file=paste0(Settings$HEISRawPath,"Y",year,"Raw.rda"))
  load(file = paste0(Settings$HEISProcessedPath,"Y",year,"HHBase.rda"))
  if (year==100 | year==101 | year==102) {
    HHBase[,Month:=NA]
  }
  
  if(length(which(is.na(HHBase$Month)))>1){     # For years withouout month info`
    DayCount <- HHBase[,.(HHID,Days=ifelse(Quarter<=2,31,30))]
  }else{
    DayCount <- HHBase[,.(HHID,
                          Days=ifelse(Month<=6,31,
                                      ifelse(Month<=11,30,
                                             ifelse(Year %in% leapyears,30,29))))]
  }
  
  for(i in 1:nrow(TFoodGroups)){
    cat(paste0(TFoodGroups[i,SheetName],", "),"\t")
    
    ThisFoodTypeTable <- FoodTypeTables[[i]] 
    ft <- ThisFoodTypeTable[Year==year]
    tab <- ft$Table
    if(is.na(tab))
      next
    UTF <- Tables[[paste0("U",year,tab)]]
    RTF <- Tables[[paste0("R",year,tab)]]
    TF <- rbind(UTF,RTF)
    for(n in names(TF)){
      x <- which(ft==n)
      if(length(x)>0)
        setnames(TF,n,names(ft)[x])
    }
    if(year %in% 63:82){
      pcols <- intersect(names(TF),c("HHID","Code","Kilos","Expenditure","Price"))
      TF <- TF[,pcols,with=FALSE]
      TF <- TF[Code %in% ft$StartCode:ft$EndCode]
      TF <- TF[!(is.na(Kilos) & is.na(Expenditure) & is.na(Price))] 
      
      TF[,Kilos:=as.numeric(Kilos)]
  
      TF[,FGrams:=(Kilos*1000)]
      
    } else if(year >= 83){
      pcols <- intersect(names(TF),c("HHID","Code","Grams","Kilos","Expenditure","Price"))
      TF <- TF[,pcols,with=FALSE]
      TF <- TF[Code %in% ft$StartCode:ft$EndCode]
      TF <- TF[!(is.na(Grams) & is.na(Kilos) & is.na(Expenditure) & is.na(Price))] 
      #### bellow code added
      
      TF <- TF[!(is.na(Grams) & is.na(Kilos))] 
      
      TF[,Price:=as.numeric(Price)]
      TF[,Kilos:=as.numeric(Kilos)]
      TF[,Grams:=as.numeric(Grams)]
      TF[,Expenditure:=as.numeric(Expenditure)]
      
      TF[is.na(Grams) & !is.na(Kilos),Grams:=0]
      TF[is.na(Kilos) & !is.na(Grams),Kilos:=0]
      TF[,FGrams:=(Kilos*1000+Grams)]
    }
    
    TF[is.na(Price), Price:= Expenditure/(FGrams/1000)]
    TF[is.na(FGrams),FGrams:=Expenditure/Price*1000]
    
    #TF[,Code:=NULL]
    TF[is.na(TF)] <- 0
    
    FData <- TF[,lapply(.SD,sum),by=.(HHID,Code)]
    FData[!is.na(FGrams), Price:=Expenditure/(FGrams/1000)]
    FData[, FoodType:=TFoodGroups[i,FoodType]]
    FData <- merge(FData,DayCount)
    FData[, FoodKCalories:=TFoodGroups[i,KCalories]*FGrams/Days]
    FData[, FoodProtein:=TFoodGroups[i,Protein]*FGrams/Days]
    FData[is.infinite(Price),Price:=NA]
    
    BigFData <- rbind(BigFData,
                      FData[,.(HHID,FoodCode=Code,FoodType,Price,Expenditure,FGrams,FoodKCalories,FoodProtein)])
    
  }
  save(BigFData, file = paste0(Settings$HEISProcessedPath,"Y",year,"BigFData.rda"))
  cat("\n\n++========++\n||",nrow(BigFData[!is.na(FoodKCalories)]),"||\n++========++\n")
  
}
endtime <- proc.time()
cat("\n\n==============Finish==============\nIt took ",(endtime-starttime)[3],"seconds.")