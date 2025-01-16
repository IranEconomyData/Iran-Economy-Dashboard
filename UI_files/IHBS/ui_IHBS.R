# ui_IHBS_expincshare_1 <- function(df){
# fluidRow(
#          div(style = "margin: 20px; padding: 20px; border: 1px solid #ccc; background-color: #f9f9f9;",
#              h3("Chart for Header 1"),
#              plotlyOutput("IHBS_ExpInc_Share"),
#              fluidRow(
#                column(4,
#                       selectInput("IHBS_ExpInc_Share_Year", "Year", choices = unique(df$Year))
#                ),
#                column(4,
#                       selectInput("IHBS_ExpInc_Share_Type", "Type", choices = unique(df$Type))
#                       )
#              )
#   )
# )}
# 
# ui_IHBS_total_expinc <- function(df){
#   fluidRow(
#     div(style = "margin: 20px; padding: 20px; border: 1px solid #ccc; background-color: #f9f9f9;",
#         h3("Chart for Header 2"),
#         plotlyOutput("IHBS_Total_ExpInc"),
#         fluidRow(
#           column(4,
#                  selectInput("IHBS_Total_ExpInc_region", "Region", choices = unique(df$Region))
#           ),
#           column(4,
#                  selectInput("IHBS_Total_ExpInc_Type", "Type", choices = unique(df$Type))
#           )
#         )
#     )
#   )}
# 
# ui_IHBS_expinc_series <- function(df){
#   fluidRow(
#     div(style = "margin: 20px; padding: 20px; border: 1px solid #ccc; background-color: #f9f9f9;",
#         h3("Chart for Header 3"),
#         plotlyOutput("IHBS_ExpInc_series"),
#         fluidRow(
#           column(4,
#                  selectInput("IHBS_ExpInc_series_region", "Region", choices = unique(df$region))
#           ),
#           column(4,
#                  selectInput("IHBS_ExpInc_series_Type", "Type", choices = unique(df$Type))
#           ),
#           column(4,
#                  selectInput("IHBS_ExpInc_series_Year", "Year", choices = unique(df$Year))
#           )
#         )
#     )
#   )}
# 
# 
# ui_IHBS_fgrams_per <- function(df){
#   fluidRow(
#     div(style = "margin: 20px; padding: 20px; border: 1px solid #ccc; background-color: #f9f9f9;",
#         h3("Chart for Header 4"),
#         plotlyOutput("IHBS_FGrams_Per"),
#         fluidRow(
#           column(4,
#                  selectInput("IHBS_FGrams_Per_Year", "Year", choices = unique(df$Year))
#           ))
#           )
#         )
#     
#   }
# 
# 
# 
# ui_IHBS_ginifood <- function(df){
#   fluidRow(
#     div(style = "margin: 20px; padding: 20px; border: 1px solid #ccc; background-color: #f9f9f9;",
#         h3("Chart for Header 5"),
#         plotlyOutput("IHBS_GiniFood"),
#         fluidRow(
#           column(4,
#                  selectInput("IHBS_GiniFood_Year", "Year", choices = unique(df$Year))
#           ))
#     )
#   )
#   
# }
# 
# ui_IHBS_foodExp_prov <- function(df){
#   fluidRow(
#     div(style = "margin: 20px; padding: 20px; border: 1px solid #ccc; background-color: #f9f9f9;",
#         h3("Chart for Header 6"),
#         plotlyOutput("IHBS_Food_exp_prov", width = "1600px", height = "700px"),
#         fluidRow(
#           column(4,
#                  selectInput("IHBS_Food_exp_prov_year", "year", choices = unique(df$Year), selected = 96)
#           )
#         )
#     )
#   )}
# 
# 
# 
# ui_IHBS_cumulative_share <- function(df){
#   fluidRow(
#     div(style = "margin: 20px; padding: 20px; border: 1px solid #ccc; background-color: #f9f9f9;",
#         h3("Chart for Header 7"),
#         plotlyOutput("IHBS_Cumulative_Share"),
#         fluidRow(
#           column(4,
#                  selectInput("IHBS_Cumulative_Share_Variable", "Variable", choices = unique(df$Variable))
#           ),
#           column(4,
#                  selectInput("IHBS_Cumulative_Share_Year", "Year", choices = unique(df$Year))
#           )
#         )
#     )
#   )}
# 
# 
# 
# ui_IHBS_changefooditems <- function(df){
#   fluidRow(
#     div(style = "margin: 20px; padding: 20px; border: 1px solid #ccc; background-color: #f9f9f9;",
#         h3("Chart for Header 8"),
#         plotlyOutput("IHBS_ChangeFoodItems"),
#         fluidRow(
#           column(4,
#                  selectInput("IHBS_ChangeFoodItems_Variable", "Variable", choices = unique(df$Variable))
#           ),
#           column(4,
#                  selectInput("IHBS_ChangeFoodItems_Decile", "Decile", choices = unique(df$Decile))
#           )
#         )
#     )
#   )}
# 
# 
# ui_IHBS_priceelastisity <- function(df){
#   fluidRow(
#     div(style = "margin: 20px; padding: 20px; border: 1px solid #ccc; background-color: #f9f9f9;",
#         h3("Chart for Header 9"),
#         plotlyOutput("IHBS_PriceElastisity"),
#         fluidRow(
#           column(4,
#                  selectInput("IHBS_PriceElastisity_Category", "Category", choices = unique(df$Category))
#           ),
#           column(4,
#                  selectInput("IHBS_PriceElastisity_Type", "Type", choices = unique(df$Type))
#           )
#         )
#     )
#   )}
# 
# 
# 
# ui_IHBS_expenditureelasticity <- function(df){
#   fluidRow(
#     div(style = "margin: 20px; padding: 20px; border: 1px solid #ccc; background-color: #f9f9f9;",
#         h3("Chart for Header 10"),
#         plotlyOutput("IHBS_ExpenditureElasticity")
#     )
#   )}
# 
# 
# ui_IHBS_expenditureelasticitynew <- function(df){
#   fluidRow(
#     div(style = "margin: 20px; padding: 20px; border: 1px solid #ccc; background-color: #f9f9f9;",
#         h3("Chart for Header 11"),
#         plotlyOutput("IHBS_ExpenditureElasticityNew")
#     )
#   )}
# 
# 
# ui_IHBS_priceelastisitynew <- function(df){
#   fluidRow(
#     div(style = "margin: 20px; padding: 20px; border: 1px solid #ccc; background-color: #f9f9f9;",
#         h3("Chart for Header 12"),
#         plotlyOutput("IHBS_PriceElastisityNew"),
#         fluidRow(
#           column(4,
#                  selectInput("IHBS_PriceElastisityNew_Category", "Category", choices = unique(df$Category))
#           ),
#           column(4,
#                  selectInput("IHBS_PriceElastisityNew_Type", "Type", choices = unique(df$Type))
#           )
#         )
#     )
#   )}
# 
# 
# 
# 
# 
# ui_IHBS_expseries <- function(df){
#   fluidRow(
#     div(style = "margin: 20px; padding: 20px; border: 1px solid #ccc; background-color: #f9f9f9;",
#         h3("Chart for Header 13"),
#         plotlyOutput("IHBS_ExpSeries"),
#         fluidRow(
#           column(4,
#                  selectInput("IHBS_ExpSeries_Year", "Year", choices = unique(df$Year))
#           ),
#           column(4,
#                  selectInput("IHBS_ExpSeries_Category1", "Category1", choices = unique(df$Category1))
#           ),
#           column(4,
#                  selectInput("IHBS_ExpSeries_Category2", "Category2", choices = unique(df$Category2))
#           )
#         )
#     )
#   )}
# 
# 
# 
# ui_IHBS_expsharerdecseries <- function(df){
#   fluidRow(
#     div(style = "margin: 20px; padding: 20px; border: 1px solid #ccc; background-color: #f9f9f9;",
#         h3("Chart for Header 14"),
#         plotlyOutput("IHBS_ExpShareRDecSeries"),
#         fluidRow(
#           column(4,
#                  selectInput("IHBS_ExpShareRDecSeries_Decile", "Decile", choices = unique(df$Decile))
#           ),
#           column(4,
#                  selectInput("IHBS_ExpShareRDecSeries_Variable", "Variable", choices = unique(df$Variable))
#           )
#         )
#     )
#   )}
# 
# # ui_IHBS_DecileDistinction <- function(df){
# #   fluidRow(
# #     div(style = "margin: 20px; padding: 20px; border: 1px solid #ccc; background-color: #f9f9f9;",
# #         h3("Chart for Header 15"),
# #         plotlyOutput("IHBS_DecileDistinction"),
# #         fluidRow(
# #           column(4,
# #                  selectInput("IHBS_DecileDistinction_year", "Year", choices = unique(df$Year))
# #           ),
# #           column(4
# #           )
# #         )
# #     )
# #   )}
# # 
# 
# 
# 
# ui_IHBS_realexpincprov <- function(df){
#   fluidRow(
#     div(style = "margin: 20px; padding: 20px; border: 1px solid #ccc; background-color: #f9f9f9;",
#         h3("Chart for Header 16"),
#         h6("Data Source: RealExpIncProvSeries.csv"),
#         plotlyOutput("IHBS_RealExpIncProv", width = "1600px", height = "700px"),
#         fluidRow(
#           column(4,
#                  selectInput("IHBS_RealExpIncProv_year", "year", choices = unique(df$Year), selected = 96)
#           ),
#           column(4,
#                  selectInput("IHBS_RealExpIncProv_Type", "Type", choices = unique(df$Type))
#           )
#         )
#     )
#   )}
# 
# 
# 
# ui_IHBS_realexpincdec <- function(df){
#   fluidRow(
#     div(style = "margin: 20px; padding: 20px; border: 1px solid #ccc; background-color: #f9f9f9;",
#         h3("Chart for Header 17"),
#         h6("Data Source: RealExpIncDecSeries.csv"),
#         plotlyOutput("IHBS_RealExpIncDec", width = "1600px", height = "700px"),
#         fluidRow(
#           column(4,
#                  selectInput("IHBS_RealExpIncDec_Year", "Year", choices = unique(df$Year), selected = 96)
#           ),
#           column(4,
#                  selectInput("IHBS_RealExpIncDec_Type", "Type", choices = unique(df$Type))
#           )
#         )
#     )
#   )}
# 
# 
# 
# 
# 
# 
# ui_IHBS_expshareprov <- function(df){
#   fluidRow(
#     div(style = "margin: 20px; padding: 20px; border: 1px solid #ccc; background-color: #f9f9f9;",
#         h3("Chart for Header 18"),
#         h6("Data Source: ExpShareProvSeries.csv"),
#         plotlyOutput("IHBS_ExpShareProv", width = "1600px", height = "700px"),
#         fluidRow(
#           column(4,
#                  selectInput("IHBS_ExpShareProv_year", "year", choices = unique(df$Year), selected = 96)
#           ),
#           column(4,
#                  selectInput("IHBS_ExpShareProv_Variable", "Variable", choices = unique(df$Variable))
#           )
#         )
#     )
#   )}
# 
# 


# 
# ui_IHBS_metadata  <- function(df){
#   fluidRow(
#     div(style = "margin: 20px; padding: 20px; border: 1px solid #ccc; background-color: #f9f9f9;",
#         h3("Chart for Header 19"),
#         h6("Data Source: MetaDataSeriesExpInc.csv"),
#         plotlyOutput("IHBS_MetaData"),
#         fluidRow(
#           column(4,
#                  selectInput("IHBS_MetaData_Year", "Year", choices = unique(df$Year))
#           ),
#           column(4,
#                  selectInput("IHBS_MetaData_Type", "Type", choices = unique(df$Type))
#           )
#         )
#     )
#   )}
# 
# 
# 
# ui_IHBS_metadata2  <- function(df){
#   fluidRow(
#     div(style = "margin: 20px; padding: 20px; border: 1px solid #ccc; background-color: #f9f9f9;",
#         h3("Chart for Header 19_1"),
#         h6("Data Source: MetaData2SeriesExpInc.csv"),
#         plotlyOutput("IHBS_MetaData2"),
#         fluidRow(
#           column(4,
#                  selectInput("IHBS_MetaData2_Year", "Year", choices = unique(df$Year))
#           ),
#           column(4,
#                  selectInput("IHBS_MetaData2_Type", "Type", choices = unique(df$Type))
#           )
#         )
#     )
#   )}


# # 
# ui_IHBS_metadatatotal  <- function(df){
#   fluidRow(
#     div(style = "margin: 20px; padding: 20px; border: 1px solid #ccc; background-color: #f9f9f9;",
#         h3("Chart for Header 20"),
#         h6("Data Source: MetaDataTotal.csv"),
#         plotlyOutput("IHBS_MetaDataTotal"),
#         fluidRow(
#           column(4,
#                  selectInput("IHBS_MetaDataTotal_Year", "Year", choices = unique(df$Year))
#           ),
#           column(4,
#                  selectInput("IHBS_MetaDataTotal_Variable", "Variable", choices = unique(df$Variable))
#           )
#         )
#     )
#   )}
# 
# 
# 
# ui_IHBS_tenuredec  <- function(df){
#   fluidRow(
#     div(style = "margin: 20px; padding: 20px; border: 1px solid #ccc; background-color: #f9f9f9;",
#         h3("Chart for Header 21"),
#         h6("Data Source: TenureDecSeries.csv"),
#         plotlyOutput("IHBS_TenureDec"),
#         fluidRow(
#           column(4,
#                  selectInput("IHBS_TenureDec_Year", "Year", choices = unique(df$Year), selected = 1402)
#           ),
#           column(4,
#                  selectInput("IHBS_TenureDec_Region", "Region", choices = unique(df$Region))
#           )
#           
#         )
#     )
#   )}
# 
# 
# ui_IHBS_sizedec  <- function(df){
#   fluidRow(
#     div(style = "margin: 20px; padding: 20px; border: 1px solid #ccc; background-color: #f9f9f9;",
#         h3("Chart for Header 22"),
#         h6("Data Source: SizeDecSeries.csv"),
#         plotlyOutput("IHBS_SizeDec"),
#         fluidRow(
#           column(4,
#                  selectInput("IHBS_SizeDec_Year", "Year", choices = unique(df$Year), selected = 1402)
#           ),
#           column(4,
#                  selectInput("IHBS_SizeDec_Region", "Region", choices = unique(df$Region))
#           )
#           
#         )
#     )
#   )}
# 
# 
# 
# 
# ui_IHBS_heduprov  <- function(df){
#   fluidRow(
#     div(style = "margin: 20px; padding: 20px; border: 1px solid #ccc; background-color: #f9f9f9;",
#         h3("Chart for Header 23"),
#         h6("Data Source: HEduProvSeries.csv"),
#         plotlyOutput("IHBS_HEduProv"),
#         fluidRow(
#           column(4,
#                  selectInput("IHBS_HEduProv_Year", "Year", choices = unique(df$Year), selected = 1402)
#           ),
#           column(4,
#                  selectInput("IHBS_HEduProv_Region", "Region", choices = unique(df$Region), selected = "Urban")
#           ),
#           column(4,
#                  selectInput("IHBS_HEduProv_Category", "Category", choices = unique(df$Category),selected = "Illiterate")
#           )
#           
#         )
#     )
#   )}
# 
# 
# 
# ui_IHBS_hactivitystate  <- function(df){
#   fluidRow(
#     div(style = "margin: 20px; padding: 20px; border: 1px solid #ccc; background-color: #f9f9f9;",
#         h3("Chart for Header 24"),
#         h6("Data Source: HActivityStateSeries.csv"),
#         plotlyOutput("IHBS_HActivityState"),
#         fluidRow(
#           column(4,
#                  selectInput("IHBS_HActivityState_Year", "Year", choices = unique(df$Year), selected = 1402)
#           ),
#           column(4,
#                  selectInput("IHBS_HActivityState_Region", "Region", choices = unique(df$Region), selected = "Urban")
#           )
#           
#         )
#     )
#   )}
# 
# 
# 

ui_IHBS_correlexpsharemeterprice  <- function(df){
  fluidRow(
    div(style = "margin: 20px; padding: 20px; border: 1px solid #ccc; background-color: #f9f9f9;",
        h3("Chart for Header 25"),
        h6("Data Source: CorrelExpShareMeterPriceSeries.csv"),
        plotlyOutput("IHBS_CorrelExpShareMeterPrice"),
        fluidRow(
          column(4,
                 selectInput("IHBS_CorrelExpShareMeterPrice_Year", "Year", choices = unique(df$Year), selected = 1402)
          ),
          column(4,
                 selectInput("IHBS_CorrelExpShareMeterPrice_Variable", "Variable", choices = unique(df$Variable))
          )

        )
    )
  )}



ui_IHBS_blank <- function(df){
  fluidRow(div(style = "margin: 20px; padding: 20px; border: 1px solid #ccc; background-color: #f9f9f9;",
               h3("Footer"))
    
  )}
