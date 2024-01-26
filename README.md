# Starter folder

## Overview

The repository provides an analysis of the dataset *Toronto’s Shelter System Flow* from Open Data Toronto. The report goes over the number of individuals who are actively homeless, became inactive, moved to permanent housing, and returned from permanent housing in the years 2018 and 2023. An analysis is done to understand if there has been an increase of individuals experiencing homelessness in Toronto in 2023 compared to 2018. 

## File Structure

The repo is structured as:

-   `input/data` contains the data sources used in analysis including the raw data.
-   `outputs/data` contains the cleaned dataset that was constructed.
-   `outputs/paper` contains the files used to generate the paper, including the Quarto document and reference bibliography file, as well as the PDF of the paper. 
-   `scripts` contains the R scripts used to simulate, download and clean data.

# LLM Usage 

ChatGPT 3.5 was used to assit in code debugging. 

### User: "how would show data only from december 2018?"

ChatGPT 3.5: "
To filter the data to show only observations from December 2018, you can use the filter function from the dplyr package. Here's an example of how to modify your code:

```{r}
Copy code
# Read CSV file into a data frame
data_analysis <- read_csv(here::here("outputs/data/toronto-shelter-system-flow.csv"))

# Filter data for December 2018
data_december_2018 <- data_analysis %>%
  filter(`date(mmm-yy)` == "Dec-18")

# Stacked bar graph for actively_homeless in December 2018
ggplot(data_december_2018, aes(x = population_group, fill = factor(actively_homeless))) +
  geom_bar(stat = "count", position = "stack") +
  labs(x = "Population group", y = "Count", fill = "Status") +
  theme_minimal()
In this code:

filter(date(mmm-yy) == "Dec-18") filters the data to include only rows where the date(mmm-yy) column is equal to "Dec-18".
```

The rest of the code is similar to the previous example, but it now operates on the filtered data for December 2018.
Adjust the column names and variable names based on your actual dataset structure."

### User: "the bar graph displays the correct data in the legend but not in the graph, how can i fix this?"

ChatGPT 3.5: "If the legend displays the correct data, but the bars in the graph do not seem correct, there might be an issue with how the data is mapped to the aesthetics inside the ggplot function. Ensure that the variables and factor levels are correctly specified. Additionally, make sure that the data in the filtered subset (data_december_2018) has the expected structure.

Here's a revised version of the code with some additional checks:

```{r}
Copy code
# Read CSV file into a data frame
data_analysis <- read_csv(here::here("outputs/data/toronto-shelter-system-flow.csv"))

# Filter data for December 2018
data_december_2018 <- data_analysis %>%
  filter(`date(mmm-yy)` == "Dec-18")

# Check the structure of data_december_2018
str(data_december_2018)

# Stacked bar graph for actively_homeless in December 2018
ggplot(data_december_2018, aes(x = population_group, fill = factor(actively_homeless))) +
  geom_bar(stat = "count", position = "stack") +
  labs(x = "Population group", y = "Count", fill = "Status") +
  theme_minimal()
```
The str(data_december_2018) line prints the structure of the filtered data frame in the console. Check if the column names and data types match your expectations. If there are any discrepancies, adjust the code accordingly.

If the issue persists, please provide more details about the structure of your dataset and any error messages you are encountering, if any."

### User: "how to show only activley_homeless data?"

ChatGPT 3.5: "f you want to create a table showing only the data related to actively homeless individuals from the filtered dataset for December 2018, you can use the filter function and then display the table using the kable and kableExtra packages. Here's an example:

r
Copy code
# Load required packages
library(knitr)
library(kableExtra)

# Read CSV file into a data frame
data_analysis <- read_csv(here::here("outputs/data/toronto-shelter-system-flow.csv"))

# Filter data for December 2018
data_december_2018 <- data_analysis %>%
  filter(`date(mmm-yy)` == "Dec-18")

# Filter for actively_homeless
actively_homeless_data <- data_december_2018 %>%
  filter(Status == "Actively Homeless")

# Display the actively homeless data in a table
actively_homeless_data %>%
  kable("html") %>%
  kable_styling(full_width = FALSE)

```
This code filters the data_december_2018 dataset for rows where the "Status" column is "Actively Homeless" and then displays the resulting table. Adjust column names and filter criteria based on your actual dataset structure."

