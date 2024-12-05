df <-  read.csv(here("Data/IHBS/raw/DecileDistinction.csv"))

data1 <- df %>%
  pivot_longer(cols = ends_with("_Exp.x"), names_to = "Category1", values_to = "value1")
data1 <- data1[,c("HHID","Dcil_Gen_Cons_Nominal","Category1","value1","Year")]
data1$Category1 <- substr(data1$Category1, 1, (nchar(data1$Category1)-6))

data2 <- df %>%
  pivot_longer(cols = ends_with("_Exp.y"), names_to = "Category2", values_to = "value2")
data2 <- data2[,c("HHID","Category2","value2","Year")]
data2$Category2 <- substr(data2$Category2, 1, (nchar(data2$Category2)-6))


## Expenditure reported 10000 Rls per month
data1$value1 <- data1$value1/10000
data2$value2 <- data2$value2/10000

df_IHBS_ExpSeries <- left_join(data1,data2,by=c("Year","HHID"), relationship = "many-to-many")
write.csv(df_IHBS_DecileDistinction, here("Data/IHBS/raw/df_IHBS_ExpSeries.csv"))





df <-  read.csv(here("Data/IHBS/raw/DecileDistinction.csv"))
data1 <- df |>
  select(Decile, value1, Year)


# %>%
#   filter (Year == 96) %>%
#   pivot_longer(cols = ends_with("_Exp.x"), names_to = "Category1", values_to = "value1")
# data1 <- data1[,c("HHID","Dcil_Gen_Cons_Nominal","Category1","value1","Year")]
# data1$Category1 <- substr(data1$Category1, 1, (nchar(data1$Category1)-6))

# data2 <- df |>
#   group_by(HHID, Year) |>
#   summarise(
#     value1 = sum(value1)/10000,
#     Category1 = "Total Expenditure",
#     Decile = mean(Decile),
#     .groups = "drop"
#   ) |>
#   select (HHID, Decile, Category1, value1, Year)
# 
# df_IHBS_DecileDistinction <- rbind(data1, data2) |>
#   filter(Category1 %in% c(
#     # "FoodBeverage",
#     # "HouseEnergy",
#     # "Healthcare",
#     # "Education",
#     # "Investment",
#     "Total Expenditure"))|>
#   rename(Decile = Dcil_Gen_Cons_Nominal)


write.csv(df_IHBS_DecileDistinction, here("Data/IHBS/raw/DecileDistinction.csv"))
