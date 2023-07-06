#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

navbarPage(
  theme = bs_theme(bootswatch = "spacelab"),
  title = "UnACoRN Proof-of-Concept Dashboard",
           
  # Demographics tab
  tabPanel(title = "Demographics",
           fluidPage(
           # Sidebar toggles
             sidebarLayout(
               sidebarPanel(
                 width = 3,
                 h4("Options"),
                 # selector for age group
                 selectInput(
                   "select_agegroup",
                   label = "Select age group",
                   choices = c("All ages" = "All_Ages",
                               "15-19 yrs" = "15-19",
                               "20-24 yrs" = "20-24",
                               "25-29 yrs" = "25-29"),
                   multiple = TRUE,
                   selected = c("All ages" = "All_Ages")                   ),
               ),
               
               mainPanel(
                 tabsetPanel(
                   
                   # Racial identity subtab
                   tabPanel("Racial Identity", 
                            br(),
                            plotlyOutput("racial_respondents", height = "600px"),
                            hr(),
                            p("Welcome to this proof-of-concept interactive dashboard, created for the HSCI 893: Directed Studies class at SFU. This app was created using data from the developer's MPH thesis, a portion of the UnACoRN 1.0 survey sample. To use this app, manipulate the widgets in the sidebar to change the graph results for each page and tab according to your preferences! Graphs are interactive and you can zoom in and out to view the data. This app is currently a work in progress.")),
                   
                   # Urban/Rural
                   tabPanel("Urban/Rural",
                            br())
                   )
               )))),
           
  tabPanel(title = "Navbar2",
           "content 2"),
  
  tabPanel(title = "Navbar3",
           "content 3")
)