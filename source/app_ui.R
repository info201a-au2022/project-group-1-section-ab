library("shiny")
library("plotly")

##### Introduction

intro_page <- tabPanel(
  "Introduction"
)

##### Interactive Page 1

map_sidebar <- sidebarPanel(
  radioButtons(
    inputId = "map_symptom",
    label = "Symptom",
    choices = list(
      "Stunting" = "stunting",
      "Overweight" = "overweight",
      "Wasting" = "wasting"
    ),
    selected = "stunting"
  ),
  radioButtons(
    inputId = "map_count",
    label = "Count",
    choices = list(
      "Prevalence" = "_prevalence_percentage",
      "Numbers Affected" = "_number_millions"
    ),
    selected = "_prevalence_percentage"
  ),
  selectInput(
    inputId = "map_year",
    label = "Year",
    choices = 2020:2010,
    selected = 2020
  )
)

map_main <- mainPanel(
  plotlyOutput(outputId = "map")
)

interactive_page_one <- tabPanel(
  "Regional Levels",
  sidebarLayout(
    map_sidebar,
    map_main
  )
)

##### Interactive Page 2

line_chart_sidebar <- sidebarPanel(
  radioButtons(
    inputId = "line_symptom",
    label = "Symptom",
    choices = list("Stunting" = "stunting", "Overweight" = "overweight"),
    selected = "stunting"
  ),
  radioButtons(
    inputId = "line_count",
    label = "Count",
    choices = list(
      "Prevalence" = "_prevalence_percentage",
      "Numbers Affected" = "_number_millions"
    ),
    selected = "_prevalence_percentage"
  ),
  selectInput(
    inputId = "line_region",
    label = "Region",
    choices = list(
      "Global" = "Global",
      "Africa" = "Africa",
      "Americas" = "Americas",
      "South-East Asia" = "South-East Asia",
      "Eastern Mediterranean" = "Eastern Mediterranean",
      "Europe" = "Europe",
      "Western Pacific" = "Western Pacific"
    ),
    selected = "Global",
    multiple = TRUE,
  )
)

line_chart_main <- mainPanel(
  plotlyOutput(outputId = "line_chart")
)

interactive_page_two <- tabPanel(
  "Regional Trends",
  sidebarLayout(
    line_chart_sidebar,
    line_chart_main
  )
)

##### Interactive Page 3

pie_chart_sidebar <- sidebarPanel(
  radioButtons(
    inputId = "pie_symptom",
    label = "Symptom",
    choices = list(
      "Stunting" = "stunting",
      "Overweight" = "overweight",
      "Wasting" = "wasting"
    ),
    selected = "stunting"
  ),
  selectInput(
    inputId = "pie_year",
    label = "Year",
    choices = 2020:2010,
    selected = 2020
  )
)

pie_chart_main <- mainPanel(
  plotlyOutput(outputId = "pie_chart")
)

interactive_page_three <- tabPanel(
  "Income Classification",
  sidebarLayout(
    pie_chart_sidebar,
    pie_chart_main
  )
)

##### Summary Takeaways

summary_takeaways <- tabPanel(
  "Summary Takeaways"
)

##### Report

report <- tabPanel(
  "Report"
)

##### UI

ui <- navbarPage(
  "Child Malnutrition",
  intro_page,
  interactive_page_one,
  interactive_page_two,
  interactive_page_three,
  summary_takeaways,
  report
)
