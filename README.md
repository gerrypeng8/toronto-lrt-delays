# Toronto LRT Delays

## Overview

This repository contains the data, R scripts, and files used to analyze delay incidents on Toronto's light rail transit network. The analysis compares how frequently different incident causes occur with the total amount of recorded delay associated with them. The data is from the TTC LRT Delay Data dataset available through Toronto Open Data.

## File Structure

The repository is organized as follows:

- `data/00-simulated_data`: simulated data used to test the analysis workflow.
- `data/01-raw_data`: original TTC LRT delay data and incident code descriptions.
- `data/02-analysis_data`: cleaned data used in the analysis.
- `scripts`: R scripts used to simulate, download, clean, and test the data.
- `paper`: the Quarto file, bibliography, and PDF for the final paper.
- `other/sketches`: sketches used to plan the figures in the paper.
- `other/llm_usage`: documentation of LLM usage for this project.

## Statement on LLM usage

Code completion was used while writing some of the R code, and ChatGPT was used for help with understanding code, writing, and reviewing the paper. The conversation used is in `other/llm_usage/usage.txt`.