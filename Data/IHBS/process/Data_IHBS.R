library(here)

# Expenditure-Income Share----
df_IHBS_ExpInc_Share <- read.csv(here("Data/IHBS/raw/ExpIncShareSeries.csv"))

IHBS_ExpInc_Share_data <- function(df, year, type) {
  df |>
    filter(Year == year,
           Type == type,
           GEO == "Iran")
}

# Total Expenditure-Income----
df_IHBS_Total_ExpInc <- read.csv(here("Data/IHBS/raw/TotalExpInc.csv"))

IHBS_Total_ExpInc_data <- function(df, region, type) {
  df |>
    filter(Region == region,
           Type == type)
}

# Total Expenditure-Income----
df_IHBS_ExpIncSeries <- read.csv(here("Data/IHBS/raw/EXPINCSeries.csv"))

IHBS_ExpInc_Series_data <- function(df, region, type, year) {
  df |>
    filter(region == region,
           Type == type,
           Year == year)
}







df_IHBS_FGrams_Per <- read.csv(here("Data/IHBS/raw/FGrams_perSeries.csv"))

IHBS_FGrams_Per_data <- function(df, year) {
  df |>
    filter(Year == year,
           GEO == "Iran")
}


df_IHBS_GiniFood <- read.csv(here("Data/IHBS/raw/GiniFoodDataSeries.csv"))

IHBS_GiniFood_data <- function(df, year) {
  df |>
    filter(Year == year,
           GEO == "Iran")
}



# Food Expenditure Province----
df_IHBS_Food_exp_prov <- read.csv(here("Data/IHBS/raw/TFoodExpPerProvSeries.csv"))
df_IHBS_Food_exp_prov <- df_IHBS_Food_exp_prov %>%
  mutate(Province = recode(Province,
                           "East Azarbaijan" = "East Azerbaijan",
                           "West Azarbaijan" = "West Azerbaijan",
                           "Esfahan" = "Isfahan",
                           "Kohkiluyeh and Buyer Ahmad" = "Kohgiluyeh and Boyer-Ahmad",
                           "Sistan and Baluchistan" = "Sistan and Baluchestan",
                           "Chahar Mahaal and Bakhtiari" = "Chaharmahal and Bakhtiari"))
                                                            

IHBS_Food_exp_prov_data <- function(df, year) {
  df |>
    filter(Year == year)
}


# Cumulative Share of food items----
df_IHBS_Cumulative_Share <- read.csv(here("Data/IHBS/raw/Cumulative Expenditure Food Share Dec Series.csv"))

IHBS_Cumulative_Share_data <- function(df, variable, year) {
  df |>
    filter(Variable == variable,
           Year == year)
}


# Change price and consumption of food items based on year 1387----
df_IHBS_ChangeFoodItems <- read.csv(here("Data/IHBS/raw/ChangeFoodItems.csv"))

IHBS_ChangeFoodItems_data <- function(df, variable, decile) {
  df |>
    filter(Variable == variable,
           Decile == decile)
}

# Price Elasticity----
df_IHBS_PriceElastisity <- read.csv(here("Data/IHBS/raw/PriceElastisity.csv"))

IHBS_PriceElastisity_data <- function(df, category, type) {
  df |>
    filter(Category == category,
           Type == type)
}



# Expenditure Elasticity----
df_IHBS_ExpenditureElasticity <- read.csv(here("Data/IHBS/raw/ExpenditureElasticity.csv"))

IHBS_ExpenditureElastisity_data <- df_IHBS_ExpenditureElasticity 



# Expenditure Elasticity----
df_IHBS_ExpenditureElasticityNew <- read.csv(here("Data/IHBS/raw/ExpenditureElasticityNew.csv"))

IHBS_ExpenditureElastisityNew_data <- df_IHBS_ExpenditureElasticityNew 



# Price Elasticity----
df_IHBS_PriceElastisityNew <- read.csv(here("Data/IHBS/raw/PriceElastisityNew.csv"))

IHBS_PriceElastisityNew_data <- function(df, category, type) {
  df |>
    filter(Category == category,
           Type == type)
}


# Expenditure category to category ----
df_IHBS_ExpSeries <- read.csv(here("Data/IHBS/raw/ExpSeries2.csv"))

library(tidyr)
data1 <- df_IHBS_ExpSeries %>%
  pivot_longer(cols = ends_with("_Exp.x"), names_to = "Category1", values_to = "value1")
data1 <- data1[,c("HHID","Dcil_Gen_Cons_Nominal","Category1","value1","Year")]
data1$Category1 <- substr(data1$Category1, 1, (nchar(data1$Category1)-6))

data2 <- df_IHBS_ExpSeries %>%
  pivot_longer(cols = ends_with("_Exp.y"), names_to = "Category2", values_to = "value2")
data2 <- data2[,c("HHID","Category2","value2","Year")]
data2$Category2 <- substr(data2$Category2, 1, (nchar(data2$Category2)-6))


## Expenditure reported 10000 Rls per month
data1$value1 <- data1$value1/10000
data2$value2 <- data2$value2/10000


library(dplyr)
df_IHBS_ExpSeries <- left_join(data1,data2,by=c("Year","HHID"), relationship = "many-to-many")


IHBS_ExpSeries_data <- function(df, year,category1,category2) {

  df |>
    filter(Year == year,
           Category1 == category1,
           Category2 == category2)
}



# Expenditure Share trend by each decile and subgroup ----

df_IHBS_ExpShareRDecSeries <-  read.csv(here("Data/IHBS/raw/ExpShareRDecSeries.csv"))

IHBS_ExpShareRDecSeries_data <- function(df, decile,variable) {
  df |>
    filter(Decile == decile,
           Variable == variable)
}

# IHBS_DecileDistinciton

 
  # Temporary
  df <-  read.csv(here("Data/IHBS/raw/ExpSeries2.csv"))
  data1 <- df %>%
    filter (Year == 96) %>%
    pivot_longer(cols = ends_with("_Exp.x"), names_to = "Category1", values_to = "value1")
  data1 <- data1[,c("HHID","Dcil_Gen_Cons_Nominal","Category1","value1","Year")]
  data1$Category1 <- substr(data1$Category1, 1, (nchar(data1$Category1)-6))

  data2 <- data1 |>
    group_by(HHID, Year) |>
    summarise(
      value1 = sum(value1)/10000,
      Category1 = "Total Expenditure",
      Dcil_Gen_Cons_Nominal = mean(Dcil_Gen_Cons_Nominal),
      .groups = "drop"
    ) |>
    select (HHID, Dcil_Gen_Cons_Nominal, Category1, value1, Year)

  df_IHBS_DecileDistinction <- rbind(data1, data2) |>
    filter(Category1 %in% c(
                            # "FoodBeverage",
                            # "HouseEnergy",
                            # "Healthcare",
                            # "Education",
                            # "Investment",
                            "Total Expenditure"))


write.csv(df_IHBS_DecileDistinction, here("Data/IHBS/raw/DecileDistinction.csv"))

IHBS_DecileDistinction_data <- function(df, year , variable) {
  
    
  df |>
    filter(Year == year,
           Category1 == variable)
}
