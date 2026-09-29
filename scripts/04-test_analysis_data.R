#### Preamble ####
# Purpose: Tests the cleaned Toronto LRT delay analysis data, similar to checks done on the simulated data.
# Author: Gerry Peng
# Date: 25 September 2026
# License: MIT

#### Workspace setup ####
library(tidyverse)
library(arrow)
library(testthat)

#### Read data ####
analysis_data <- read_parquet("data/02-analysis_data/analysis_data.parquet") #data the paper will use

#### Tests ####
test_that("analysis data has the expected structure", { #checking column names and row count
  expected_columns <- c(
    "date",
    "line",
    "time",
    "day",
    "station",
    "code",
    "min_delay",
    "min_gap"
  )
  expect_equal(
    names(analysis_data),
    expected_columns
  )
  expect_equal(
    nrow(analysis_data),
    4562
  )
})

test_that("variables have correct type", {
  date_check <- is.Date(analysis_data$date)
  delay_check <- is.numeric(analysis_data$min_delay)
  gap_check <- is.numeric(analysis_data$min_gap)
  expect_true(date_check)
  expect_true(delay_check)
  expect_true(gap_check)
})

test_that("Analysis data has no missing values", {
  missing_check <- any(is.na(analysis_data))
  expect_false(missing_check) #checking that there are not any missing values
})

test_that("Dates are within the expected range", {
  date_check <- all(
    analysis_data$date >= as.Date("2025-12-07") &
      analysis_data$date <= as.Date("2026-08-31")
  )
  expect_true(date_check)
})

test_that("Delay and gap values are valid", {
  #allowing duration values of 0 here
  delay_check <- all(
    analysis_data$min_delay >= 0
  )
  gap_check <- all(
    analysis_data$min_gap >= 0
  )
  expect_true(delay_check)
  expect_true(gap_check)
})

test_that("text variables aren't empty", {
  line_check <- all(
    analysis_data$line != ""
  )
  station_check <- all(
    analysis_data$station != ""
  )
  code_check <- all(
    analysis_data$code != ""
  )
  expect_true(line_check)
  expect_true(station_check)
  expect_true(code_check)
})

test_that("Primary LRT lines are there", {
  ec_check <- "EC" %in% analysis_data$line
  fw_check <- "FW" %in% analysis_data$line
  expect_true(ec_check)
  expect_true(fw_check)
})