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
library(highcharter)

# loading data
Usable_data <- 
  read_csv("data/RL_usable_data2.csv", show_col_types = FALSE) %>% 
  mutate(across(where(is.character), ~na_if(., "0"))) 

sankey_data <- 
  readRDS("data/sankey_data.RDS")

mapfile2 <- readRDS("data/mapfile2.rds")
data3 <- readRDS("data/data3.rds")

tmap_mode("view")

# loading plotting functions
source("funcs/plot_race_age.R", local = TRUE)
source("funcs/geo_map.R", local = TRUE)
source("funcs/gender_sexuality_sankey.R", local = TRUE)