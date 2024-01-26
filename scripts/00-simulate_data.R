#### Preamble ####
# Purpose: Simulates... [...UPDATE THIS...]
# Author: Catherine Punnoose
# Date: 24 January 2024 
# Contact: catherine.punnoose@mail.utoronto.ca
# License: MIT
# Pre-requisites: opendatatoronto


#### Workspace setup ####
library(tidyverse)
library(janitor)

#### Simulate data ####
simulated_data <-
  tibble(
    # Use 1 through to 151 to represent each division
    "id" = 1:151,
    # Randomly pick an option, with replacement, 151 times
    "Population Group" = sample(
      x = c("All Populations", "Chronic", "Families", "Refugees", "Non-Refugees", "Single Adult", "Youth"),
      size = 151,
      replace = TRUE
    )
  )

simulated_data



