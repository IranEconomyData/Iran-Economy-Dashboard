
server_IHBS <- function(input, output){ 
  #----
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
  
  #----
  output$IHBS_Total_ExpInc <- renderPlotly({
    # Get the filtered data
    data <- IHBS_Total_ExpInc_data(df_IHBS_Total_ExpInc, input$IHBS_Total_ExpInc_region, input$IHBS_Total_ExpInc_Type)
    plot_ly(data, x = ~Year, y = ~Value, type = 'bar')
 
  })  
  
  
  
  
  #----
  output$IHBS_ExpInc_series <- renderPlotly({
    # Get the filtered data
    data <- IHBS_ExpInc_Series_data(df_IHBS_ExpIncSeries, input$IHBS_ExpInc_series_region, input$IHBS_ExpInc_series_Type, input$IHBS_ExpInc_series_Year)
    plot_ly(data, x = ~decile, y = ~value, type = 'bar')
    
  })  
  
  
  
  
  output$IHBS_FGrams_Per <- renderPlotly({
    # Get the filtered data
    data <- IHBS_FGrams_Per_data(df_IHBS_FGrams_Per, input$IHBS_FGrams_Per_Year) %>%
      group_by(decile) %>%
      arrange(desc(value)) %>%   # Sort by value in descending order within each Decile
      mutate(variable = factor(variable, levels = unique(variable))) %>% # Update factor levels
      ungroup()
    
    
    plot_ly(data,
            x = ~decile,
            y = ~value,
            color = ~variable,
            type = 'bar',
            hovertext = ~paste(variable, "=", round(value,1), "Grams"),
            hoverinfo = "text") %>%
      layout(title = "Food Consumption by Decile",
             xaxis = list(title = "", tickmode = "array", tickvals = unique(data$decile)),
             yaxis = list(title = "Grams per month per capita", tickformat = ",", tickmode = "auto", nticks = 10), 
             #barmode = 'stack',
             legend = list(orientation = "h", x = 0.5, y = -0.4, xanchor = "center")
      ) 
  })
  
  
  
}