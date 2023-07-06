# Define server logic 

server <- function(input, output, session) {
  
  output$racial_respondents <- renderPlotly(
    plot_race_age(Usable_data, agegroup = input$select_agegroup)
  )
  
}