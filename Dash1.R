library(shiny)
library(dplyr)
library(plotly)
library(here)
source(here("UI/IHBS/ui_IHBS.R"))
source(here("Data/IHBS/process/Data_IHBS.R"))

# Credentials
user_credentials <- list(username = "abcd", password = "1234")


# Define UI for login page----
login_page <- fluidPage(
  titlePanel("Login"),
  sidebarLayout(
    sidebarPanel(
      textInput("username", "Username"),
      passwordInput("password", "Password"),
      actionButton("login", "Log in")
    ),
    mainPanel(
      textOutput("login_status")
    )
  )
)


# Define UI-----
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
             ui_IHBS_expincshare_1(df_IHBS_ExpInc_Share),
    )
  )
)

# Define Server----
server <- function(input, output, session) {
  # Reactive values to store login status
  user_logged_in <- reactiveVal(FALSE)
  # Observe login button
  observeEvent(input$login, {
    if (input$username == user_credentials$username && input$password == user_credentials$password) {
      user_logged_in(TRUE)  # Set user as logged in
    } else {
      output$login_status <- renderText("Invalid username or password")
    }
  })
  
  # Conditionally show either the login page or the main app
  output$ui <- renderUI({
    if (user_logged_in()) {
      ui  # Show the main app UI if logged in
    } else {
      login_page  # Show the login page otherwise
    }
  })

  output$IHBS_ExpInc_Share <- renderPlotly({
    # Get the filtered data
    data <- IHBS_ExpInc_Share_data(df_IHBS_ExpInc_Share, input$IHBS_ExpInc_Share_Year, input$IHBS_ExpInc_Share_Type) %>%
      group_by(decile) %>%
      arrange(desc(value)) %>%   # Sort by value in descending order within each Decile
      mutate(variable = factor(variable, levels = unique(variable))) %>% # Update factor levels
      ungroup()


    plot_ly(data,
            x = ~decile,
            y = ~value,
            color = ~variable,
            type = 'bar',
            hovertext = ~paste(variable, "=", round(value,1), "%"),
            hoverinfo = "text") %>%
      layout(title = "Expenditure Breakdown by Decile",
             xaxis = list(title = "", tickmode = "array", tickvals = unique(data$decile)),
             yaxis = list(title = "Share of Expenditure", tickformat = ",", tickmode = "auto", nticks = 10), 
             barmode = 'stack',
             legend = list(orientation = "h", x = 0.5, y = -0.4, xanchor = "center")
             ) 
  })
}

# Run the application
# shinyApp(ui = fluidPage(uiOutput("ui")), server = server)
shinyApp(ui = ui, server = server)
