#### Preamble ####
# Purpose: Tests simulated Toronto LRT delay data.
# Author: Gerry Peng
# Date: 24 September 2026
# License: MIT

#### Workspace setup ####
library(tidyverse)
library(testthat)

#### Read data ####
simulated_data <- read_csv(
  "data/00-simulated_data/simulated_data.csv",
  show_col_types = FALSE
)

#### Tests ####
#checking structure of our data
test_that("Simulated data has expected structure", {
  expected_columns <- c(
    "date",
    "line",
    "station",
    "code",
    "min_delay",
    "min_gap"
  )
#column names should match
  expect_equal(
    names(simulated_data),
    expected_columns)

  expect_equal( #we generated 500 rows
    nrow(simulated_data),
    500)
})
#looking at actual data values
test_that("Simulated data has proper values", {
  valid_lines <- c("EC", "FW")
  line_check <- all(
    simulated_data$line %in% valid_lines  #checking if the string matches anything in valid_lines
  )
  delay_check <- all(
    simulated_data$min_delay > 0
  )
  gap_check <- all(
    simulated_data$min_gap > 0
  )
  #ensuring all return true
  expect_true(line_check)
  expect_true(delay_check)
  expect_true(gap_check)
})

test_that("Simulated data doesn't have missing/empty values", {
  missing_check <- all(
    !is.na(simulated_data) #checks all entries for empty
  )
  station_check <- all(
    simulated_data$station != ""
  )
  expect_true(missing_check)
  expect_true(station_check)
})

test_that("Dates are within the expected range", {
  date_check <- all(
    simulated_data$date>= as.Date("2025-12-01") & simulated_data$date <= as.Date("2026-08-31")) #converts to Date then comparing
  expect_true(date_check)
})