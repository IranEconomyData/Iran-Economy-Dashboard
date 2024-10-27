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