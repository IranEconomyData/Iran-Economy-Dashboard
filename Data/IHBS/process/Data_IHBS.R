library(here)

# Expenditure-Income Share----
# df_IHBS_ExpInc_Share <- read.csv(here("Data/IHBS/raw/ExpIncShareSeries.csv"))
# 
# IHBS_ExpInc_Share_data <- function(df, year, type) {
#   df |>
#     filter(Year == year,
#            Type == type,
#            GEO == "Iran")
# }
# 
# # Total Expenditure-Income----
# df_IHBS_Total_ExpInc <- read.csv(here("Data/IHBS/raw/TotalExpInc.csv"))
# 
# IHBS_Total_ExpInc_data <- function(df, region, type) {
#   df |>
#     filter(Region == region,
#            Type == type)
# }
# 
# # Total Expenditure-Income----
# df_IHBS_ExpIncSeries <- read.csv(here("Data/IHBS/raw/EXPINCSeries.csv"))
# 
# IHBS_ExpInc_Series_data <- function(df, region, type, year) {
#   df |>
#     filter(region == region,
#            Type == type,
#            Year == year)
# }
# 
# 
# 
# 
# 
# 
# 
# df_IHBS_FGrams_Per <- read.csv(here("Data/IHBS/raw/FGrams_perSeries.csv"))
# 
# IHBS_FGrams_Per_data <- function(df, year) {
#   df |>
#     filter(Year == year,
#            GEO == "Iran")
# }
# 
# 
# df_IHBS_GiniFood <- read.csv(here("Data/IHBS/raw/GiniFoodDataSeries.csv"))
# 
# IHBS_GiniFood_data <- function(df, year) {
#   df |>
#     filter(Year == year,
#            GEO == "Iran")
# }
# 
# 
# 
# # Food Expenditure Province----
# df_IHBS_Food_exp_prov <- read.csv(here("Data/IHBS/raw/TFoodExpPerProvSeries.csv"))
# df_IHBS_Food_exp_prov <- df_IHBS_Food_exp_prov %>%
#   mutate(Province = recode(Province,
#                            "East Azarbaijan" = "East Azerbaijan",
#                            "West Azarbaijan" = "West Azerbaijan",
#                            "Esfahan" = "Isfahan",
#                            "Kohkiluyeh and Buyer Ahmad" = "Kohgiluyeh and Boyer-Ahmad",
#                            "Sistan and Baluchistan" = "Sistan and Baluchestan",
#                            "Chahar Mahaal and Bakhtiari" = "Chaharmahal and Bakhtiari"))
#                                                             
# 
# IHBS_Food_exp_prov_data <- function(df, year) {
#   df |>
#     filter(Year == year)
# }
# 
# 
# # Cumulative Share of food items----
# df_IHBS_Cumulative_Share <- read.csv(here("Data/IHBS/raw/Cumulative Expenditure Food Share Dec Series.csv"))
# 
# IHBS_Cumulative_Share_data <- function(df, variable, year) {
#   df |>
#     filter(Variable == variable,
#            Year == year)
# }
# 
# 
# # Change price and consumption of food items based on year 1387----
# df_IHBS_ChangeFoodItems <- read.csv(here("Data/IHBS/raw/ChangeFoodItems.csv"))
# 
# IHBS_ChangeFoodItems_data <- function(df, variable, decile) {
#   df |>
#     filter(Variable == variable,
#            Decile == decile)
# }
# 
# # Price Elasticity----
# df_IHBS_PriceElastisity <- read.csv(here("Data/IHBS/raw/PriceElastisity.csv"))
# 
# IHBS_PriceElastisity_data <- function(df, category, type) {
#   df |>
#     filter(Category == category,
#            Type == type)
# }
# 
# 
# 
# # Expenditure Elasticity----
# df_IHBS_ExpenditureElasticity <- read.csv(here("Data/IHBS/raw/ExpenditureElasticity.csv"))
# 
# IHBS_ExpenditureElastisity_data <- df_IHBS_ExpenditureElasticity 
# 
# 
# 
# # Expenditure Elasticity----
# df_IHBS_ExpenditureElasticityNew <- read.csv(here("Data/IHBS/raw/ExpenditureElasticityNew.csv"))
# 
# IHBS_ExpenditureElastisityNew_data <- df_IHBS_ExpenditureElasticityNew 
# 
# 
# 
# # Price Elasticity----
# df_IHBS_PriceElastisityNew <- read.csv(here("Data/IHBS/raw/PriceElastisityNew.csv"))
# 
# IHBS_PriceElastisityNew_data <- function(df, category, type) {
#   df |>
#     filter(Category == category,
#            Type == type)
# }
# 
# 
# # Expenditure category to category ----
# 
# IHBS_ExpSeries_data <- function(df, year,category1,category2) {
# 
#   df |>
#     filter(Year == year,
#            Category1 == category1,
#            Category2 == category2)
# }
# 
# 
# 
# # Expenditure Share trend by each decile and subgroup ----
# 
# df_IHBS_ExpShareRDecSeries <-  read.csv(here("Data/IHBS/raw/ExpShareRDecSeries.csv"))
# 
# IHBS_ExpShareRDecSeries_data <- function(df, decile,variable) {
#   df |>
#     filter(Decile == decile,
#            Variable == variable)
# }
# 
# # IHBS_DecileDistinciton
# #<<<<<<< HEAD
# 
#  
#   
#                   #   df <-  read.csv(here("Data/IHBS/raw/ExpSeries2.csv"))
#                   #   data1 <- df %>%
#                   #     filter (Year == 96) %>%
#                   #     pivot_longer(cols = ends_with("_Exp.x"), names_to = "Category1", values_to = "value1")
#                   #   data1 <- data1[,c("HHID","Dcil_Gen_Cons_Nominal","Category1","value1","Year")]
#                   #   data1$Category1 <- substr(data1$Category1, 1, (nchar(data1$Category1)-6))
#                   #   
#                   #   data2 <- data1 |>
#                   #     group_by(HHID, Year) |>
#                   #     summarise(
#                   #       value1 = sum(value1)/10000,
#                   #       Category1 = "Total Expenditure",
#                   #       Dcil_Gen_Cons_Nominal = mean(Dcil_Gen_Cons_Nominal),
#                   #       .groups = "drop"
#                   #     ) |>
#                   #     select (HHID, Dcil_Gen_Cons_Nominal, Category1, value1, Year)
#                   #   
#                   #   df_IHBS_DecileDistinction <- rbind(data1, data2) |>
#                   #     filter(Category1 %in% c(
#                   #                             # "FoodBeverage",
#                   #                             # "HouseEnergy",
#                   #                             # "Healthcare",
#                   #                             # "Education",
#                   #                             # "Investment",
#                   #                             "Total Expenditure"))
#                   # 
#                   # 
#                   # 
#                   # 
#                   # IHBS_DecileDistinction_data <- function(df, year , variable) {
#                   #   
#                   #     
#                   #   df |>
#                   #     filter(Year == year,
#                   #            Category1 == variable)
#                   # }
#                   # 
#                   # 
#                   # 
# 
# 
# 
# 
# #=======
# # 
# # df_IHBS_DecileDistinction <-  read.csv(here("Data/IHBS/raw/DecileDistinction.csv"))
# # df_IHBS_DecileDistinction <- df_IHBS_DecileDistinction |>
# #   select(Decile, value1, Year)
# # 
# # IHBS_DecileDistinction_data <- function(df, year , variable) {
# #   
# #   df |>
# #     filter(Year == year)
# # }
# #>>>>>>> 90a50a2adafe00c6ee2e8cb83f5b97cb447ca533
# 
# 
# 
# 
# 
# #Real Expenditure & Income Province----
# df_IHBS_RealExpIncProv <- read.csv(here("Data/IHBS/raw/RealExpIncProvSeries.csv"))
# df_IHBS_RealExpIncProv <- df_IHBS_RealExpIncProv %>%
#   mutate(Province = recode(Province,
#                            "East Azarbaijan" = "East Azerbaijan",
#                            "West Azarbaijan" = "West Azerbaijan",
#                            "Esfahan" = "Isfahan",
#                            "Kohkiluyeh and Buyer Ahmad" = "Kohgiluyeh and Boyer-Ahmad",
#                            "Sistan and Baluchistan" = "Sistan and Baluchestan",
#                            "Chahar Mahaal and Bakhtiari" = "Chaharmahal and Bakhtiari"))
# 
# 
# IHBS_RealExpIncProv_data <- function(df, year,type) {
#   df |>
#     filter(Year == year,
#            Type == type)
# }
# 
# 
# 
# # Real Exp Income per decile----
# df_IHBS_RealExpIncDec <- read.csv(here("Data/IHBS/raw/RealExpIncDecSeries.csv"))
# 
# IHBS_RealExpIncDec_data <- function(df, year, type) {
#   df |>
#     filter(Year == year,
#            Type == type)
# }
# 
# 
# 
# 
# 
# #Expenditure Share of each groups----
# df_IHBS_ExpShareProv <- read.csv(here("Data/IHBS/raw/ExpShareProvSeries.csv"))
# df_IHBS_ExpShareProv <- df_IHBS_ExpShareProv %>%
#   mutate(Province = recode(Province,
#                            "East Azarbaijan" = "East Azerbaijan",
#                            "West Azarbaijan" = "West Azerbaijan",
#                            "Esfahan" = "Isfahan",
#                            "Kohkiluyeh and Buyer Ahmad" = "Kohgiluyeh and Boyer-Ahmad",
#                            "Sistan and Baluchistan" = "Sistan and Baluchestan",
#                            "Chahar Mahaal and Bakhtiari" = "Chaharmahal and Bakhtiari"))
# 
# 
# IHBS_ExpShareProv_data <- function(df, year,variable) {
#   df |>
#     filter(Year == year,
#            Variable == variable)
# }
# 




#=======

df_IHBS_MetaData <-  read.csv(here("Data/IHBS/raw/MetaDataSeriesExpInc.csv"))


IHBS_MetaData_data <- function(df, year, type) {

  df |>
    filter(Year == year,
           Type == type)
}



df_IHBS_MetaData2 <-  read.csv(here("Data/IHBS/raw/MetaData2SeriesExpInc.csv"))


IHBS_MetaData2_data <- function(df, year, type) {
  
  df |>
    filter(Year == year,
           Type == type)
}
#----


# 
# 
# #=======
# 
# df_IHBS_MetaDataTotal <-  read.csv(here("Data/IHBS/raw/MetaDataTotal.csv"))
# 
# 
# IHBS_MetaDataTotal_data <- function(df, year, variable) {
# 
#   df |>
#     filter(Year == year,
#            Variable == variable)
# }
# #----
# 
# 
# 
# #=======
# 
# df_IHBS_TenureDec <-  read.csv(here("Data/IHBS/raw/TenureDecSeries.csv"))
# 
# 
# IHBS_TenureDec_data <- function(df, year,region) {
#   
#   df |>
#     filter(Year == year,
#            Region == region)
# }
# #----
# 
# 
# 
# #=======
# 
# df_IHBS_SizeDec <-  read.csv(here("Data/IHBS/raw/SizeDecSeries.csv"))
# 
# 
# IHBS_SizeDec_data <- function(df, year,region) {
#   
#   df |>
#     filter(Year == year,
#            Region == region)
# }
# #----
# 
# 
# #=======
# 
# df_IHBS_HEduProv <-  read.csv(here("Data/IHBS/raw/HEduProvSeries.csv"))
# 
# df_IHBS_HEduProv <- df_IHBS_HEduProv %>%
#   mutate(Province = recode(Province,
#                            "East Azarbaijan" = "East Azerbaijan",
#                            "West Azarbaijan" = "West Azerbaijan",
#                            "Esfahan" = "Isfahan",
#                            "Kohkiluyeh and Buyer Ahmad" = "Kohgiluyeh and Boyer-Ahmad",
#                            "Sistan and Baluchistan" = "Sistan and Baluchestan",
#                            "Chahar Mahaal and Bakhtiari" = "Chaharmahal and Bakhtiari"))
# 
# IHBS_HEduProv_data <- function(df, year,region , category) {
#   
#   df |>
#     filter(Year == year,
#            Region == region,
#            Category== category)
# }
# #----
# 
# 
# 
# #=======
# 
# df_IHBS_HActivityState <-  read.csv(here("Data/IHBS/raw/HActivityStateSeries.csv"))
# 
# 
# IHBS_HActivityState_data <- function(df, year,region) {
#   
#   df |>
#     filter(Year == year,
#            Region == region)
# }
# #----
# 
# 
# 
# 
# #=======

df_IHBS_CorrelExpShareMeterPrice <-  read.csv(here("Data/IHBS/raw/CorrelExpShareMeterPriceSeries.csv"))


IHBS_CorrelExpShareMeterPrice_data <- function(df, year,variable) {

  df |>
    filter(Year == year,
           Variable == variable)
}
#----
