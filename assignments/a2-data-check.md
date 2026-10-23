# A2: Data inspection and initial cleaning
Name: {Yilin Qiu}
Repository: {https://github.com/yilinq910/Coding-lab-project.git}
Policy question: {Which Chicago community areas have the highest teen birth rates?}
Data source: {Public Health Statistics - Selected public health indicators by Chicago community area - Historical
https://data.cityofchicago.org/Health-Human-Services/Public-Health-Statistics-Selected-public-health-in/iqnk-2tcu/about_data}
Original CSV: data/{Public_Health_Statistics_-_Selected_public_health_indicators_by_Chicago_community_area_-_Historical_20261016.csv}
Script: code/2-explore-clean.R

## Data structure
{The CSV imported as 77 rows and 29 columns. One row represents one Chicago community area.}
{I imported every column as text (col_character) so I could inspect values before converting; no header adjustments were needed.}

## Relevant columns
{Community Area Name: name of the community area; imported as character, kept as character; 0 missing.
Teen Birth Rate: teen birth rate for the community area; imported as character, converted to numeric; 0 missing. The data portal gives no column description, so I could not confirm the unit from this dataset; related Chicago Department of Public Health datasets define teen birth rate as births per 1,000 females aged 15-19, so I assume the same.
Below Poverty Level: poverty measure for the community area; imported as character, converted to numeric; 0 missing. Unit not confirmed in the documentation; I assume a percentage.}

## Cleaning checks and decisions
{Conversions: I converted Teen Birth Rate and Below Poverty Level from character to numeric with parse_number(). Both had 0 missing values before and after conversion, and the first values matched the original text. Community Area Name stayed as text because it is a name, not a quantity.}
{For conversions: Rows removed: 0. The final dimensions are 77 rows and 29 columns. No row is blank, a subtotal, or a note.}
{Other columns in the file have 14 missing entries in total; they are outside the columns I use, so I did not remove any rows.}
{0 duplicated rows, so no decision was needed; the units of the two numeric columns are not confirmed in the documentation.}

## Exploration
{Below Poverty Level >= 30 (a threshold I chose to focus on higher-poverty areas).Selected columns: Community Area Name, Below Poverty Level, Teen Birth Rate. Sorted by Teen Birth Rate, largest first. 13 of 77 rows remain, and each retained row is one community area with a poverty value of at least 30.}
{Across all 77 community areas, the median Teen Birth Rate is 49.2 (range 1.3 to 116.9; mean 50.06), with 0 missing. The unit is assumed to be births per 1,000 females aged 15-19 (unconfirmed). Each value describes one community area, so the median summarizes a group of 77 areas, not individual people.}

## Problems and help needed
{While checking Community Area Name I accidentally ran parse_number() on it, which produced NA for all 77 rows and a warning of 77 parsing failures. I restored the column from raw_data and did not convert names again.}
{The data portal shows no description for Teen Birth Rate, so its unit is unconfirmed.}

## Next step
{The five community areas with the highest teen birth rates (West Englewood, West Garfield Park, North Lawndale, Englewood, New City) all have poverty values of at least 30, so high teen birth rates appear concentrated in higher-poverty areas.}
{Values are community-area level and from a historical dataset, so they hide differences within areas and may not reflect current conditions. Still needs attention: confirm the units and the data year.}