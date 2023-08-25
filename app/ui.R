# objects for each page item -----------

## RI
### Racial identity sidebar
RI_Sidebar <- 
  sidebarPanel(
    width = 3,
    h4("Options"),
    # selector for age group
    selectInput(
      "select_agegroup",
      label = tags$b("Select age group"),
      choices = c("All ages" = "All_Ages",
                  "15-19 yrs" = "15-19",
                  "20-24 yrs" = "20-24",
                  "25-29 yrs" = "25-29"),
      multiple = TRUE,
      selected = c("All ages" = "All_Ages")))

### Racial identity plot
RI_plot <- 
  mainPanel(
    plotlyOutput("racial_respondents", height = "600px"),
    hr(),
    tags$b("Notes about data for this graph:"),
    tags$ul(
      tags$li(tags$em("Pacific Islanders"), " - Data was collected for Pacific Islanders, however there were only n=7 respondents for this racial group. This group was included in the above graph, even though it may not appear to be populated.")))

## Geography 
### Geography sidebar
Geo_Sidebar <- 
  sidebarPanel(
    width = 3,
    tags$em("This page may take a few seconds to load. To show the exact number of respondents, click on each province."),
    br(),
    hr(), 
    h4("Options"),
    # selector for age group
    selectInput(
      "select_agegroup_geo",
      label = tags$b("Select age group"),
      choices = c("All ages" = "All_Ages",
                  "15-19 yrs" = "15-19_All",
                  "20-24 yrs" = "20-24_All",
                  "25-29 yrs" = "25-29_All"),
      multiple = FALSE,
      selected = c("All ages" = "All_Ages")),
    # selector for rural, urban, or both
    radioButtons("urbanrural", 
                 label = tags$b("Select geography"),
                 choices = c("Urban" = "urban",
                             "Rural" = "rural",
                             "Both" = "Both"),
                 selected = c("Both" = "Both"))
    )

### Geography plot
Geo_plot <- 
  mainPanel(
    tmapOutput("geoMap", height = "600px"),
    hr(),
    tags$b("Notes about data for this graph:"),
    tags$ul(
      tags$li(tags$em("Legend scales"), " - This is an example interactive graph with two options for specificity. More troubleshooting is required to manually specify the legend scales in the mapping function, which curently sometimes include 0 as a separate category. This is probably due to having double options and slicing the data into 4 age groups + 3 geographies = 12 subgroups of data."))
  )

## Sankey
### sankey sidebar
Sankey_Sidebar <- 
  sidebarPanel(
    width = 3,
    tags$em("Hover over each line or option in this sankey diagram to look at the specific counts in each flow and group."),
    br(),
    hr(), 
    h4("Options"),
    # selector for gender or sexuality
    radioButtons("gender_sexuality", 
                 label = "",
                 choices = c("Gender Identity" = "gender",
                             "Sexual Orientation" = "sexuality"),
                 selected = c("Gender Identity" = "gender"))
    )

### sankey plot
Sankey_plot <- 
  mainPanel(
    highchartOutput("sankey_gender_sex", height = "700px"),
    hr(),
    tags$b("Notes about data for this graph:"),
    tags$ul(
      tags$li(tags$em("Mutually Exclusive Variables"), " - Sankey graphs require mutually exclusive variables, which is why the 'Multiple' identity was created for both gender identity and sexual orientation options. This graph may be difficult to use for UnACoRN data, since many response options are not mutually exclusive.")))


# UI ------------- 

navbarPage(
  
  useShinyalert(),
  theme = bs_theme(bootswatch = "spacelab"),
  title = "UnACoRN Proof-of-Concept Dashboard",
           
  # Demographics page
  tabPanel(title = "Demographics",
           fluidPage(
             tabsetPanel(
               
               # Racial identity subtab
               tabPanel("Racial Identity", 
                        br(),
                        sidebarLayout(RI_Sidebar, RI_plot)
               ),
                   
               # Urban/Rural
               tabPanel("Geography",
                        br(),
                        sidebarLayout(Geo_Sidebar, Geo_plot)
               ),
               
               # Sankey
               tabPanel("Sexuality/Gender Identity",
                        br(),
                        sidebarLayout(Sankey_Sidebar, Sankey_plot)
               )
             )
           )
  ),
           
  tabPanel(title = "Thesis Results",
           "Content to be added soon!")
)