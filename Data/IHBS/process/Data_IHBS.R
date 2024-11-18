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
