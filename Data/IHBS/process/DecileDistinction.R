

df <-  read.csv("https://media.githubusercontent.com/media/IranEconomyData/Iran-Economy-Dashboard/refs/heads/main/Data/IHBS/raw/ExpSeries2.csv?token=BFOLZG3DJZO7D6TTIU5N7STHI7D7M")
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
    "Total Expenditure"))|>
  rename(Decile = Dcil_Gen_Cons_Nominal)


write.csv(df_IHBS_DecileDistinction, here("Data/IHBS/raw/DecileDistinction.csv"))
