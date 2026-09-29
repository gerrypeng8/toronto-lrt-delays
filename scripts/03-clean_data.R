#### Preamble ####
# Purpose: Cleans the raw Toronto LRT delay data for analysis.
# Author: Gerry Peng
# Date: 25 September 2026
# License: MIT

#### Workspace setup ####
library(tidyverse)
library(arrow)

#### Read data ####
raw_data <- read_csv(
  "data/01-raw_data/lrt_delays.csv",
  show_col_types = FALSE)

#### Clean data ####
analysis_data <- raw_data |> #changing raw names of what'll be used
  rename(
    date = Date,
    line = Line,
    time = Time,
    day = Day,
    station = Station,
    code = Code,
    min_delay = Min.Delay,
    min_gap = Min.Gap
  ) |>
  select(date, line, time, day, station, code, min_delay, min_gap) |>
  mutate(date = as.Date(date)) |>
  filter(!is.na(line)) #getting rid of rows with missing line value

#### Save data ####
write_csv(analysis_data, "data/02-analysis_data/analysis_data.csv")

write_parquet(analysis_data, "data/02-analysis_data/analysis_data.parquet")