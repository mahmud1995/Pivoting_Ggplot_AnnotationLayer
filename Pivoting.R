######### Pivoting ##########

library(tidyr)
library(dplyr)
library(readr)

head(relig_income)
View(relig_income)
col_number(relig_income)
str(relig_income)
 

pivoted_longer <- relig_income %>% 
  pivot_longer(
    cols = !religion,
    names_to = "income",
    values_to = "count"
  )
View(pivoted_longer)
# cols() describes which column need to reshaped. In this case, every column apart from religion.
# names_to gives the name of variable that will be created from the data stored in the column names.
# values_to() gives the name of the variable that will be created from the data stored in the cell value.

# # # Numeric data in column names

View(billboard)

pivoted_longer_billboard<-billboard %>% 
  pivot_longer(
    cols = starts_with("wk"),
    names_to = "week",
    values_to= "rank",
    values_drop_na =TRUE
  )
View(pivoted_longer_billboard)

# To see each song how long stayed in the charts

pivoted_longer_bill<- billboard %>% 
  pivot_longer(
    cols = starts_with("wk"),
    names_to = "week",
    names_prefix = "wk",
    names_transform = as.integer,
    values_to = "rank",
    values_drop_na = TRUE,
  )

billboard_longer_parse <- billboard %>% 
  pivot_longer(
    cols = starts_with("wk"),
    names_to = "week",
    names_transform = readr::parse_number,
    values_to = "rank",
    values_drop_na = TRUE
  )

# Many variables in column names
View(who)
# country, iso2, iso3 and year are variables and new_sp_m014 to newrel_f65 encode four variables in their names
who_1 <- who %>% 
  pivot_longer(
    cols = new_sp_m014:newrel_f65,
    names_to = c("diagnosis", "gender", "age"),
    name_pattern = "new_?(.8)_(.)(.*)",
    values_to = "count"
  )

# Now, we use readr functions to convert the gender and age to factors.
who_2<-who %>% 
  pivot_longer(
    cols = new_sp_m014:newrel_f65,
    names_to = c("diagnosis", "gender", "age"),
    names_pattern = "new_?(.*)_(.)(.*)",
    names_transform = list(
      gender = ~ readr::parse_factor(.x, levels = c("f", "m")),
      age = ~ readr::parse_factor(
        .x, 
        levels = c("014", "1524", "2534", "3544", "4554", "5564", "65"),
        ordered = TRUE
      )
    ),
    values_to = "count",
  )
View(household)

# PANEL DATA - provided by Thomas
pnl <- tibble(
  x = 1:4,
  a = c(1, 1,0, 0),
  b = c(0, 1, 1, 1),
  y1 = rnorm(4),
  y2 = rnorm(4),
  z1 = rep(3, 4),
  z2 = rep(-2, 4),
)

pnl %>% 
  pivot_longer(
    cols = !c(x,a,b),
    names_to = c(".value", "time"),
    names_pattern = "(.)(.)"
  )

View(fish_encounters)
fish_encounters_1 <- fish_encounters %>% 
  pivot_wider(
    names_from = station,
    values_from = seen
  )
View(fish_encounters_1)
