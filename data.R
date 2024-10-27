
years <- 87:88

# Use a for loop to load each library dynamically
for (year in years) {
  devtools::install_github(paste0("IranEconomyData/IHBS/IHBS.", year))
  library(paste0("IHBS.", year), character.only = TRUE)
}
library(IHBS.87)
httr::GET("https://api.github.com/rate_limit")
download.file("https://api.github.com/repos/IranEconomyData/IHBS/tarball/HEAD", 
              "IHBS.tar.gz", 
              method = "curl")
download.file("https://api.github.com/repos/IranEconomyData/IHBS/tarball/HEAD", 
              "IHBS.tar.gz")
