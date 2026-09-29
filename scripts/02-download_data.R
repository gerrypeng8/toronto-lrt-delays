#### Preamble ####
# Purpose: Downloads TTC LRT data and code descriptions from Open Data Toronto.
# Author: Gerry Peng
# Date: 24 September 2026
# License: MIT

#### Workspace setup ####
library(opendatatoronto)
library(tidyverse)

#### Download data ####
raw_delays <- get_resource(
  "9a800c92-0362-4cee-8232-7374596b6a43") #delay data

code_descriptions <- get_resource(
  "662bc8f7-887f-4112-8b8d-dbc6bc4ebfb1") #delay code meanings

#### Save data ####

write_csv(
  raw_delays,
  "data/01-raw_data/lrt_delays.csv"
)

write_csv(
  code_descriptions,
  "data/01-raw_data/code_descriptions.csv"
)