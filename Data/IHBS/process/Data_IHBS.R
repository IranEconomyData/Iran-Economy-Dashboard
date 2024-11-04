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



# Food Price----
df_IHBS_Foodprice <- read.csv(here("Data/IHBS/raw/FoodpriceSeries.csv"))

IHBS_Foodprice_data <- function(df, year) {
  df |>
    filter(year == year)
}
