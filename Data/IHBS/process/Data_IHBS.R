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