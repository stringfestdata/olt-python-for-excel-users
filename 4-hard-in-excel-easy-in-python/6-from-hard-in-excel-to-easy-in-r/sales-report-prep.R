library(tidyverse)
library(readxl)

region_1  <- read_excel("C:/RFiles/sales_report.xlsx", sheet = "region_1")
head(region_1)

region_2  <- read_excel("C:/RFiles/sales_report.xlsx", sheet = "region_2")
head(region_2)

region_3  <- read_excel("C:/RFiles/sales_report.xlsx", sheet = "region_3")
head(region_3)

# Region 2 -- convert to proper/title case
# There's a package (or several) for that!
# stringr comes with tidyverse
# Equivalent to PROPER() in Excel 

region_2$category <- str_to_title(region_2$category)
head(region_2)

# Region 3 -- add the region field
# Yes, just like this!
region_3$region <- 3
head(region_3)

# Now let's bind the rows
# bind_rows from dplyr

sales_report <- bind_rows(region_1, region_2, region_3)
dim(sales_report)


# Did we get everything?
(nrow(region_1) + nrow(region_2) + nrow(region_3)) == nrow(sales_report)

