10

# R basics ----------------------------------------------------------------

weigth_kilos <- 100
weigth_kilos <- 10

colnames(airquality)

str(airquality)

summary(airquality)



# Packages ----------------------------------------------------------------

library(tidyverse)
r3::check_git_config()
# This will be used to testing out Git

library(tidyverse)
library(NHANES)


# Looking at data ---------------------------------------------------------

glimpse(NHANES)

select(NHANES, Age, Weight, BMI)

select(NHANES, -HeadCirc)
select(NHANES, starts_with("BP"))

select(NHANES, ends_with("Day"))
select(NHANES, contains("Age"))

nhanes_small <-
  select(
    NHANES,
    Age,
    Gender,
    BMI,
    Diabetes,
    PhysActive,
    BPSysAve,
    BPDiaAve,
    Education
  )
