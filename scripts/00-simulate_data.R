#### Preamble ####
# Purpose: Simulates a dataset of Toronto LRT delay incidents.
# Author: Gerry Peng
# Date: 24 September 2026
# Contact: gerry.peng@mail.utoronto.ca
# License: MIT

#### Workspace setup ####
# load package and set random seed for reproducibility
library(tidyverse)
set.seed(853)

#### Simulate data ####
#amount of simulated delays
n_delays <- 500

#possible LRT lines
lines <- c("EC","FW")

#potential station names
stations <- c(
  "Mount Dennis",
  "Keelesdale",
  "Caledonia",
  "Fairbank",
  "Oakwood",
  "Cedarvale",
  "Eglinton",
  "Science centre",
  "Kennedy",
  "Finch west",
  "Jane and Finch",
  "Humber college")
#some delay codes that happen on the TTC (stred in vector)
codes <- c(
  "EXO",
  "SXGDS",
  "MXPAA",
  "EXBK",
  "PXSW",
  "SXUEG")
#making simulated delays
simulated_data <- tibble(
  date = sample(
    seq(
      as.Date("2025-12-01"), #converting to date
      as.Date("2026-08-31"),
      by = "day" ), #spacing them each out by 1 day
    size = n_delays,
    replace = TRUE ), #multiple incidents on the same date allowed
#choosing 500 sample lines, stations, codes , delays, and gaps 
  line = sample(
    lines,
    size = n_delays,
    replace = TRUE),

  station = sample(
    stations,
    size = n_delays,
    replace = TRUE),

  code = sample(
    codes,
    size = n_delays,
    replace = TRUE),

  min_delay = sample(
    1:40,
    n_delays,
    replace = TRUE),

  min_gap = sample(
    1:50,
    n_delays,
    replace = TRUE)
)

#### Save data ####
write_csv(simulated_data, "data/00-simulated_data/simulated_data.csv")