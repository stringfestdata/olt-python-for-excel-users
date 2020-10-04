#### DATA PREP ####
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

region_2$category <- str_to_title(region_2$category)
head(region_2)

# Region 3 -- add the region field
# Yes, just like this!
region_3$region <- 3
head(region_3)

# Now let's bind the rows

sales_report <- bind_rows(region_1, region_2, region_3)
dim(sales_report)


# Did we get everything?
(nrow(region_1) + nrow(region_2) + nrow(region_3)) == nrow(sales_report)


#### DATA ANALYSIS ####

head(sales_report)

# Average sales for each category sorted A-Z

sales_report %>% 
  group_by(category) %>% 
  summarise(avg_sales = mean(sales)) %>% 
  arrange(category)

# Total sales for each region,
# sorted from high to low
sales_report %>% 
  group_by(region) %>% 
  summarise(total_sales = sum(sales)) %>% 
  arrange(desc(total_sales))

# All transactions for regions 1 and 2 sorted 
# by id, leaving region out of the report

sales_report %>% 
  filter(region == 1 | region == 2) %>% 
  select(-region) %>% 
  arrange(id)