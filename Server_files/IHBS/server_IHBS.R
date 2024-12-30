
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
  output$IHBS_Food_exp_prov  <- renderPlotly({
    # Get the filtered data
    data <- iran_map |> select(geometry, Province) %>%
      left_join(IHBS_Food_exp_prov_data(df_IHBS_Food_exp_prov, input$IHBS_Food_exp_prov_year) |> select (Province, value),
                by = "Province")
    p <- ggplot() +
      geom_sf(data = world, fill = "lightblue", color = NA) + # background for ocean
      # Plot surrounding countries
      geom_sf(data = world, fill = "grey80", color = "white") +
      # Plot water bodies
      geom_sf(data = water, fill = "lightblue", color = "lightblue") +
      # Plot Iran provinces with sample data
      geom_sf(data = data, aes(fill = value), color = "black") + 
      # Add country names at centroids
      geom_text(data = neighboring_countries_centroids, 
                aes(x = st_coordinates(geometry)[,1], y = st_coordinates(geometry)[,2], 
                    label = admin), color = "darkblue", size = 3) +
      scale_fill_viridis_c(option = "C", name = "Value") +
      labs(
        title = "Sample Values by Province",
        caption = "Source: Sample Data"
      ) +
      theme_minimal() +
      theme(
        panel.background = element_rect(fill = "lightblue", color = NA),  # Ocean background
        axis.text = element_blank(),
        axis.ticks = element_blank(),
        panel.grid = element_blank()
      )+
      coord_sf(xlim = c(42, 64), ylim = c(25, 40)) # Adjust xlim and ylim as needed
    
    
    # Convert to interactive plotly plot
    ggplotly(p)
    
    
    
    })
  
  
  
  #---- Cumulative Expenditure Share
  output$IHBS_Cumulative_Share <- renderPlotly({
    # Get the filtered data
    data <- IHBS_Cumulative_Share_data(df_IHBS_Cumulative_Share,  input$IHBS_Cumulative_Share_Variable ,input$IHBS_Cumulative_Share_Year)
    p <- ggplot(data, aes(x = decile)) +
      geom_line(aes(y = value , group =Variable), color = "blue", size = 1.5)+             # Lorenz curve
      geom_bar(aes(y = value), stat = "identity", fill = "skyblue", alpha = 0.5)+  # Bar chart
      geom_abline(slope = 0.1, intercept = 0, linetype = "dashed", color = "red") +       # Line of equality
      scale_x_continuous(breaks = seq(1, 10, by = 1)) +
      labs(title = "Lorenz Curve with Cumulative Bar Chart for Food Items",
           x = "Cumulative Share of Decile",
           y = "Lorenz Curve") +
      theme_minimal()
    
    ggplotly(p)
    
  })  
  
  
  
  #---- Cumulative Expenditure Share
  output$IHBS_ChangeFoodItems <- renderPlotly({
    # Get the filtered data
    data <- IHBS_ChangeFoodItems_data(df_IHBS_ChangeFoodItems,  input$IHBS_ChangeFoodItems_Variable ,input$IHBS_ChangeFoodItems_Decile)
    p <- ggplot(data, aes(x = Year , y=value , fill=UOM)) +
        geom_bar(stat = "identity", position = "dodge") +
      scale_x_continuous(breaks = seq(87, 96, by = 1)) +
      scale_y_continuous(breaks = seq(0, 10, by = 1)) +
      
        labs(title = "Food Price and consumption change compare to base year",
           x = "Year",
           y = "Change level") +
        theme_minimal()
     
    
    ggplotly(p)
    
  })  
  
  #---- Price Elasticity
  output$IHBS_PriceElastisity <- renderPlotly({
    # Get the filtered data
    data <- IHBS_PriceElastisity_data(df_IHBS_PriceElastisity,  input$IHBS_PriceElastisity_Category ,input$IHBS_PriceElastisity_Type)
    p <- ggplot(data, aes(x = Cross , y=value )) +
      geom_bar(stat = "identity", position = "dodge",fill = "darkgreen") +
      #scale_x_continuous(breaks = seq(87, 96, by = 1)) +
      #scale_y_continuous(breaks = seq(0, 10, by = 1)) +
      
      labs(title = "Price Elasticity of food items",
           x = "Items",
           y = "Elasticity") +
      theme_minimal()
    
    
    ggplotly(p)
    
  })  
  
  #---- Expenditure Elasticity
  output$IHBS_ExpenditureElasticity <- renderPlotly({
    # Get the filtered data
    data <- IHBS_ExpenditureElastisity_data
    p <- ggplot(data, aes(x = Category , y=value )) +
      geom_bar(stat = "identity", position = "dodge",fill = "lightgreen") +
      #scale_x_continuous(breaks = seq(87, 96, by = 1)) +
      #scale_y_continuous(breaks = seq(0, 10, by = 1)) +
      
      labs(title = "Expenditure Elasticity of food items",
           x = "Items",
           y = "Elasticity") +
      theme_minimal()+
      theme(axis.text.x = element_text(angle = 45, hjust = 1))
    
    
    ggplotly(p)
    
  })  
  
  
  #---- Expenditure Elasticity
  output$IHBS_ExpenditureElasticityNew <- renderPlotly({
    # Get the filtered data
    data <- IHBS_ExpenditureElastisityNew_data
    p <- ggplot(data, aes(x = Category , y=value )) +
      geom_bar(stat = "identity", position = "dodge",fill = "lightgreen") +
      #scale_x_continuous(breaks = seq(87, 96, by = 1)) +
      #scale_y_continuous(breaks = seq(0, 10, by = 1)) +
      
      labs(title = "Expenditure Elasticity of food items",
           x = "Items",
           y = "Elasticity") +
      theme_minimal()+
      theme(axis.text.x = element_text(angle = 45, hjust = 1))
    
    
    ggplotly(p)
    
  })  
  
  #---- Price Elasticity
  output$IHBS_PriceElastisityNew <- renderPlotly({
    # Get the filtered data
    data <- IHBS_PriceElastisityNew_data(df_IHBS_PriceElastisityNew,  input$IHBS_PriceElastisityNew_Category ,input$IHBS_PriceElastisityNew_Type)
    p <- ggplot(data, aes(x = Cross , y=value )) +
      geom_bar(stat = "identity", position = "dodge",fill = "darkgreen") +
      #scale_x_continuous(breaks = seq(87, 96, by = 1)) +
      #scale_y_continuous(breaks = seq(0, 10, by = 1)) +
      
      labs(title = "Price Elasticity of food items",
           x = "Items",
           y = "Elasticity") +
      theme_minimal()+
      theme(axis.text.x = element_text(angle = 45, hjust = 1))
    
    
    ggplotly(p)
    
  })  
  

  
  #---- ExpSeries
  output$IHBS_ExpSeries <- renderPlotly({
    # Get the filtered data
    data <- IHBS_ExpSeries_data(df_IHBS_ExpSeries,  input$IHBS_ExpSeries_Year , input$IHBS_ExpSeries_Category1,  input$IHBS_ExpSeries_Category2)

    p <- ggplot(data, aes(x = value1 , y=value2 ,color=as.factor(Dcil_Gen_Cons_Nominal))) +
      geom_point(size=0.5, alpha = 0.4)+
      scale_color_manual(values = c("1" = "red", "2" = "blue", "3" = "green", "4"="yellow",
                                    "5"="black","6"="orange","7"="pink","8"="purple","9"="brown","10"="grey"))+


      labs(title = "Household Expenditure divided by subgroup",
           x = "Value of Category1 (10000 Rials per month)",
          y = "Value of Category2 (10000 Rials per month)",
          color="Decile") +

       theme_minimal()


    ggplotly(p)

  })

  # Expenditure Share trend by each decile and subgroup ----
  output$IHBS_ExpShareRDecSeries <- renderPlotly({
    # Get the filtered data
    data <- IHBS_ExpShareRDecSeries_data(df_IHBS_ExpShareRDecSeries,  input$IHBS_ExpShareRDecSeries_Decile ,input$IHBS_ExpShareRDecSeries_Variable)
    p <- ggplot(data, aes(x = Year , y=value ,fill=Year)) +
      geom_bar(stat = "identity", position = "dodge") +
      scale_x_continuous(breaks = seq(87, 96, by = 1))  +
      
      labs(title = "Expenditure Share trend",
           x = "Year",
           y = "Expenditure Share") +
      theme_minimal()
    
    
    ggplotly(p)
    
  })  
  
  # #DecileDistinction---- 
  # output$IHBS_DecileDistinction <- renderPlotly({
  #   # Get the filtered data
  #   data <- IHBS_DecileDistinction_data(df_IHBS_DecileDistinction,  input$IHBS_DecileDistinction_year)
  # 
  #   p <- ggplot(data, aes(x = as.factor(Decile), y = value1, color = as.factor(Decile))) +
  #     geom_jitter(size = 0.1, width = 0.4) +
  #     labs(title = "Household Expenditure divided by subgroup",
  #          x = "Decile",
  #          y = "Value of Category2 (10000 Rials per month)",
  #          color = "Decile") +
  # 
  #     theme_minimal()+
  #     ylim(0, 20000)
  # 
  # 
  #   ggplotly(p)
  # 
  # })
  
  
  #----
  output$IHBS_RealExpIncProv  <- renderPlotly({
    # Get the filtered data
    data <- iran_map |> select(geometry, Province) %>%
      left_join(IHBS_RealExpIncProv_data(df_IHBS_RealExpIncProv, input$IHBS_RealExpIncProv_year, input$IHBS_RealExpIncProv_Type) |> select (Province, Value),
                by = "Province")
    centroids <- st_centroid(iran_map)
    
    p <- ggplot() +
      geom_sf(data = world, fill = "lightblue", color = NA) + # background for ocean
      # Plot surrounding countries
      geom_sf(data = world, fill = "grey80", color = "white") +
      # Plot water bodies
      geom_sf(data = water, fill = "lightblue", color = "lightblue") +
      # Plot Iran provinces with sample data
      geom_sf(data = data, aes(fill = Value)) + 
      scale_fill_gradient(low = "lightgreen", high = "darkgreen") + 
      # Add country names at centroids
      geom_text(data = neighboring_countries_centroids, 
                aes(x = st_coordinates(geometry)[,1], y = st_coordinates(geometry)[,2], 
                    label = admin), color = "darkblue", size = 3) +
      geom_text(data = centroids, 
                aes(x = st_coordinates(geometry)[,1], 
                    y = st_coordinates(geometry)[,2], 
                    label = Province), 
                size = 2, color = "darkred")+
      #scale_fill_viridis_c(option = "C", name = "Value") +
      labs(
        title = "Real Expenditure & Income per month per capita Unit: 1000 Tomans ",
        caption = "Source: Sample Data"
      ) +
      theme_minimal() +
      theme(
        panel.background = element_rect(fill = "lightblue", color = NA),  # Ocean background
        axis.text = element_blank(),
        axis.ticks = element_blank(),
        panel.grid = element_blank()
      )+
      coord_sf(xlim = c(42, 64), ylim = c(25, 40)) # Adjust xlim and ylim as needed
    
    
    # Convert to interactive plotly plot
    ggplotly(p)
    
    
    
  })
  
  #---- Real Exp Inc per decile
  output$IHBS_RealExpIncDec <- renderPlotly({
    # Get the filtered data
    data <- IHBS_RealExpIncDec_data(df_IHBS_RealExpIncDec,  input$IHBS_RealExpIncDec_Year ,input$IHBS_RealExpIncDec_Type)
    p <- ggplot(data, aes(x = Decile , y=Value , fill=Decile )) +
      geom_bar(stat = "identity", position = "dodge") +
      scale_x_continuous(breaks = seq(0, 10, by = 1)) +
      #scale_y_continuous(breaks = seq(0, 10, by = 1)) +
      
      labs(title = "Real Expenditure & Income per capita",
           x = "Decile",
           y = "Expenditure (Income) 1000 Tomans per month per capita") +
      theme_minimal()+
      theme(axis.text.x = element_text(angle = 45, hjust = 1))
    
    
    ggplotly(p)
    
  })  
  
  
  
  #----
  output$IHBS_ExpShareProv  <- renderPlotly({
    # Get the filtered data
    data <- iran_map |> select(geometry, Province) %>%
      left_join(IHBS_ExpShareProv_data(df_IHBS_ExpShareProv, input$IHBS_ExpShareProv_year, input$IHBS_ExpShareProv_Variable) |> select (Province, Value),
                by = "Province")
    centroids <- st_centroid(iran_map)
    
    p <- ggplot() +
      geom_sf(data = world, fill = "lightblue", color = NA) + # background for ocean
      # Plot surrounding countries
      geom_sf(data = world, fill = "grey80", color = "white") +
      # Plot water bodies
      geom_sf(data = water, fill = "lightblue", color = "lightblue") +
      # Plot Iran provinces with sample data
      geom_sf(data = data, aes(fill = Value)) + 
      scale_fill_gradient(low = "lightgreen", high = "darkgreen") + 
      # Add country names at centroids
      geom_text(data = neighboring_countries_centroids, 
                aes(x = st_coordinates(geometry)[,1], y = st_coordinates(geometry)[,2], 
                    label = admin), color = "darkblue", size = 3) +
      geom_text(data = centroids, 
                aes(x = st_coordinates(geometry)[,1], 
                    y = st_coordinates(geometry)[,2], 
                    label = Province), 
                size = 2, color = "darkred")+
      #scale_fill_viridis_c(option = "C", name = "Value") +
      labs(
        title = "Expenditure Share % ") +
      theme_minimal() +
      theme(
        panel.background = element_rect(fill = "lightblue", color = NA),  # Ocean background
        axis.text = element_blank(),
        axis.ticks = element_blank(),
        panel.grid = element_blank()
      )+
      coord_sf(xlim = c(42, 64), ylim = c(25, 40)) # Adjust xlim and ylim as needed
    
    
    # Convert to interactive plotly plot
    ggplotly(p)
    
    
    
  })
  
  
  
  
  
  
  #---- Real Exp Inc per decile
  output$IHBS_RealExpIncDec <- renderPlotly({
    # Get the filtered data
    data <- IHBS_RealExpIncDec_data(df_IHBS_RealExpIncDec,  input$IHBS_RealExpIncDec_Year ,input$IHBS_RealExpIncDec_Type)
    p <- ggplot(data, aes(x = Decile , y=Value , fill=Decile )) +
      geom_bar(stat = "identity", position = "dodge") +
      scale_x_continuous(breaks = seq(0, 10, by = 1)) +
      #scale_y_continuous(breaks = seq(0, 10, by = 1)) +
      
      labs(title = "Real Expenditure & Income per capita",
           x = "Decile",
           y = "Expenditure (Income) 1000 Tomans per month per capita") +
      theme_minimal()+
      theme(axis.text.x = element_text(angle = 45, hjust = 1))
    
    
    ggplotly(p)
    
  })  
  

  # Total Exp for each Household---- 
  output$IHBS_MetaData <- renderPlotly({
    # Get the filtered data
    data <- IHBS_MetaData_data(df_IHBS_MetaData,input$IHBS_MetaData_Year)

    p <- ggplot(data, aes(x = as.factor(Decile), y =Value, color = as.factor(Decile))) +
      geom_jitter(size = 0.1, width = 0.4) +
      labs(title = "Household Expenditure per Capita",
           x = "Decile",
           y = "Value (10000 Rials per month)",
           color = "Decile")+
      theme_minimal()+
     ylim(-20000, 50000)


    ggplotly(p)

  })

  
  
  # Total Exp for each Household----
  output$IHBS_MetaDataTotal <- renderPlotly({
    # Get the filtered data
    data <- IHBS_MetaDataTotal_data(df_IHBS_MetaDataTotal,input$IHBS_MetaDataTotal_Year,input$IHBS_MetaDataTotal_Variable)

    p <- ggplot(data, aes(x = as.factor(Decile), y =Value, color = as.factor(Decile))) +
      geom_jitter(size = 0.1, width = 0.4) +
      labs(title = "Household Expenditure per Capita",
           x = "Decile",
           y = "Value (10000000 Rials per month)",
           color = "Decile")+
      theme_minimal()
      #ylim(-20000, 50000)


    ggplotly(p)

  })


  
  output$IHBS_TenureDec <- renderPlotly({
    # Get the filtered data
    data <- IHBS_TenureDec_data(df_IHBS_TenureDec, input$IHBS_TenureDec_Year, input$IHBS_TenureDec_Region) %>%
      group_by(Decile) %>%
      arrange(desc(Value)) %>%   # Sort by value in descending order within each Decile
      mutate(Tenure = factor(Tenure, levels = unique(Tenure))) %>% # Update factor levels
      ungroup()
    
    
    plot_ly(data,
            x = ~Decile,
            y = ~Value,
            color = ~Tenure,
            type = 'bar',
            hovertext = ~paste(Tenure, "=", round(Value,1), "%"),
            hoverinfo = "text") %>%
      layout(title = "Tenure Status",
             xaxis = list(title = "", tickmode = "array", tickvals = unique(data$Decile)),
             yaxis = list(title = "Tenure Status", tickformat = ",", tickmode = "auto", nticks = 10), 
             barmode = 'stack',
             legend = list(orientation = "h", x = 0.5, y = -0.4, xanchor = "center")
      ) 
  })
  
  
  output$IHBS_SizeDec <- renderPlotly({
    # Get the filtered data
    data <- IHBS_TenureDec_data(df_IHBS_SizeDec, input$IHBS_SizeDec_Year, input$IHBS_SizeDec_Region) %>%
      group_by(Decile) %>%
      arrange(desc(Value)) %>%   # Sort by value in descending order within each Decile
      mutate(Size = factor(Size, levels = unique(Size)[order(Size)])) %>% # Update factor levels
      ungroup()
    
    
    plot_ly(data,
            x = ~Decile,
            y = ~Value,
            color = ~Size,
            type = 'bar',
            hovertext = ~paste(Size, "=", round(Value,0)),
            hoverinfo = "text") %>%
      layout(title = "Size Status",
             xaxis = list(title = "", tickmode = "array", tickvals = unique(data$Decile)),
             yaxis = list(title = "Size Status", tickformat = ",", tickmode = "auto", nticks = 10), 
             barmode = 'stack',
             legend = list(orientation = "h", x = 0.5, y = -0.4, xanchor = "center")
      ) 
  })
  
}
