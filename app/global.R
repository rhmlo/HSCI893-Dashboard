# required packages
library(shiny)
library(shinydashboard)
library(tidyverse)
library(bslib)
library(plotly)
library(viridisLite)

# loading data
Usable_data <- 
  read_csv("data/RL_usable_data2.csv", show_col_types = FALSE) %>% 
  mutate(across(where(is.character), ~na_if(., "0"))) 

# loading plotting functions
source("funcs/plot_race_age.R", local = TRUE)