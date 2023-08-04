# interactive map with canadian provinces and counts of respondents

geo_map <- function(data, agegroup, select_urbrural) {
  
  # now just need to set up the function parameters and inputs... 
  
  if (select_urbrural == "Both") {
    
    data4 <- 
      data3 %>% 
      filter(bucket_age %in% agegroup) 
    
    tm_shape(data4) +
      tm_polygons("Counts",
                  id = "PRENAME",
                  palette = "YlGn",
                  legend.show = TRUE,
                  title = "Number of Respondents") +
      tm_view(set.zoom.limits = c(3, 10)) +
      tm_layout(title = "Number of UnACoRN 1.0 Respondents in Canada, by Age Group and Geography")
    
  } else {
  
    data4 <- 
      data3 %>% 
      filter(bucket_age %in% agegroup) %>% 
      filter(grepl(select_urbrural, urban_rural))
    
    tm_shape(data4) +
      tm_polygons("Counts2",
                  id = "PRENAME",
                  palette = "YlGn",
                  legend.show = TRUE,
                  title = "Respondents") +
      tm_view(set.zoom.limits = c(3, 10)) +
      tm_layout(title = "Number of UnACoRN 1.0 Respondents in Canada, by Age Group and Geography")
  }
  
}

