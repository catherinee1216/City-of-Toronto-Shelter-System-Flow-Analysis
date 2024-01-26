#### Preamble ####
# Purpose: Downloads and saves the data from Open Data Toronto 
# Author: Catherine Punnoose
# Date: 24 Jjanuary 2024
# Contact: catherine.punnoose@mail.utoronto.ca
# License: MIT
# Pre-requisites: opendatatoronto, readr, tidyverse


#### Workspace setup ####
library(opendatatoronto)
library(tidyverse)
library(readr)

#### Download data ####
# Read CSV file into a data frame
shelter_system_flow_packages <- read_csv(here::here("outputs/data/toronto-shelter-system-flow.csv"))
shelter_system_flow_resources <- shelter_system_flow_packages  %>% list_package_resources()

raw_data_collect <- shelter_system_flow_resources[4,] %>% get_resource()

#Cleaning up the data
data_analysis <- clean_names(raw_data_collect)


#### Save data ####
write_csv(raw_data_collect, "outputs/data/toronto-shelter-system-flow.csv") 

         
