### Income, Poverty, Household Characteristics, Non-Food and Food Expenditure Merging 


rm(list=ls())

cat("\n\n================ Merge Data =====================================\n")

library(readxl)
library(data.table)

library(yaml)
library(dplyr)

Settings <- yaml.load_file("Settings.yaml")



MDSeries <- data.table()

CPIU <- data.table(read_excel(Settings$CPIUFilePath))
CPIR <- data.table(read_excel(Settings$CPIRFilePath))




for(year in (95:102)){

cat(paste0("\n------------------------------\nYear:",year,"\n"))

load(file=paste0(Settings$HEISProcessedPath,"Y",year,"FinalPoor.rda"))

MD[FinalPoor==1,FGT1M:=(CMPovLine-Total_Consumption_Month_per)/CMPovLine]
MD[FinalPoor==1,FGT2M:=((CMPovLine-Total_Consumption_Month_per)/CMPovLine)^2]

for(G in sections_names <- c("Tobacco",
                             "MenCloth" , "WomenCloth","KidsCloth","OtherCloth",
                             "ActualRent","ImputedRent","Water_WasteWater","OtherHouse","EnergyNew",
                             "Furniture_HouseAppliance",
                             "Medicine_MedicalProducts", "MedicalServices","DentalServices", "ParamedicalServices",
                             "OwnTransportation", "PublicTransportation",
                             "CommunicationNew",
                             "AmusementNew",
                             "PreparedFoods", "HotelNew",
                             "MiscellGoodsSerivces",
                             "DurableWomenCloth", "DurableOtherCloth", "DurableOtherHouse", "DurableFurniture_HouseAppliance",
                             "DurableMedicine_MedicalProducts","DurableCosmeticMedical", "DurableMedicalServices",
                             "DurableOwnTransportation",
                             "DurableOtherCommunication","DurablePhone",
                             "DurableComputer",
                             "DurableAmusement", 
                             "EducationNew",
                             "Jewelry_Stocks",
                             "DurableMiscellGoodsSerivces",
                             "Insurance", "Loans", "OtherFinancials",
                             "InvestmentApartment", "InvestmentOther", "InvestmentJewelry_Stocks"))
  
  
  load(file=paste0(Settings$HEISProcessedPath,"Y",year,G,"s.rda"))



MDNonFood <-merge(MenClothData,TobaccoData,by=c("HHID"),all=TRUE)
MDNonFood <-merge(MDNonFood,WomenClothData,by=c("HHID"),all=TRUE)
MDNonFood <-merge(MDNonFood,KidsClothData,by=c("HHID"),all=TRUE)
MDNonFood <-merge(MDNonFood,OtherClothData,by=c("HHID"),all=TRUE)
MDNonFood <-merge(MDNonFood,ActualRentData,by=c("HHID"),all=TRUE)
MDNonFood <-merge(MDNonFood,ImputedRentData,by=c("HHID"),all=TRUE)
MDNonFood <-merge(MDNonFood,Water_WasteWaterData,by=c("HHID"),all=TRUE)
MDNonFood <-merge(MDNonFood,OtherHouseData,by=c("HHID"),all=TRUE)
MDNonFood <-merge(MDNonFood,EnergyNewData,by=c("HHID"),all=TRUE)
MDNonFood <-merge(MDNonFood,Furniture_HouseApplianceData,by=c("HHID"),all=TRUE)
MDNonFood <-merge(MDNonFood,Medicine_MedicalProductsData,by=c("HHID"),all=TRUE)
MDNonFood <-merge(MDNonFood,MedicalServicesData,by=c("HHID"),all=TRUE)
MDNonFood <-merge(MDNonFood,DentalServicesData,by=c("HHID"),all=TRUE)
MDNonFood <-merge(MDNonFood,ParamedicalServicesData,by=c("HHID"),all=TRUE)
MDNonFood <-merge(MDNonFood,OwnTransportationData,by=c("HHID"),all=TRUE)
MDNonFood <-merge(MDNonFood,PublicTransportationData,by=c("HHID"),all=TRUE)
MDNonFood <-merge(MDNonFood,CommunicationNewData,by=c("HHID"),all=TRUE)
MDNonFood <-merge(MDNonFood,AmusementNewData,by=c("HHID"),all=TRUE)
MDNonFood <-merge(MDNonFood,PreparedFoodsData,by=c("HHID"),all=TRUE)
MDNonFood <-merge(MDNonFood,HotelNewData,by=c("HHID"),all=TRUE)
MDNonFood <-merge(MDNonFood,MiscellGoodsSerivcesData,by=c("HHID"),all=TRUE)
MDNonFood <-merge(MDNonFood,DurableWomenClothData,by=c("HHID"),all=TRUE)
MDNonFood <-merge(MDNonFood,DurableOtherClothData,by=c("HHID"),all=TRUE)
MDNonFood <-merge(MDNonFood,DurableOtherHouseData,by=c("HHID"),all=TRUE)
MDNonFood <-merge(MDNonFood,DurableFurniture_HouseApplianceData,by=c("HHID"),all=TRUE)
MDNonFood <-merge(MDNonFood,DurableMedicine_MedicalProductsData,by=c("HHID"),all=TRUE)
MDNonFood <-merge(MDNonFood,DurableCosmeticMedicalData,by=c("HHID"),all=TRUE)
MDNonFood <-merge(MDNonFood,DurableMedicalServicesData,by=c("HHID"),all=TRUE)
MDNonFood <-merge(MDNonFood,DurableOwnTransportationData,by=c("HHID"),all=TRUE)
MDNonFood <-merge(MDNonFood,DurableOtherCommunicationData,by=c("HHID"),all=TRUE)
MDNonFood <-merge(MDNonFood,DurablePhoneData,by=c("HHID"),all=TRUE)
MDNonFood <-merge(MDNonFood,DurableComputerData,by=c("HHID"),all=TRUE)
MDNonFood <-merge(MDNonFood,DurableAmusementData,by=c("HHID"),all=TRUE)
MDNonFood <-merge(MDNonFood,EducationNewData,by=c("HHID"),all=TRUE)
MDNonFood <-merge(MDNonFood,Jewelry_StocksData,by=c("HHID"),all=TRUE)
MDNonFood <-merge(MDNonFood,DurableMiscellGoodsSerivcesData,by=c("HHID"),all=TRUE)
MDNonFood <-merge(MDNonFood,InsuranceData,by=c("HHID"),all=TRUE)
MDNonFood <-merge(MDNonFood,LoansData,by=c("HHID"),all=TRUE)
MDNonFood <-merge(MDNonFood,OtherFinancialsData,by=c("HHID"),all=TRUE)
MDNonFood <-merge(MDNonFood,InvestmentApartmentData,by=c("HHID"),all=TRUE)
MDNonFood <-merge(MDNonFood,InvestmentOtherData,by=c("HHID"),all=TRUE)
MDNonFood <-merge(MDNonFood,InvestmentJewelry_StocksData,by=c("HHID"),all=TRUE)

MDNonFood[is.na(MDNonFood)] <- 0



MDNonFood <- merge(MD[,.(HHID,Weight,Size,EqSizeOECD,EqSizeCalory,Dcil_Gen_Cons_PAdj,Dcil_Gen_Cons_Nominal,Region,ProvinceName,
                         PovertyLine,FinalPoor,FGT1M,FGT2M,TFoodKCaloriesHH_Per)],MDNonFood,by=c("HHID"),all.x = T)



MDNonFood[,WomenCloth_Exp := Reduce(`+`, .SD), .SDcols=c("DurableWomenCloth_Exp","WomenCloth_Exp")]
MDNonFood[,OtherCloth_Exp := Reduce(`+`, .SD), .SDcols=c("DurableOtherCloth_Exp","OtherCloth_Exp")]
MDNonFood[,OtherHouse_Exp := Reduce(`+`, .SD), .SDcols=c("DurableOtherHouse_Exp","OtherHouse_Exp")]
MDNonFood[,Furniture_HouseAppliance_Exp := Reduce(`+`, .SD), .SDcols=c("Furniture_HouseAppliance_Exp","DurableFurniture_HouseAppliance_Exp")]
MDNonFood[,Medicine_MedicalProducts_Exp := Reduce(`+`, .SD), .SDcols=c("DurableMedicine_MedicalProducts_Exp","Medicine_MedicalProducts_Exp")]
MDNonFood[,CosmeticMedical_Exp := Reduce(`+`, .SD), .SDcols=c("DurableCosmeticMedical_Exp")]
MDNonFood[,MedicalServices_Exp := Reduce(`+`, .SD), .SDcols=c("DurableMedicalServices_Exp","MedicalServices_Exp")]
MDNonFood[,OwnTransportation_Exp := Reduce(`+`, .SD), .SDcols=c("DurableOwnTransportation_Exp","OwnTransportation_Exp")]
MDNonFood[,OtherCommunication_Exp := Reduce(`+`, .SD), .SDcols=c("DurableOtherCommunication_Exp")]
MDNonFood[,Phone_Exp := Reduce(`+`, .SD), .SDcols=c("DurablePhone_Exp")]
MDNonFood[,Computer_Exp := Reduce(`+`, .SD), .SDcols=c("DurableComputer_Exp")]
MDNonFood[,Amusement_Exp := Reduce(`+`, .SD), .SDcols=c("DurableAmusement_Exp","AmusementNew_Exp")]
MDNonFood[,Jewelry_Stocks_Exp := Reduce(`+`, .SD), .SDcols=c("InvestmentJewelry_Stocks_Exp","Jewelry_Stocks_Exp")]
MDNonFood[,MiscellGoodsSerivces_Exp := Reduce(`+`, .SD), .SDcols=c("DurableMiscellGoodsSerivces_Exp","MiscellGoodsSerivces_Exp")]


MDNonFood[,TotalNonFood_Exp := Reduce(`+`, .SD), .SDcols= c("Tobacco_Exp",
                                                     "MenCloth_Exp" , "WomenCloth_Exp","KidsCloth_Exp","OtherCloth_Exp",
                                                     "ActualRent_Exp","ImputedRent_Exp","Water_WasteWater_Exp","OtherHouse_Exp","EnergyNew_Exp",
                                                     "Furniture_HouseAppliance_Exp",
                                                     "Medicine_MedicalProducts_Exp", "MedicalServices_Exp","DentalServices_Exp", "ParamedicalServices_Exp",
                                                     "OwnTransportation_Exp", "PublicTransportation_Exp",
                                                     "CommunicationNew_Exp",
                                                     "Amusement_Exp",
                                                     "PreparedFoods_Exp", "HotelNew_Exp",
                                                     "MiscellGoodsSerivces_Exp",
                                                     "CosmeticMedical_Exp",
                                                     "OtherCommunication_Exp","Phone_Exp",
                                                     "Computer_Exp",
                                                     "EducationNew_Exp",
                                                     "Jewelry_Stocks_Exp",
                                                     "Insurance_Exp", "Loans_Exp", "OtherFinancials_Exp",
                                                     "InvestmentApartment_Exp", "InvestmentOther_Exp")]

MDNonFood <- MDNonFood[,.(HHID,Weight,Size,EqSizeOECD,EqSizeCalory,Dcil_Gen_Cons_PAdj,Dcil_Gen_Cons_Nominal,Region,ProvinceName,
           Tobacco_Exp,MenCloth_Exp,WomenCloth_Exp,KidsCloth_Exp,OtherCloth_Exp,ActualRent_Exp,ImputedRent_Exp,Water_WasteWater_Exp,OtherHouse_Exp,
            EnergyNew_Exp,Furniture_HouseAppliance_Exp,Medicine_MedicalProducts_Exp,MedicalServices_Exp,DentalServices_Exp,ParamedicalServices_Exp,
            OwnTransportation_Exp,PublicTransportation_Exp,CommunicationNew_Exp,Amusement_Exp,PreparedFoods_Exp,HotelNew_Exp,MiscellGoodsSerivces_Exp,CosmeticMedical_Exp,
            OtherCommunication_Exp,Phone_Exp,Computer_Exp,EducationNew_Exp,Jewelry_Stocks_Exp,Insurance_Exp,Loans_Exp,OtherFinancials_Exp,InvestmentApartment_Exp,
            InvestmentOther_Exp,TotalNonFood_Exp,PovertyLine,FinalPoor,FGT1M,FGT2M,TFoodKCaloriesHH_Per)]

MDNonFood[,Cloth_Exp := Reduce(`+`, .SD), .SDcols= c("MenCloth_Exp" , "WomenCloth_Exp","KidsCloth_Exp","OtherCloth_Exp") ]
MDNonFood[,Shelter_Exp := Reduce(`+`, .SD), .SDcols= c("ActualRent_Exp","ImputedRent_Exp","Water_WasteWater_Exp","OtherHouse_Exp","EnergyNew_Exp") ]
MDNonFood[,HealthMedical_Exp := Reduce(`+`, .SD), .SDcols= c("Medicine_MedicalProducts_Exp", "MedicalServices_Exp","DentalServices_Exp", "ParamedicalServices_Exp","CosmeticMedical_Exp") ]
MDNonFood[,Transportation_Exp := Reduce(`+`, .SD), .SDcols= c("OwnTransportation_Exp", "PublicTransportation_Exp") ]
MDNonFood[,IT_Exp := Reduce(`+`, .SD), .SDcols= c("CommunicationNew_Exp","OtherCommunication_Exp","Phone_Exp" , "Computer_Exp") ]
MDNonFood[,Leisure_Exp := Reduce(`+`, .SD), .SDcols= c("Amusement_Exp","HotelNew_Exp") ]
MDNonFood[,Investment_Exp := Reduce(`+`, .SD), .SDcols= c("Jewelry_Stocks_Exp","InvestmentApartment_Exp", "InvestmentOther_Exp") ]
MDNonFood[,Financial_Exp := Reduce(`+`, .SD), .SDcols= c("Insurance_Exp","Loans_Exp","OtherFinancials_Exp") ]


#----
#Food

load(file=paste0(Settings$HEISProcessedPath,"Y",year,"BigFDataTotalNew.rda"))

BigFDataNew <- BigFDataNew[,.(HHID,FoodType,Expenditure,FGrams)]

BigFDataNew <- BigFDataNew[,.(Expenditure=sum(Expenditure),
                              grams=sum(FGrams)),by=c("HHID","FoodType")]
BigFDataWide <- dcast(BigFDataNew, HHID ~ FoodType, value.var = c("Expenditure","grams"))
BigFDataWide[is.na(BigFDataWide)] <- 0
names(BigFDataWide) <- sub("^Expenditure_", "", names(BigFDataWide))


MDExp <- merge(MDNonFood,BigFDataWide,by=c("HHID"),all.x = T)
MDExp[is.na(MDExp)] <- 0
MDExp[,Food_Exp := Reduce(`+`, .SD), .SDcols= c("Bread","Rice", "Other_Cereals_Flour" , "Meat", "Chicken",
                                             "Dairy" ,"Egg" ,"Oil","Fruit", "Nuts" ,"Vegetables","Sugar",
                                             "Spice_Other_ingredients", "Tea_Coffe_Cola" ,"PreparedFoods_Exp") ]
MDExp[,Year:=year]
MDExp[, last_digitYear := substr(as.character(Year), nchar(as.character(Year)), nchar(as.character(Year)))]

if (year<100) {
  MDExp[,Year:=paste0("13",year)]
  
}else {
  MDExp[,Year:=paste0("140",last_digitYear)]
}


MDExp[,ID:=paste0(as.character(Year),as.character(HHID))]
MDExp[,last_digitYear:=NULL]
MDExp[,Total_Exp:=TotalNonFood_Exp+Food_Exp]


MDExp <- relocate(MDExp,ID,.before = HHID)
MDExp <- relocate(MDExp,Year,.before = HHID)
MDExp <- relocate(MDExp,FinalPoor,.after = Dcil_Gen_Cons_PAdj)
MDExp <- relocate(MDExp,PovertyLine,.after = FinalPoor)
MDExp <- relocate(MDExp,FGT1M,.after = PovertyLine)
MDExp <- relocate(MDExp,FGT2M,.after = FGT1M)
MDExp[,EqSizeCalory:=NULL]

setnames(x = MDExp,old = "Dcil_Gen_Cons_Nominal",new = "Nominal Decile")
setnames(x = MDExp,old = "Dcil_Gen_Cons_PAdj",new = "Real Decile")

MDExp <- relocate(MDExp,Tobacco_Exp,.before = MenCloth_Exp)
MDExp <- relocate(MDExp,Tobacco_Exp,.before = MenCloth_Exp)
MDExp <- relocate(MDExp,Cloth_Exp,.after = OtherCloth_Exp)
MDExp <- relocate(MDExp,Shelter_Exp,.after = EnergyNew_Exp)
MDExp <- relocate(MDExp,CosmeticMedical_Exp,.before = ParamedicalServices_Exp)
MDExp <- relocate(MDExp,HealthMedical_Exp,.after = ParamedicalServices_Exp)
MDExp <- relocate(MDExp,Transportation_Exp,.after = PublicTransportation_Exp)
MDExp <- relocate(MDExp,Phone_Exp,.after = CommunicationNew_Exp)
MDExp <- relocate(MDExp,Computer_Exp,.after = CommunicationNew_Exp)
MDExp <- relocate(MDExp,OtherCommunication_Exp,.after = CommunicationNew_Exp)
MDExp <- relocate(MDExp,IT_Exp,.after = Phone_Exp)
MDExp <- relocate(MDExp,Leisure_Exp,.after = Amusement_Exp)
MDExp <- relocate(MDExp,HotelNew_Exp,.after = Amusement_Exp)
MDExp <- relocate(MDExp,EducationNew_Exp,.after = Leisure_Exp)
MDExp <- relocate(MDExp,Jewelry_Stocks_Exp,.after = MiscellGoodsSerivces_Exp)
MDExp <- relocate(MDExp,InvestmentApartment_Exp,.after = Jewelry_Stocks_Exp)
MDExp <- relocate(MDExp,InvestmentOther_Exp,.after = InvestmentApartment_Exp)
MDExp <- relocate(MDExp,Investment_Exp,.after = InvestmentOther_Exp)
MDExp <- relocate(MDExp,TotalNonFood_Exp,.after = Financial_Exp)
MDExp <- relocate(MDExp,PreparedFoods_Exp,.after = Vegetables)

setnames(MDExp, 
         old = names(MDExp)[grep("_Exp$", names(MDExp))], 
         new = sub("_Exp$", "", names(MDExp)[grep("_Exp$", names(MDExp))]))

setnames(MDExp,old = "Total",new = "TotalExp")

#Income ----


    
    load(file=paste0(Settings$HEISProcessedPath,"Y",year,"Total_Income.rda"))

    
    for (col in c("PubWageNetIncomeY","PrvWageNetIncomeY","BussNetIncomeY",
                  "AgriNetIncomeY","Retirement","Rent","Interest","Aid",
                  "HomeProduction","Intra","Subsidy","NetIncome"))
    IncomeTable[is.na(get(col)), (col) := 0]
    Income <- IncomeTable[,.(HHID,PubWageNetIncomeY,PrvWageNetIncomeY,BussNetIncomeY,AgriNetIncomeY,
                   Retirement,Rent,Interest,Aid,HomeProduction,Intra,Subsidy,NetIncome)]
    
    Income[,PubWageNetIncome:=PubWageNetIncomeY/12]
    Income[,PrvWageNetIncome:=PrvWageNetIncomeY/12]
    Income[,BussNetIncome:=BussNetIncomeY/12]
    Income[,AgriNetIncome:=AgriNetIncomeY/12]
    Income[,Retirement:=Retirement/12]
    Income[,Rent:=Rent/12]
    Income[,Interest:=Interest/12]
    Income[,Aid:=Aid/12]
    Income[,HomeProduction:=HomeProduction/12]
    Income[,Intra:=Intra/12]
    Income[,Subsidy:=Subsidy/12]
    Income[,NetIncome:=NetIncome/12]
    Income <- Income[,.(HHID,PubWageNetIncome,PrvWageNetIncome,BussNetIncome,AgriNetIncome,Retirement,
                        Rent,Interest,Aid,HomeProduction,Intra,Subsidy,NetIncome)]
    MD <- merge(MDExp,Income,by=c("HHID"),all.x = T)
    
    
    load(file=paste0(Settings$HEISProcessedPath,"Y",year,"HHHouseProperties.rda"))
    HHHouseProperties[,DYCOL001:=NULL]
    HHHouseProperties[,DYCOL002:=NULL]
    HHHouseProperties[,DYCOL42_14:=NULL]
    HHHouseProperties[,Phone:=NULL]

      
    MD <- merge(MD,HHHouseProperties,by=c("HHID"),all.x = T)
    
    gram_cols <- grep("^grams_", names(MD), value = TRUE)
    
    gram_cols <- sort(gram_cols)
    
    other_cols <- setdiff(names(MD), gram_cols)
    
    setcolorder(MD, c(other_cols, gram_cols))
    
    
    setcolorder(MD, c(setdiff(names(MD), "TFoodKCaloriesHH_Per"), "TFoodKCaloriesHH_Per"))
    


    if (year %in% c(90,91,92,93,94,95)) {
      
      MD[,c("Othertenure","party_month" , "party_year", "ceremony_month" ,"ceremony_year",
            "homerepaire_month","homerepaire_year","prtrip_month", "prtrip_year",
            "frtrip_month", "frtrip_year","operation_month","operation_year",
            "other_month","other_year", "other_name", "noceremony"):=NULL]
      
      
      new_names <- c("a_HHID", "a_ID", "a_year" , "a_weight","a_size", 
                     
                     "calc_EqSize" , "calc_real.decile","calc_final.poor","calc_poverty.line","calc_poverty.gap","calc_povery.intensity","calc_nom.decile",
                     
                     "a_region","a_province",
                     
                     "exp_tobacco_total",
                     
                     "exp_cloth_men","exp_cloth_women","exp_cloth_kids","exp_cloth_other","exp_cloth_total",
                     
                     "exp_shelter_actual.rent","exp_shelter_imputed.rent","exp_shelter_water.wasteWater","exp_shelter_other.house","exp_shelter_energy","exp_shelter_total",
                     
                     "exp_furniture_house.appliance_total",
                     
                     "exp_health.medical_medicine.medical.products" , "exp_health.medical_medical.services" , "exp_health.medical_dental.services" , "exp_health.medical_cosmetic.medical" , "exp_health.medical_paramedical.services" , "exp_health.medical_total",
                     
                     "exp_transportation_owns" , "exp_transportation_public" , "exp_transportation_total",
                     
                     "exp_IT_communication", "exp_IT_other.communication", "exp_IT_computer", "exp_IT_phone","exp_IT_total",
                     
                     "exp_leisure_amusement", "exp_leisure_hotel", "exp_leisure_total",
                     
                     "exp_education_total",
                     
                     "exp_miscell.goods.serivces_total",
                     
                     "exp_investment_jewelry.stocks", "exp_investment_apartment","exp_investment_other","exp_investment_total",
                     
                     "exp_financial_insurance" , "exp_financial_loans" , "exp_financial_other" , "exp_financial_total" , 
                     
                     "exp_nonfood_total",
                     
                     "exp_food_cereals_bread" , "exp_food_chicken" , "exp_food_dairy" , "exp_food_egg" , "exp_food_fruit" , "exp_food_meat" ,
                     
                     "exp_food_nuts" , "exp_food_oil", "exp_food_cereals_other" , "exp_food_cereals_rice" , "exp_food_spice.other.ingredients" , "exp_food_sugar",
                     
                     "exp_food_tea.coffee" , "exp_food_vegetable" , "exp_food_prepared" , "exp_food_total", 
                     
                     "exp_total",
                     
                     "inc_pub.wage" , "inc_prv.wage" , "inc_bus" , "inc_agri" , "inc_retirement" , "inc_rent" , "inc_interest" ,
                     
                     "inc_aid" , "inc_home.production" , "inc_other" , "inc_subsidy" , "inc_total" , 
                     
                     "z_tenure" , "z_room" , "z_area" , "z_skeleton" , "z_construc.mat" ,"z_car" , "z_motorcycle" , "z_bike" , "z_radio" , "z_cassette" , 
                     
                     "z_tvbw" ,"z_tvcr" , "z_vcr" , "z_computer" , "z_cellphone" , "z_freezer" , "z_refrig" , "z_frez.refreg" , "z_oven" , "z_vacuum" ,
                     
                     "z_washer" ,"z_sewing" , "z_fan" , "z_cooler.water.movable" , "z_cooler.gas.movable" ,"z_dishwasher" , "z_microwave" ,"z_none" , "z_pipewater" , "z_electricity" ,
                     
                     "z_pipegas" , "z_phone" , "z_internet" , "z_bathroom" , "z_kitchen" , "z_cooler" , "z_central.cooler", "z_central.heat","z_package" , "z_cooler.gas" ,
                     
                     "z_sewerage.network" , "z_cook.fuel" , "z_heat.fuel" , "z_hotwater",
                     
                     "grams_food_cereals_bread" , "grams_food_chicken" , "grams_food_dairy" , "grams_food_egg" , "grams_food_fruit" , "grams_food_meat" ,
                     
                     "grams_food_nuts" , "grams_food_oil", "grams_food_cereals_other" , "grams_food_cereals_rice" , "grams_food_spice.other.ingredients" , "grams_food_sugar",
                     
                     "grams_food_tea.coffee" , "grams_food_vegetable", "calc_kcal.per"
                     
                     
      )  
      
      setnames(MD, names(MD), new_names)
      
    }else{
      
      new_names <- c("a_HHID", "a_ID", "a_year" , "a_weight","a_size", 
                     
                     "calc_EqSize" , "calc_real.decile","calc_final.poor","calc_poverty.line","calc_poverty.gap","calc_povery.intensity","calc_nom.decile",
                     
                     "a_region","a_province",
                     
                     "exp_tobacco_total",
                     
                     "exp_cloth_men","exp_cloth_women","exp_cloth_kids","exp_cloth_other","exp_cloth_total",
                     
                     "exp_shelter_actual.rent","exp_shelter_imputed.rent","exp_shelter_water.wasteWater","exp_shelter_other.house","exp_shelter_energy","exp_shelter_total",
                     
                     "exp_furniture_house.appliance_total",
                     
                     "exp_health.medical_medicine.medical.products" , "exp_health.medical_medical.services" , "exp_health.medical_dental.services" , "exp_health.medical_cosmetic.medical" , "exp_health.medical_paramedical.services" , "exp_health.medical_total",
                     
                     "exp_transportation_owns" , "exp_transportation_public" , "exp_transportation_total",
                     
                     "exp_IT_communication", "exp_IT_other.communication", "exp_IT_computer", "exp_IT_phone","exp_IT_total",
                     
                     "exp_leisure_amusement", "exp_leisure_hotel", "exp_leisure_total",
                     
                     "exp_education_total",
                     
                     "exp_miscell.goods.serivces_total",
                     
                     "exp_investment_jewelry.stocks", "exp_investment_apartment","exp_investment_other","exp_investment_total",
                     
                     "exp_financial_insurance" , "exp_financial_loans" , "exp_financial_other" , "exp_financial_total" , 
                     
                     "exp_nonfood_total",
                     
                     "exp_food_cereals_bread" , "exp_food_chicken" , "exp_food_dairy" , "exp_food_egg" , "exp_food_fruit" , "exp_food_meat" ,
                     
                     "exp_food_nuts" , "exp_food_oil", "exp_food_cereals_other" , "exp_food_cereals_rice" , "exp_food_spice.other.ingredients" , "exp_food_sugar",
                     
                     "exp_food_tea.coffee" , "exp_food_vegetable" , "exp_food_prepared" , "exp_food_total", 
                     
                     "exp_total",
                     
                     "inc_pub.wage" , "inc_prv.wage" , "inc_bus" , "inc_agri" , "inc_retirement" , "inc_rent" , "inc_interest" ,
                     
                     "inc_aid" , "inc_home.production" , "inc_other" , "inc_subsidy" , "inc_total" , 
                     
                     "z_tenure" , "z_room" , "z_area" , "z_skeleton" , "z_construc.mat" ,"z_car" , "z_motorcycle" , "z_bike" , "z_radio" , "z_cassette" , 
                     
                     "z_tvbw" ,"z_tvcr" , "z_vcr" , "z_computer" , "z_cellphone" , "z_freezer" , "z_refrig" , "z_frez.refreg" , "z_oven" , "z_vacuum" ,
                     
                     "z_washer" ,"z_sewing" , "z_fan" , "z_cooler.water.movable" , "z_cooler.gas.movable" ,"z_dishwasher" , "z_microwave" ,"z_none" , "z_pipewater" , "z_electricity" ,
                     
                     "z_pipegas" , "z_phone" , "z_internet" , "z_bathroom" , "z_kitchen" , "z_cooler" , "z_central.cooler", "z_central.heat","z_package" , "z_cooler.gas" ,
                     
                     "z_sewerage.network" , "z_cook.fuel" , "z_heat.fuel" , "z_hotwater",
                     
                     "grams_food_cereals_bread" , "grams_food_chicken" , "grams_food_dairy" , "grams_food_egg" , "grams_food_fruit" , "grams_food_meat" ,
                     
                     "grams_food_nuts" , "grams_food_oil", "grams_food_cereals_other" , "grams_food_cereals_rice" , "grams_food_spice.other.ingredients" , "grams_food_sugar",
                     
                     "grams_food_tea.coffee" , "grams_food_vegetable", "calc_kcal.per"
                     
                     
      )  
      
      setnames(MD, names(MD), new_names)
      
    } 
    
    CPIUY <- CPIU[a_year==year,]

    CPIRY <- CPIR[a_year==year,]


    CPIUY[, last_digitYear := substr(as.character(a_year), nchar(as.character(a_year)), nchar(as.character(a_year)))]
    
    if (year<100) {
      CPIUY[,a_year:=paste0("13",year)]
      
    }else {
      CPIUY[,a_year:=paste0("140",last_digitYear)]
    }
    
    CPIRY[, last_digitYear := substr(as.character(a_year), nchar(as.character(a_year)), nchar(as.character(a_year)))]
    
    if (year<100) {
      CPIRY[,a_year:=paste0("13",year)]
      
    }else {
      CPIRY[,a_year:=paste0("140",last_digitYear)]
    }
    
    
    MDU <- MD[a_region=="Urban",]
    MDR <- MD[a_region=="Rural",]
    
    MDU[,a_year:=as.character(a_year)]
    MDR[,a_year:=as.character(a_year)]
    
    MDU <- merge(MDU,CPIUY,by=c("a_year"),all.x = T)
    MDU[,last_digitYear:=NULL]
    
    MDR <- merge(MDR,CPIRY,by=c("a_year"),all.x = T)
    MDR[,last_digitYear:=NULL]
    
    MD <- rbind(MDU,MDR)
   
    cols_cpi <- grep("^cpi", names(MD), value = TRUE)
    MD[, (cols_cpi) := lapply(.SD, as.numeric), .SDcols = cols_cpi]
    
    
    MD[, `:=`(real_exp_total = (exp_total*100/cpi_total),
              real_exp_tobacco_total = (exp_tobacco_total * 100/cpi_tobacco),
              real_exp_cloth_men = (exp_cloth_men*100/cpi_cloth),
              real_exp_cloth_women = (exp_cloth_women*100/cpi_cloth),
              real_exp_cloth_kids = (exp_cloth_kids*100/cpi_cloth),
              real_exp_cloth_other = (exp_cloth_other*100/cpi_cloth),
              real_exp_cloth_total = (exp_cloth_total*100/cpi_cloth),
              real_exp_shelter_actual.rent = (exp_shelter_actual.rent*100/cpi_rent),
              real_exp_shelter_imputed.rent = (exp_shelter_imputed.rent*100/cpi_rent),
              real_exp_shelter_water.wasteWater = (exp_shelter_water.wasteWater*100/cpi_othershelter),
              real_exp_shelter_other.house = (exp_shelter_other.house*100/cpi_othershelter),
              real_exp_shelter_energy = (exp_shelter_energy*100/cpi_energy),
              real_exp_shelter_total= (exp_shelter_total*100/cpi_shelter),
              real_exp_furniture_house.appliance_total= (exp_furniture_house.appliance_total*100/cpi_furniture),
              real_exp_health.medical_medicine.medical.products= (exp_health.medical_medicine.medical.products*100/cpi_medical),
              real_exp_health.medical_medical.services= (exp_health.medical_medical.services*100/cpi_medical),
              real_exp_health.medical_dental.services= (exp_health.medical_dental.services*100/cpi_medical),
              real_exp_health.medical_cosmetic.medical= (exp_health.medical_cosmetic.medical*100/cpi_medical),
              real_exp_health.medical_paramedical.services= (exp_health.medical_paramedical.services*100/cpi_medical),
              real_exp_health.medical_total= (exp_health.medical_total*100/cpi_medical),
              real_exp_transportation_owns= (exp_transportation_owns*100/cpi_owntransportation),
              real_exp_transportation_public= (exp_transportation_public*100/cpi_publictransportation),
              real_exp_transportation_total= (exp_transportation_total*100/cpi_transportation),
              real_exp_IT_communication= (exp_IT_communication*100/cpi_communication),
              real_exp_IT_other.communication = (exp_IT_other.communication*100/cpi_communication),
              real_exp_IT_computer = (exp_IT_computer*100/cpi_communication),
              real_exp_IT_phone = (exp_IT_phone*100/cpi_communication),
              real_exp_IT_total = (exp_IT_total*100/cpi_communication),
              real_exp_leisure_amusement = (exp_leisure_amusement*100/cpi_leisure),
              real_exp_leisure_total = (exp_leisure_total*100/cpi_leisure),
              real_exp_leisure_hotel = (exp_leisure_hotel*100/cpi_hotel),
              real_exp_education_total = (exp_education_total*100/cpi_education),
              real_exp_miscell.goods.serivces_total = (exp_miscell.goods.serivces_total*100/cpi_otherexp),
              real_exp_investment_jewelry.stocks = (exp_investment_jewelry.stocks*100/cpi_otherexp),
              real_exp_investment_other = (exp_investment_other*100/cpi_otherexp),
              real_exp_investment_total = (exp_investment_total*100/cpi_otherexp),
              real_exp_financial_insurance = (exp_financial_insurance*100/cpi_otherexp),
              real_exp_financial_loans = (exp_financial_loans*100/cpi_otherexp),
              real_exp_financial_other = (exp_financial_other*100/cpi_otherexp),
              real_exp_financial_total = (exp_financial_total*100/cpi_otherexp),
              real_exp_food_cereals_bread = (exp_food_cereals_bread*100/cpi_food_cereals_bread),
              real_exp_food_chicken = (exp_food_chicken*100/cpi_chicken),
              real_exp_food_dairy = (exp_food_dairy*100/cpi_dairy),
              real_exp_food_egg = (exp_food_egg*100/cpi_dairy),
              real_exp_food_fruit = (exp_food_fruit*100/cpi_fruit),
              real_exp_food_meat = (exp_food_meat*100/cpi_chicken),
              real_exp_food_nuts = (exp_food_nuts*100/cpi_fruit),
              real_exp_food_oil = (exp_food_oil*100/cpi_oil),
              real_exp_food_cereals_other = (exp_food_cereals_other*100/cpi_food_cereals_bread),
              real_exp_food_cereals_rice = (exp_food_cereals_rice*100/cpi_food_cereals_bread),
              real_exp_food_spice.other.ingredients = (exp_food_spice.other.ingredients*100/cpi_spice.other.ingredients),
              real_exp_food_sugar = (exp_food_sugar*100/cpi_sugar),
              real_exp_food_tea.coffee = (exp_food_tea.coffee*100/cpi_tea.coffee),
              real_exp_food_vegetable = (exp_food_vegetable*100/cpi_fruit),
              real_exp_food_prepared = (exp_food_prepared*100/cpi_hotel),
              real_exp_food_total = (exp_food_total*100/cpi_food_total)
                    )]
    
    MD[, (cols_cpi) := NULL]

    
    MDSeries <- rbind(MD,MDSeries)
}



calc_cols <- c("a_HHID","a_year" , "a_ID", grep("^calc_", names(MDSeries), value = TRUE))
calcSeries <- MDSeries[, ..calc_cols]

for (i in (1393:1402)) {
  dt <- calcSeries[a_year==i,]
  table_name <- paste0("HH_",i,"_calc")
  assign(table_name,dt)
}



expinc_cols <- c( grep("^a_", names(MDSeries), value = TRUE), grep("^exp_", names(MDSeries), value = TRUE), grep("^inc_", names(MDSeries), value = TRUE))
expincSeries <- MDSeries[, ..expinc_cols]

for (i in (1393:1402)) {
  dt <- expincSeries[a_year==i,]
  table_name <- paste0("HH_",i,"_ExpInc")
  assign(table_name,dt)
}




realexp_cols <- c("a_HHID","a_year" , "a_ID", grep("^real_", names(MDSeries), value = TRUE))
realexpSeries <- MDSeries[, ..realexp_cols]

for (i in (1393:1402)) {
  dt <- realexpSeries[a_year==i,]
  table_name <- paste0("HH_",i,"_RealExp")
  assign(table_name,dt)
}



character_cols <- c("a_HHID","a_year" , "a_ID", grep("^z_", names(MDSeries), value = TRUE))
characterSeries <- MDSeries[, ..character_cols]

for (i in (1393:1402)) {
  dt <- characterSeries[a_year==i,]
  table_name <- paste0("HH_",i,"_Characteristics")
  assign(table_name,dt)
}

rm(list=ls())
    
    library(readxl)
    library(data.table)
    library(stringr)
    library(reshape2)
    library(dplyr)
    library(writexl)
    library(yaml)
    Settings <- yaml.load_file("Settings.yaml")
    
    
    year <- 102
    P1Series <- data.table()
    
    for (year in 95:102) {
      load(file=paste0(Settings$HEISProcessedPath,"Y",year,"MembersProperties.rda"))
      
      P1[,Year:=year]
      P1[, last_digitYear := substr(as.character(Year), nchar(as.character(Year)), nchar(as.character(Year)))]
      
      if (year<100) {
        P1[,Year:=paste0("13",year)]
        
      }else {
        P1[,Year:=paste0("140",last_digitYear)]
      }
      
      
      P1[,ID:=paste0(as.character(Year),as.character(HHID))]
      P1[,last_digitYear:=NULL]
      P1Series <- rbind(P1,P1Series)
      
    }
    
    P1Series <- relocate(P1Series,ID,.before = HHID)
    P1Series <- relocate(P1Series,Year,.before = HHID)
    setnames(x = P1Series,old = "Year" , new = "a_year")
    setnames(x = P1Series,old = "HHID" , new = "a_HHID")
    
    
    for (i in (1395:1402)) {
      dt <- P1Series[a_year==i,]
      table_name <- paste0("HH_",i,"_Personal")
      assign(table_name,dt)
    }
    
    
    
#----
  