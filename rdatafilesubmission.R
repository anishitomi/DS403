# Install Packages
# install.packages("tidyverse")
# install.packages("here")
# install.packages("jsonlite")

# Loading Libraries
library(tidyverse)
library(here)
library(jsonlite)

# Reading in the Data
j_cole_album_data <- read_json(here("data/J. Cole.json"), simplifyVector = TRUE)
head(data)


born_sinner_album <- data %>% 
  filter(album == "Born Sinner") %>% 
  select(album) 


# Selecting based on album and filter for 2014 Forest Hills Drive
forest_hills_drive_album <- data %>% 
  filter(album == "2014 Forest Hills Drive") %>% 
  select(album) 

# Saving as a rdata file
save(j_cole_album_data, file = "j_cole_album_data.RData")

