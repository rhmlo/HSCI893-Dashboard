# create a sankey graph for gender, sexuality, and age group

gender_sexuality_sankey <- function(data, gender_or_sex) {
  
  # create a custom theme by merging the theme 'flat' with an option to make the background transparent
  thm <- hc_theme_merge(
    hc_theme_flat(),
    hc_theme(chart = list(backgroundColor = "transparent")))
  
  if (gender_or_sex == "gender") {
    
    # plot sankey using highcharter
    data2 <- 
      data %>% 
      filter(!(is.na(bucket_age)),
             mututallyex_gender != "") %>% 
      select(bucket_age, mututallyex_gender)
    
    hchart(data_to_sankey(data2), "sankey", name = "Respondent Identity") %>% 
      hc_title(text= "Gender Identity by Age Group, UnACoRN 1.0") %>% 
      hc_subtitle(text= "Sankey diagram for demonstration purposes.") %>%
      hc_add_theme(thm) 
  
  }
  
  else {
    
    # plot sankey using highcharter
    data2 <- 
      data %>% 
      filter(!(is.na(bucket_age)),
             mutuallyex_sexuality != "") %>% 
      select(bucket_age, mutuallyex_sexuality)
    
    hchart(data_to_sankey(data2), "sankey", name = "Respondent Identity") %>% 
      hc_title(text= "Sexual Orientation by Age Group, UnACoRN 1.0") %>% 
      hc_subtitle(text= "Sankey diagram for demonstration purposes.") %>%
      hc_add_theme(thm) 
  }
}