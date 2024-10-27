# Expenditure-Income Share----
df_IHBS_ExpInc_Share <- read.csv("C:/Users/mehdi/Iran-Economy-Dashboard/Data/IHBS/raw/ExpIncShareSeries.csv")

IHBS_ExpInc_Share_data <- function(df, year, type) {
  df |>
    filter(Year == year,
           Type == type,
           GEO == "Iran")
}
