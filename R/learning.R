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

# Fixing variable names ---------------------------------------------------

nhanes_small <- rename_with(
  nhanes_small,
  snakecase::to_snake_case
)
nhanes_small
nhanes_small

nhanes_small <- rename
rename(
  nhanes_small,
  sex = gender
)

# Piping ------------------------------------------------------------------

colnames(nhanes_small)

nhanes_small %>%
  colnames()
nhanes_small %>%
  select(phys_active) %>%
  rename(physically_active = phys_active)
nhanes_small %>%
  select(bp_sys_ave, education)
nhanes_small %>%
  rename(
    bp_sys = bp_sys_ave,
    bp_dia = bp_sys_ave
  )
nhanes_small %>%
  select(bmi, contains("age"))
nhanes_small %>%
  select(starts_with("bp_")) %>%
  rename(bp_systolic = bp_sys_ave)

# 1. Select specific columns
nhanes_small %>%
  select(bp_sys_ave, education)

# 2. Rename columns
nhanes_small %>%
  rename(
    bp_sys = bp_sys_ave,
    bp_dia = bp_dia_ave
  )

# 3. Re-write with pipe
nhanes_small %>%
  select(bmi, contains("age"))

# 4. Re-write with pipe
nhanes_small %>%
  select(starts_with("bp_")) %>%
  rename(bp_systolic = bp_sys_ave)
