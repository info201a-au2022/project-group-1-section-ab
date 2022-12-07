library("stringr")
library("dplyr")
library("tidyr")
library("ggplot2")
library("plotly")

source("aggregate_table.R")
source("chart1.R")
source("chart2.R")
source("chart3.R")

malnutrition_data$region[malnutrition_data$region ==
  "African Region"] <- "Africa"
malnutrition_data$region[malnutrition_data$region ==
  "Region of the Americas"] <- "Americas"
malnutrition_data$region[malnutrition_data$region ==
  "South-East Asia Region"] <- "South-East Asia"
malnutrition_data$region[malnutrition_data$region ==
  "Eastern Mediterranean Region"] <- "Eastern Mediterranean"
malnutrition_data$region[malnutrition_data$region ==
  "Europe Region"] <- "Europe"
malnutrition_data$region[malnutrition_data$region ==
  "Western Pacific Region"] <- "Western Pacific"

who_data <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-1-section-ab/main/data/who_regions.csv")
malnutrition_data_entity <- who_data %>%
  rename(region = WHO.region) %>%
  left_join(malnutrition_data, by = "region")

server <- function(input, output, session) {
  output$map <- renderPlotly({
    map_data <- malnutrition_data_entity %>%
      filter(year == input$map_year)
    map_var <- paste0(input$map_symptom, input$map_count)
    map <- plot_geo(map_data) %>%
      add_trace(
        z = ~ get(map_var),
        color = ~ get(map_var),
        colors = "Blues",
        text = ~region, locations = ~Code,
        marker = list(line = list(color = toRGB("grey"), width = 0.5))
      ) %>%
      layout(plot_bgcolor='transparent') %>% 
      layout(paper_bgcolor='transparent') %>% 
      layout(
        geo = list(
          showframe = FALSE,
          showcoastlines = FALSE,
          projection = list(type = "Mercator")
        ) 
      )
    if (input$map_count == "_prevalence_percentage") {
      map <- map %>%
        colorbar(title = "Percentage") %>%
        layout(plot_bgcolor='transparent') %>% 
        layout(paper_bgcolor='transparent') %>% 
        layout(
          title = paste0(
            "Percentage of children under 5 affected by ",
            input$map_symptom, " (", input$map_year, ")"
          ) 
        )
      if (input$map_symptom == "stunting") {
        map <- map %>% colorbar(limits = c(0, 42))
      } else if (input$map_symptom == "overweight") {
        map <- map %>% colorbar(limits = c(0, 10))
      } else if (input$map_symptom == "wasting") {
        map <- map %>% colorbar(limits = c(0, 15))
      }
    } else {
      map <- map %>%
        colorbar(title = "Number<br>(millions)") %>% 
        layout(
          title = paste0(
            "Number (millions) of children under 5 affected by ",
            input$map_symptom, " (", input$map_year, ")"
          ) 
        )
      if (input$map_symptom == "stunting") {
        map <- map %>% colorbar(limits = c(0, 76))
      } else if (input$map_symptom == "overweight") {
        map <- map %>% colorbar(limits = c(0, 9))
      } else if (input$map_symptom == "wasting") {
        map <- map %>% colorbar(limits = c(0, 25))
      }
    } 
    return(map)
  })

  output$line_chart <- renderPlotly({
    line_data <- malnutrition_data %>%
      filter(region %in% input$line_region)
    line_var <- paste0(input$line_symptom, input$line_count)
    line_chart <- ggplot(line_data) +
      aes(x = year, y = get(line_var), ymin = 0, color = region) +
      geom_line() +
      labs(x = "Year") +
      scale_x_continuous(breaks = seq(2010, 2020, 1)) + theme_bw() + theme(rect = element_rect(fill = "transparent")) 
    if (input$line_count == "_prevalence_percentage") {
      line_chart <- line_chart +
        labs(
          title = paste(
            "Percentage of children under 5 affected by",
            input$line_symptom, "(2010-2020)"
          ),
          y = "Percentage"
        )
    } else {
      line_chart <- line_chart +
        labs(
          title = paste(
            "Number (millions) of children under 5 affected by",
            input$line_symptom, "(2010-2020)"
          ),
          y = "Number (millions)"
        )
    } 
    return(line_chart)
  })
  

  output$pie_chart <- renderPlotly({
    pie_data <- malnutrition_data %>%
      filter(year == input$pie_year) %>%
      filter(str_detect(region, regex("income")))
    pie_var <- paste0(input$pie_symptom, "_number_millions")
    pie_chart <- plot_ly(
      marker = list(colors = c('#ececec', '#bad7ff', '#96b4dd', '#708db4')),
      data = pie_data, type = "pie",
      labels = ~region,
      values = ~ get(pie_var),
      textinfo = "percent"
    ) %>%
      layout(title = paste0(
        "Share of children under 5 affected by ",
        input$pie_symptom, " (", input$pie_year, ")"
      )) %>% 
      layout(plot_bgcolor='transparent') %>% 
      layout(paper_bgcolor='transparent')
    return(pie_chart)
  })
  
  output$plot_1 <- renderPlotly(plot_1)
  output$plot_2 <- renderPlotly(chart)
  output$plot_st <- renderPlot(stunting_plot)
  output$plot_ov <- renderPlot(overweight_plot)
  output$plot_wa <- renderPlot(wasting_plot)
}
