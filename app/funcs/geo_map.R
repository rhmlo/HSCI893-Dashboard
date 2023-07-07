# interactive map with canadian provinces and counts of respondents

geo_map <- function(data) {

  # base province polygons
  mapfile2 <- 
    mapfile %>% 
    # create variable to group NT and NU 
    mutate(PT2 = c("BC", "QC", "NT and NU", "PE", "SK", "YT", "MB", "ON", "NB", "NT and NU", "AB", "NL", "NS")) %>% 
    group_by(PT2) %>% 
    # combine NT and NU to match with UnACoRN data
    summarise(geometry = sf::st_union(geometry)) %>%
    ungroup() %>% 
    mutate(PRENAME = c("Alberta", "British Columbia", "Manitoba", "New Brunswick", "Newfoundland", 
                       "Nova Scotia", "Northwest Territories and Nunavut", "Ontario", 
                       "Prince Edward Island", "Quebec", "Saskatchewan", "Yukon"))
  
  # wrangle UnACoRN data...
  data2 <- 
    Usable_data %>% 
    filter(!Province_Territory %in% NA) %>% 
    mutate(PT2 = Province_Territory) %>% 
    group_by(bucket_age, PT2, Area) %>% 
    summarise(total = n()) %>% 
    pivot_wider(names_from = c(bucket_age, Area), values_from = total) %>% 
    select(-c(NA_rural, NA_urban)) %>% 
    replace(is.na(.), 0) %>% 
    mutate(All_Ages = sum(c(`15-19_rural`, `15-19_urban`, `20-24_rural`, `20-24_urban`, `25-29_rural`, `25-29_urban`)),
           "15-19_All" = sum(c(`15-19_rural`, `15-19_urban`)),
           "20-24_All" = sum(c(`20-24_rural`, `20-24_urban`)),
           "25-29_All" = sum(c(`25-29_rural`, `25-29_urban`))) %>% 
    pivot_longer(cols = c(2:11),
                 names_to = "bucket_age",
                 values_to = "Counts") 
  
  # merge UnACoRN data with geometry
  data3 <- 
    merge(mapfile2, data2, by = 'PT2')
  
  # now just need to set up the function parameters and inputs... 
  
  
  tm_shape(data3) +
    tm_polygons("PT2",
                id = "PRENAME",
                palette = "PRGn",
                legend.show = FALSE)
  
}

