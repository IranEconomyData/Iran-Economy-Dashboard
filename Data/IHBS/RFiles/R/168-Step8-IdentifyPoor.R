# 168-Step8-IndentifyPoor.R
# 
# Copyright © 2018-2022:Majid Einian & Arin Shahbazian
# Licence: GPL-3

rm(list=ls())

starttime <- proc.time()
cat("\n\n================ Identify the Poor ================================\n")
library(yaml)
Settings <- yaml.load_file("Settings.yaml")

library(data.table)

for(year in ((Settings$startyear+2):Settings$endyear)){
  cat(paste0("\nYear:",year,"\t"))
  
  # load data --------------------------------------
  load(file=paste0(Settings$HEISProcessedPath,"Y",year,"FoodPoor.rda"))
  load(file=paste0(Settings$HEISProcessedPath,"BigEngelTable.rda"))
  

  MD <- merge(MD,BigEngelTable[Year==year,
                               .(cluster3,Region,
                                 CMPovLine,
                                 PovertyLine,
                                 Engel,ModifiedEngel,
                                 OER,ModOER,
                                 DSC,ModDSC)],
              by=c("Region","cluster3"))
  MD[,FinalPoor:=ifelse(Total_Consumption_Month_per < CMPovLine,1,0 )]

  save(MD,file=paste0(Settings$HEISProcessedPath,"Y",year,"FinalPoor.rda"))
  

}

endtime <- proc.time()
cat("\n\n============================\nIt took",(endtime-starttime)["elapsed"],"seconds")
