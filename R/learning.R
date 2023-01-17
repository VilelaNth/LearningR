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

nhanes_small <-rename(
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

# Filtering rows ----------------------------------------------------------

nhanes_small %>%
  filter(phys_active != "No")
nhanes_small %>%
  filter(
    bmi >= 25,
    phys_active == "No"
  )
nhanes_small %>%
  filter(bmi == 25 |
    phys_active == "No")

# Arranging rows ----------------------------------------------------------

nhanes_small %>%
  arrange(desc(age), bmi, education)


# Mutation columns  -------------------------------------------------------


# Mutating columns --------------------------------------------------------

nhanes_small %>%
  mutate(
    age_month = age * 12,
    logged_bmi = log(bmi),
    age_weeks = age_month * 4,
    old = if_else(
      age >= 30,
      "old",
      "young"
    )
  )


# Exercise 7.12 -----------------------------------------------------------

# 1. BMI between 20 and 40, with diabetes
nhanes_small %>%
    filter(bmi >= 20 & bmi <= 40 & diabetes == "Yes")

# Pipe the data into mutate function and:
nhanes_modified <- nhanes_small %>% # dataset
    mutate(
        mean_arterial_pressure = ((2 * bp_dia_ave) + bp_sys_ave) / 3,
        young_child = if_else(age < 6, "Yes", "No")
    )

nhanes_modified


# Summarizing -------------------------------------------------------------

nhanes_small %>%
    summarise(
        max_bmi = max(bmi)
    )

readr::write_csv(
    nhanes_small,
    here::here("data/nhanes_small.csv")
)

