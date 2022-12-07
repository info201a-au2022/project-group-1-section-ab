library("shiny")
library("plotly")
library("shinyWidgets")
library("shinythemes")
##### Introduction

intro_page <- tabPanel(
  "Introduction",
  h1("Data Analysis on Worldwide Child Malnutrition", style = " font-size: 63px ; font-family: 'times'; font-si16pt"),
  br(),
  img("", src = "https://www.compassion.com/Images/child-malnutrition_162716_1280x553.jpg", style = "display: block; margin-left: auto; margin-right: auto;", width = "95%"),
  br(),
  h2("Introduction/Problem Domain", style = "font-family: 'times'; font-si16pt"),
  hr(style = "border-top: 1px solid #000000;"),
  p("Healthy nutrition places children on a path of thriving. As UNICEF pointed out,
  “undernutrition puts children at greater risk of dying from common infections,
  increases the frequency and severity of such infections, and delays recovery.”
  To achieve the goal of a future where no child is malnourished, we are starting with
  the step of revealing the current circumstance of child malnutrition to the public.
  Thus, this project analyzed and visualized child malnutrition globally in recent years.
  Specifically, we were hoping to explore how factors like regions or household incomes
  can influence child malnutrition differently.", style = "font-family: 'times'; font-si16pt ; font-size:22px;"),
  br(),
  h2("Analyzed Data", style = "font-family: 'times'; font-si16pt"),
  hr(style = "border-top: 1px solid #000000;"),
  p("We focused on three types of child malnutrition symptoms which are stunting,
  overweight, and wasting. In terms of data, we analyzed both the prevalence and total
  affected numbers for each symptom. For symptoms of stunting and overweight,
  we examined the data from 2010 through 2020. However, for wasting, we were only able
  to find the data for 2020. In addition, we analyzed data in terms of different world regions
  (divided by the World Health Organization) to examine how different places can have an influence
  on child malnutrition.", style = "font-family: 'times'; font-si16pt ; font-size:22px;"),
  img("",
      src = "https://pbs.twimg.com/media/E0nGJfpX0AE7b-l?format=png&name=4096x4096",
      height = 400, width = 1000
  ),
  br(),
  br(),
  h2("Key Findings", style = "font-family: 'times'; font-si16pt"),
  hr(style = "border-top: 1px solid #000000;"),
  p("We focused on three types of child malnutrition symptoms which are stunting,
  overweight, and wasting. In terms of data, we analyzed both the prevalence and total
  affected numbers for each symptom. For symptoms of stunting and overweight,
  we examined the data from 2010 through 2020. However, for wasting, we were only able
  to find the data for 2020. In addition, we analyzed data in terms of different world regions
  (divided by the World Health Organization) to examine how different places can have an influence
  on child malnutrition.", style = "font-family: 'times'; font-si16pt ; font-size:22px;"),
  br(),
  h2("Research Questions", style = "font-family: 'times'; font-si16pt"),
  hr(style = "border-top: 1px solid #000000;"),
  p("1. What is the current prevalence of children suffering from malnutrition?", style = "font-family: 'times'; font-si16pt ; font-size:22px;"),
  p("2. How much progress has been made in resolving child malnutrition in recent years?", style = "font-family: 'times'; font-si16pt ; font-size:22px;"),
  p("3. How the extent of child malnutrition varies by income and by region?", style = "font-family: 'times'; font-si16pt ; font-size:22px;"),
  br()
)


##### Interactive Page 1

map_sidebar <- sidebarPanel(
  splitLayout(
    radioButtons(
      inputId = "map_symptom",
      label = "Symptom",
      choices = list(
        "Stunting" = "stunting",
        "Overweight" = "overweight",
        "Wasting" = "wasting"
      ),
      selected = "stunting",
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
  ),
  selectInput(
    inputId = "map_year",
    label = "Year",
    choices = 2020:2010,
    selected = 2020
  ),
)

map_main <- mainPanel(
  plotlyOutput(outputId = "map", height = 600, width = 1200)
)

interactive_page_one <- tabPanel(
  "Regional Levels",
  verticalLayout(
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
  "Report",
  img("", src = "datasetTable.png")
)

##### UI

ui <- navbarPage(
  "Child Malnutrition",
  theme = shinythemes::shinytheme("sandstone"),
  setBackgroundColor("#f9f7f1"),
  intro_page,
  interactive_page_one,
  interactive_page_two,
  interactive_page_three,
  summary_takeaways,
  report
)
