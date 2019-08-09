## Data Visualization (GOVT16-QSS17) Summer 2019
## Lab 3
##
## This script loads the supplied data in CSV format from FiveThirtyEight
## and saves it as an RDS file in the output directory for visualization.
##
## Name: Thomas Monfre
## Date: August 8, 2019

library(tidyverse)

# Load and Combine Data ---------------------------------------------------

basename <- "./data/IRAhandle_tweets_"
filetype <- ".csv"

filestoread <- paste0(basename, 1:3, filetype)

df <- bind_rows(
  read.csv(filestoread[1]),
  read.csv(filestoread[2]),
  read.csv(filestoread[3]))

# Write to RDS ------------------------------------------------------------

saveRDS(df, file = "./output/tweets.rds")

