# Libraries----
library(shiny)
library(dplyr)
library(ggplot2)
library(sf)
library(purrr)
library(plotly)
library(here)
library(rnaturalearth)
library(rnaturalearthdata)

source(here("UI/IHBS/ui_IHBS.R"))
source(here("Server/IHBS/server_IHBS.R"))
source(here("Data/IHBS/process/Data_IHBS.R"))
source(here("Data/Iran_map.R"))

# Credentials----
user_credentials <- list(username = "iraneconomydashboard", password = "iraneconomydashboard")


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
             ui_IHBS_total_expinc(df_IHBS_Total_ExpInc),
             ui_IHBS_expinc_series(df_IHBS_ExpIncSeries),
             ui_IHBS_fgrams_per(df_IHBS_FGrams_Per),
             ui_IHBS_ginifood(df_IHBS_GiniFood),
             ui_IHBS_foodExp_prov(df_IHBS_Food_exp_prov),
             ui_IHBS_cumulative_share(df_IHBS_Cumulative_Share),
             ui_IHBS_blank(),
             
             
             
             
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

  server_IHBS(input, output)
}

# Run the application
shinyApp(ui = fluidPage(uiOutput("ui")), server = server)
# shinyApp(ui = ui, server = server)
