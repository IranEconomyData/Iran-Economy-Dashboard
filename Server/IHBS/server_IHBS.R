
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
  
  
  
  #----
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
  
  
  #----
  output$IHBS_GiniFood <- renderPlotly({
    # Get the filtered data
    data <- IHBS_GiniFood_data(df_IHBS_GiniFood, input$IHBS_GiniFood_Year) %>%
      group_by(variable) %>%
      arrange(desc(value)) %>%   # Sort by value in descending order within each Decile
      #mutate(variable = factor(variable, levels = unique(variable))) %>% # Update factor levels
      ungroup()
    
    
    plot_ly(data,
            x = ~variable,
            y = ~value,
            color = ~variable,
            type = 'bar',
            hovertext = ~paste(variable, "=", round(value,2)),
            hoverinfo = "text") %>%
      layout(title = "Gini coeff. by food type",
             xaxis = list(title = "", tickmode = "array", tickvals = unique(data$variable)),
             yaxis = list(title = "Gini coeff.", tickformat = ",", tickmode = "auto", nticks = 10), 
             #barmode = 'stack',
             legend = list(orientation = "h", x = 0.5, y = -0.4, xanchor = "center")
      ) 
  })
  
  #----
  # output$IHBS_Foodprice <- renderPlotly({
  #   # Get the filtered data
  #   data <- IHBS_Foodprice_data(df_IHBS_Foodprice, input$IHBS_Foodprice_year)
  #   plot_ly(data, x = ~decile, y = ~value, type = 'bar')
  # 
  # })
  # 

  #----
  output$IHBS_Foodprice  <- renderPlotly({
    # Get the filtered data
    data <- IHBS_Foodprice_data(df_IHBS_Foodprice, input$IHBS_Foodprice_year) %>%
      group_by(variable) %>%
      arrange(desc(value)) %>%   # Sort by value in descending order within each Decile
      #mutate(variable = factor(variable, levels = unique(variable))) %>% # Update factor levels
      ungroup()


    plot_ly(data,
            x = ~decile,
            y = ~value,
            color = ~decile,
            type = 'bar',
            hovertext = ~paste(variable, "=", round(value,2)),
            hoverinfo = "text") %>%
      layout(title = "Price 1000Rials per kg",
             xaxis = list(title = "", tickmode = "array", tickvals = unique(data$variable)),
             yaxis = list(title = "Gini coeff.", tickformat = ",", tickmode = "auto", nticks = 10),
             barmode = 'stack',
             legend = list(orientation = "h", x = 0.5, y = -0.4, xanchor = "center")
      )
  })

  
}