  library(tidyverse)
getwd()  
list.files("data")

data_file <- file.path("data", "Public_Health_Statistics_-_Selected_public_health_indicators_by_Chicago_community_area_-_Historical_20261016.csv")
raw_data <- read_csv(
  data_file,
  col_types = cols(.default = col_character())
)
head(raw_data)
names(raw_data)
dim(raw_data)
nrow(raw_data)
ncol(raw_data)
names(raw_data)
head(raw_data)
glimpse(raw_data)
View(raw_data)
clean_data <- raw_data
colSums(is.na(clean_data))
sum(duplicated(clean_data))

class(raw_data[["Teen Birth Rate"]])
head(raw_data[["Teen Birth Rate"]])
sum(is.na(raw_data[["Teen Birth Rate"]]))
clean_data[["Teen Birth Rate"]] <-
  parse_number(raw_data[["Teen Birth Rate"]])
class(clean_data[["Teen Birth Rate"]])
head(clean_data[["Teen Birth Rate"]])
sum(is.na(clean_data[["Teen Birth Rate"]]))

class(clean_data[["Below Poverty Level"]])
head(clean_data[["Below Poverty Level"]])
sum(is.na(clean_data[["Below Poverty Level"]]))

class(clean_data[["Community Area Name"]])
head(clean_data[["Community Area Name"]])
sum(is.na(clean_data[["Community Area Name"]]))

class(raw_data[["Below Poverty Level"]])
head(raw_data[["Below Poverty Level"]])
sum(is.na(raw_data[["Below Poverty Level"]]))
clean_data[["Below Poverty Level"]] <-
  parse_number(raw_data[["Below Poverty Level"]])
class(clean_data[["Below Poverty Level"]])
head(clean_data[["Below Poverty Level"]])
sum(is.na(clean_data[["Below Poverty Level"]]))

class(raw_data[["Community Area Name"]])
head(raw_data[["Community Area Name"]])
sum(is.na(raw_data[["Community Area Name"]]))
class(clean_data[["Community Area Name"]])
head(clean_data[["Community Area Name"]])
clean_data[["Community Area Name"]] <- raw_data[["Community Area Name"]]
class(clean_data[["Community Area Name"]])
head(clean_data[["Community Area Name"]])
sum(is.na(clean_data[["Community Area Name"]]))

dim(clean_data)
glimpse(clean_data)
colSums(is.na(clean_data))
sum(duplicated(clean_data))

data_subset <- clean_data %>%
  filter(`Below Poverty Level` >= 30) %>%
  select(`Community Area Name`, `Below Poverty Level`, `Teen Birth Rate`) %>%
  arrange(desc(`Teen Birth Rate`))
head(data_subset)
nrow(data_subset)

summary(clean_data[["Teen Birth Rate"]])
sum(is.na(clean_data[["Teen Birth Rate"]]))
# Result: The median Teen Birth Rate across the 77 community areas is 49.2.
# Units: The data portal provides no column description for Teen Birth Rate.
# What it describes: each value is one community area's rate, so the median
#   summarizes the middle of 77 community areas (a group of observations),
#   not individual people.
# Missing values: 0.