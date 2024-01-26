#### Preamble ####
# Purpose: Cleans the raw plane data recorded by two observers..... [...UPDATE THIS...]
# Author: Catherine Punnoose
# Date: 24 January 2024 
# Contact: catherine.punnoose@gmail.com
# License: MIT
# Pre-requisites: tidyverse, janitor

#### Workspace setup ####
library(tidyverse)
library(janitor)

#### Clean data ####
raw_data <- read_csv("outputs/data/toronto-shelter-system-flow.csv")

cleaned_data <- clean_names(raw_data)

#### Save data ####
write_csv(cleaned_data, "outputs/data/toronto-shelter-system-flow.csv")
