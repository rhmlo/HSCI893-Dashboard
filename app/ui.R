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
    tags$b("This page may take a few seconds to load!"),
    br(),
    hr(), 
    h4("Options")
  )

### Geography plot
Geo_plot <- 
  mainPanel(
    tmapOutput("geoMap", height = "600px")
  )

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
                   )
               ))),
           
  tabPanel(title = "Navbar2",
           "content 2"),
  
  tabPanel(title = "Navbar3",
           "content 3")
)