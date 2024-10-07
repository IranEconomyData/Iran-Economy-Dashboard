library(shiny)
library(ggplot2)

# Define UI
ui <- fluidPage(
  
  # Navbar for navigation between layers
  navbarPage(
    title = "Iran Economy Dashboard",
    
    tabPanel("Overview",
             fluidRow(
               column(12,
                        div(style = "margin: 20px; padding: 20px; border: 1px solid #ccc; background-color: #f9f9f9;",
                            h3(paste("Header1")),
                            p("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent volutpat ut urna ac ultrices. Nulla facilisi. Integer in pharetra purus.")
                        )
                      )
               
             )
    ),
    
    # Second layer with charts under each button
    tabPanel("Households Expenditure and Income",
             fluidRow(
               column(12,
                        div(style = "margin: 20px; padding: 20px; border: 1px solid #ccc; background-color: #f9f9f9;",
                            h3("Chart for Header"),
                            plotOutput("chart")
                        )
                      )
               )
             
    )
  )
)

# Define Server
server <- function(input, output) {
  
  # Generate sample charts for Layer 2
  lapply(1:9, function(i) {
    output[[paste("chart", i, sep = "")]] <- renderPlot({
      ggplot(data = mtcars, aes(x = hp, y = mpg)) +
        geom_point() +
        ggtitle(paste("Chart for Header", i))
    })
  })
}

# Run the application
shinyApp(ui = ui, server = server)
