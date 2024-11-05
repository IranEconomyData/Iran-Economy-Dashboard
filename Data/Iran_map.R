
iran_map <- st_read(here("Data/irn_admbnda_adm1_unhcr_20190514.shp"))
iran_map <- iran_map %>%
                mutate( Province = ADM1_EN)


# Load world data for surrounding countries
world <- ne_countries(scale = "medium", returnclass = "sf")

# Load water bodies (e.g., lakes, rivers, seas)
water <- ne_download(scale = "medium", type = "lakes", category = "physical", returnclass = "sf")

# Filter for neighboring countries around Iran
neighboring_countries <- world %>%
  filter(admin %in% c("Afghanistan", "Armenia", "Azerbaijan", "Iraq", "Pakistan", "Kuwait",  
                      "Turkey", "Turkmenistan", "Saudi Arabia", "Oman", "United Arab Emirates"))

# Extract centroids for neighboring countries to place labels
neighboring_countries_centroids <- st_centroid(neighboring_countries)