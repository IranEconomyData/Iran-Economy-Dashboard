ui_IHBS_expincshare_1 <- function(df){
fluidRow(
         div(style = "margin: 20px; padding: 20px; border: 1px solid #ccc; background-color: #f9f9f9;",
             h3("Chart for Header"),
             plotlyOutput("IHBS_ExpInc_Share"),
             fluidRow(
               column(4,
                      selectInput("IHBS_ExpInc_Share_Year", "Year", choices = unique(df$Year))
               ),
               column(4,
                      selectInput("IHBS_ExpInc_Share_Type", "Type", choices = unique(df$Type))
                      )
             )
  )
)}

ui_IHBS_total_expinc <- function(df){
  fluidRow(
    div(style = "margin: 20px; padding: 20px; border: 1px solid #ccc; background-color: #f9f9f9;",
        h3("Chart for Header"),
        plotlyOutput("IHBS_Total_ExpInc"),
        fluidRow(
          column(4,
                 selectInput("IHBS_Total_ExpInc_region", "Region", choices = unique(df$Region))
          ),
          column(4,
                 selectInput("IHBS_Total_ExpInc_Type", "Type", choices = unique(df$Type))
          )
        )
    )
  )}

ui_IHBS_expinc_series <- function(df){
  fluidRow(
    div(style = "margin: 20px; padding: 20px; border: 1px solid #ccc; background-color: #f9f9f9;",
        h3("Chart for Header"),
        plotlyOutput("IHBS_ExpInc_series"),
        fluidRow(
          column(4,
                 selectInput("IHBS_ExpInc_series_region", "Region", choices = unique(df$region))
          ),
          column(4,
                 selectInput("IHBS_ExpInc_series_Type", "Type", choices = unique(df$Type))
          ),
          column(4,
                 selectInput("IHBS_ExpInc_series_Year", "Year", choices = unique(df$Year))
          )
        )
    )
  )}


ui_IHBS_fgrams_per <- function(df){
  fluidRow(
    div(style = "margin: 20px; padding: 20px; border: 1px solid #ccc; background-color: #f9f9f9;",
        h3("Chart for Header"),
        plotlyOutput("IHBS_FGrams_Per"),
        fluidRow(
          column(4,
                 selectInput("IHBS_FGrams_Per_Year", "Year", choices = unique(df$Year))
          ))
          )
        )
    
  }
