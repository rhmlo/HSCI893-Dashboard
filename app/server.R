# Define server logic 

server <- function(input, output, session) {
  
  shinyalert("Welcome!", 
             text = tagList(p("This is a proof-of-concept interactive dashboard created for HSCI 893: Directed Studies at SFU. This app was created using data from Ren's MPH thesis, including a portion of the UnACoRN 1.0 sample.", br(), br(), p("To use this app, manipulate the widgets in the sidebar to change the graph results for each page and tab according to your preferences! Graphs are interactive and you can zoom in and out to view the data. This app is currently a work in progress."))), 
             type = "info",
             size = "m",
             html = TRUE)
  
  output$racial_respondents <- renderPlotly(
    plot_race_age(Usable_data, agegroup = input$select_agegroup)
  )
  
  output$geoMap <- renderTmap({geo_map(Usable_data)})
  
  
}