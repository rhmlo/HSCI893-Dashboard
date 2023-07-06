# define plotting function for racial groups by age 

plot_race_age <- function(data, agegroup) {
  
  # manipulate data to add all ages group
  data2 <- 
    Usable_data %>% 
    group_by(bucket_age) %>% 
    summarise(Asian = sum(!is.na(Q138_9)),
              Black = sum(!is.na(Q138_3)),
              White = sum(!is.na(Q138_11)),
              Hispanic = sum(!is.na(Q138_2)),
              "Pacific Islander" = sum(!is.na(Q138_8)),
              "Middle Eastern" = sum(!is.na(Q138_ME)),
              Mixed = sum(!is.na(Q138_Mixed2))) %>% 
    ungroup() %>% 
    pivot_longer(cols = 2:8,
                 names_to = "Racial_Identity",
                 values_to = "Counts") %>% 
    pivot_wider(names_from = bucket_age, values_from = Counts) %>% 
    group_by(Racial_Identity) %>% 
    mutate(All_Ages = sum(c(`15-19`, `20-24`, `25-29`))) %>% 
    pivot_longer(cols = c(2:4, 6),
                 names_to = "bucket_age",
                 values_to = "Counts") %>% 
    filter(bucket_age %in% agegroup)
  
  # creating a plot and making it interactive  
  plot <- 
    data2 %>% 
    group_by(bucket_age) %>% 
    ggplot(., aes(x = reorder(Racial_Identity, Counts), y = Counts, fill = bucket_age,
                  text = paste(data2$bucket_age,':',data2$Counts, 'respondents'))) +
    
    # grouped bar and specifications for outline
    geom_bar(position = "dodge", 
             stat = "Identity", 
             colour = "white", 
             size = 0.2, 
             alpha = 0.7) + 
    
    # standardizing fill colours no matter what is selected
    scale_fill_manual(values = c("All_Ages"="#1d9b77", 
                                 "15-19"="#d96007", 
                                 "20-24"="#7570b4", 
                                 "25-29" = "#e52b89")) +    
    
    scale_y_continuous(breaks = seq(0, 6000, by = 1000)) +
    coord_flip() +
    labs(y = "Number of Respondents",
         x = NULL,
         title = "Racial identity of respondents by age group, UnACoRN 1.0") +
    theme(panel.grid.major.y = element_blank()) +
    
    theme_minimal()
  
  ggplotly(plot, tooltip = c("text")) %>% 
    layout(title = list(x = 0.5),
           legend = list(title = list(text='<b> Age Group </b>')),
           yaxis = list(showgrid = FALSE)) 
  
} 
