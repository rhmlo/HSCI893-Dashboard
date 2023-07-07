# required packages
library(shiny)
library(shinydashboard)
library(tidyverse)
library(bslib)
library(plotly)
library(shinyalert)
library(tmap)
library(tmaptools)
library(sf)
library(rmapshaper)
library(canadianmaps)
library(rgdal)

# loading data
Usable_data <- 
  read_csv("data/RL_usable_data2.csv", show_col_types = FALSE) %>% 
  mutate(across(where(is.character), ~na_if(., "0"))) 

mapfile <- simplify_shape(PROV) 

tmap_mode("view")

# loading plotting functions
source("funcs/plot_race_age.R", local = TRUE)
source("funcs/geo_map.R", local = TRUE)