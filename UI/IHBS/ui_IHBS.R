ui_IHBS_expincshare_1 <- function(df){
fluidRow(
         div(style = "margin: 20px; padding: 20px; border: 1px solid #ccc; background-color: #f9f9f9;",
             h3("Chart for Header 1"),
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
        h3("Chart for Header 2"),
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
        h3("Chart for Header 3"),
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
        h3("Chart for Header 4"),
        plotlyOutput("IHBS_FGrams_Per"),
        fluidRow(
          column(4,
                 selectInput("IHBS_FGrams_Per_Year", "Year", choices = unique(df$Year))
          ))
          )
        )
    
  }



ui_IHBS_ginifood <- function(df){
  fluidRow(
    div(style = "margin: 20px; padding: 20px; border: 1px solid #ccc; background-color: #f9f9f9;",
        h3("Chart for Header 5"),
        plotlyOutput("IHBS_GiniFood"),
        fluidRow(
          column(4,
                 selectInput("IHBS_GiniFood_Year", "Year", choices = unique(df$Year))
          ))
    )
  )
  
}

ui_IHBS_foodExp_prov <- function(df){
  fluidRow(
    div(style = "margin: 20px; padding: 20px; border: 1px solid #ccc; background-color: #f9f9f9;",
        h3("Chart for Header 6"),
        plotlyOutput("IHBS_Food_exp_prov", width = "1600px", height = "700px"),
        fluidRow(
          column(4,
                 selectInput("IHBS_Food_exp_prov_year", "year", choices = unique(df$Year), selected = 96)
          )
        )
    )
  )}



ui_IHBS_cumulative_share <- function(df){
  fluidRow(
    div(style = "margin: 20px; padding: 20px; border: 1px solid #ccc; background-color: #f9f9f9;",
        h3("Chart for Header 7"),
        plotlyOutput("IHBS_Cumulative_Share"),
        fluidRow(
          column(4,
                 selectInput("IHBS_Cumulative_Share_Variable", "Variable", choices = unique(df$Variable))
          ),
          column(4,
                 selectInput("IHBS_Cumulative_Share_Year", "Year", choices = unique(df$Year))
          )
        )
    )
  )}



ui_IHBS_changefooditems <- function(df){
  fluidRow(
    div(style = "margin: 20px; padding: 20px; border: 1px solid #ccc; background-color: #f9f9f9;",
        h3("Chart for Header 8"),
        plotlyOutput("IHBS_ChangeFoodItems"),
        fluidRow(
          column(4,
                 selectInput("IHBS_ChangeFoodItems_Variable", "Variable", choices = unique(df$Variable))
          ),
          column(4,
                 selectInput("IHBS_ChangeFoodItems_Decile", "Decile", choices = unique(df$Decile))
          )
        )
    )
  )}


ui_IHBS_priceelastisity <- function(df){
  fluidRow(
    div(style = "margin: 20px; padding: 20px; border: 1px solid #ccc; background-color: #f9f9f9;",
        h3("Chart for Header 9"),
        plotlyOutput("IHBS_PriceElastisity"),
        fluidRow(
          column(4,
                 selectInput("IHBS_PriceElastisity_Category", "Category", choices = unique(df$Category))
          ),
          column(4,
                 selectInput("IHBS_PriceElastisity_Type", "Type", choices = unique(df$Type))
          )
        )
    )
  )}





ui_IHBS_blank <- function(df){
  fluidRow(div(style = "margin: 20px; padding: 20px; border: 1px solid #ccc; background-color: #f9f9f9;",
               h3("Footer"))
    
  )}
