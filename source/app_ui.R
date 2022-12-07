library("shiny")
library("plotly")
library("shinyWidgets")
library("shinythemes")
##### Introduction

intro_page <- tabPanel(
  "Introduction",
  h1("Data Analysis on Worldwide Child Malnutrition", style = " font-size: 43px ; font-family: 'times'; font-si16pt"),
  br(),
  img("", src = "https://www.compassion.com/Images/child-malnutrition_162716_1280x553.jpg", style = "display: block; margin-left: auto; margin-right: auto;", width = "95%"),
  br(),
  h2(strong("Introduction/Problem Domain"), style = "font-family: 'times'; font-si16pt"),
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
  h2(strong("Analyzed Data"), style = "font-family: 'times'; font-si16pt"),
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
  h2(strong("Key Findings"), style = "font-family: 'times'; font-si16pt"),
  hr(style = "border-top: 1px solid #000000;"),
  p("Throughout this project, some key findings are that different symptoms of 
    malnutrition have very different trends in recent years and child malnutrition 
    circumstances are also very different across various regions worldwide. 
    Household income level can also affect child malnutrition, and we found that 
    high-income households tend to have the lowest chance of causing children to 
    have the symptom of stunting and wasting. ", style = "font-family: 'times'; font-si16pt ; font-size:22px;"),
  br(),
  h2(strong("Research Questions"), style = "font-family: 'times'; font-si16pt"),
  hr(style = "border-top: 1px solid #000000;"),
  p("1. What is the current prevalence of children suffering from malnutrition?", style = "font-family: 'times'; font-si16pt ; font-size:22px;"),
  p("2. How much progress has been made in resolving child malnutrition in recent years?", style = "font-family: 'times'; font-si16pt ; font-size:22px;"),
  p("3. How the extent of child malnutrition varies by income and by region?", style = "font-family: 'times'; font-si16pt ; font-size:22px;"),
  br()
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
  selectInput(
    inputId = "map_year",
    label = "Year",
    choices = 2020:2010,
    selected = 2020
  )
)

map_main <- mainPanel(
  plotlyOutput(outputId = "map", height = 600, width = 1000)
)

interactive_page_one <- tabPanel(
  "Regional Levels",
  h1("The Prevalence of Children Malnutrition", style = "font-family: 'times'; font-si16pt"),
  p("This global map depicts the distribution of children under the age of five 
  with various malnutrition symptoms in different regions. This map allows viewers
  to pick different malnutrition symptoms, the prevalence or number of children 
  affected, and different years to have a better understanding of the global 
  prevalence of malnutrition among children. The worldwide map enables viewers 
  to compare and comprehend the prevalence of malnutrition globally.", style = "font-family: 'times'; font-si16pt ; font-size:22px;"),
  hr(style = "border-top: 1px solid #000000;"),
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
  h1("Regional Trends of Children Malnutrition", style = "font-family: 'times'; font-si16pt"),
  p("This line chart depicts the trend of malnourished children in various regions
  over years. Similar to the first page, the viewers could compare distinct trends
  by selecting different symptoms, data, and regions. The WHO classification is 
  used to define the regions. In general, the trend of child malnutrition diminishes 
  with each year, however malnutrition is still on the rise in some areas with 
  overweight signs. This line graph enables the audience to clearly grasp the 
  trajectory of child malnutrition in various locations as well as reflect on 
  the present situation.", style = "font-family: 'times'; font-si16pt ; font-size:22px;"),
  hr(style = "border-top: 1px solid #000000;"),
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
  h1("Impact of Income on Children Malnutrition", style = "font-family: 'times'; font-si16pt"),
  p("This pie chart depicts the percentage of childhood malnutrition in different 
  regions with varying income levels. The pie chart employs different colors to 
  distinguish the various percentages, allowing the viewer to easily perceive the 
  amount of malnutrition among children of various income levels. Different symptoms
  and years might also be chosen for comparison and observation. The percentage of 
  malnourished children is higher in lower-middle income areas across all years. 
  The proportion varies greatly by area for various symptoms. This interactive portal
  allows visitors to compare and comprehend the impact of different income levels 
  on malnourished children.", style = "font-family: 'times'; font-si16pt ; font-size:22px;"),
  hr(style = "border-top: 1px solid #000000;"),
  sidebarLayout(
    pie_chart_sidebar,
    pie_chart_main
  )
)

##### Summary Takeaways

summary_takeaways <- tabPanel(
  "Summary Takeaways",
  h1("Summary Takeaways", style = " font-size: 43px ; font-family: 'times'; font-si16pt"),
  br(),
  h2(strong("Stunted Kids over Regions"), style = "font-family: 'times'; font-si16pt"),
  plotOutput(outputID = "plot_1",width ="70%"),
  p("we can see that ")
)

##### Report

report <- tabPanel(
  "Report",
  h2(strong("Project title"), style = "font-family: 'times'; font-si16pt"),
  hr(style = "border-top: 1px solid #000000;"),
  p("Data Analysis on Worldwide Child Malnutrition", style = "font-family: 'times'; font-si16pt ; font-size:22px;"),
  br(),
  h2(strong("Code name"), style = "font-family: 'times'; font-si16pt"),
  hr(style = "border-top: 1px solid #000000;"),
  p("Starving kids", style = "font-family: 'times'; font-si16pt ; font-size:22px;"),
  br(),
  h2(strong("Authors"), style = "font-family: 'times'; font-si16pt"),
  hr(style = "border-top: 1px solid #000000;"),
  p("Jing Cao", style = "font-family: 'times'; font-si16pt ; font-size:22px;"),
  a("caojing@uw.edu", href = "caojing@uw.edu"),
  p("JingJing Dong", style = "font-family: 'times'; font-si16pt ; font-size:22px;"),
  a("jdong02@uw.edu", href = "caojing@uw.edu"),
  p("Xinyue Sun", style = "font-family: 'times'; font-si16pt ; font-size:22px;"),
  a("xsun6@uw.edu", href = "caojing@uw.edu"),
  p("Erica Zhang", style = "font-family: 'times'; font-si16pt ; font-size:22px;"),
  a("qiyinz@uw.edu", href = "caojing@uw.edu"),
  br(),
  h2(strong("Affiliation"), style = "font-family: 'times'; font-si16pt"),
  hr(style = "border-top: 1px solid #000000;"),
  p("INFO-201: Technical Foundations of Informatics - The Information School - University of Washington", style = "font-family: 'times'; font-si16pt ; font-size:22px;"),
  br(),
  h2(strong("Date"), style = "font-family: 'times'; font-si16pt"),
  hr(style = "border-top: 1px solid #000000;"),
  p("Autumn 2022", style = "font-family: 'times'; font-si16pt ; font-size:22px;"),
  br(),
  h2(strong("Abstract"), style = "font-family: 'times'; font-si16pt"),
  hr(style = "border-top: 1px solid #000000;"),
  p("Our main question is to investigate the pattern of child malnutrition over 
    geography and time. As a minority group, children have been majorly excluded 
    from the information system. Therefore, it is significantly important for us 
    to pay more attention to them. In helping to address this problem, especially 
    for children in marginal regions, we will present a comprehensive analysis of 
    the data on this topic with the aim of driving more attention to them.", style = "font-family: 'times'; font-si16pt ; font-size:22px;"),
  br(),
  h2(strong("Keywords"), style = "font-family: 'times'; font-si16pt"),
  hr(style = "border-top: 1px solid #000000;"),
  p("Children, Health, Malnutrition, Stunting", style = "font-family: 'times'; font-si16pt ; font-size:22px;"),
  br(),
  h2(strong("Introduction"), style = "font-family: 'times'; font-si16pt"),
  hr(style = "border-top: 1px solid #000000;"),
  p("Concerned with child health issues, this project aims to analyze and visualize child malnutrition
    on the global scale in recent years. As UNICEF pointed out, “undernutrition puts children 
    at greater risk of dying from common infections, increases the frequency and severity 
    of such infections, and delays recovery” (Malnutrition in Children, 2022), good 
    nutritional conditions are the foundation for children to thrive. However, the 
    health status of children from minoritized groups is often out of the view of 
    dominant groups. Therefore, revealing the changing process of child malnutrition
    around the world can arouse people’s awareness of this problem. In this project,
    we would use the survey estimates about child malnutrition provided by UNICEF to 
    present the distributions of stunting, wasting, and overweight children under 
    the age of five in different regions from 2000 to 2020. Through this data analysis
    and visualization, we hope to improve public understanding of child malnutrition 
    and thus contribute to actions to address this problem.", style = "font-family: 'times'; font-si16pt ; font-size:22px;"),
  br(),
  h2(strong("Problem Domain"), style = "font-family: 'times'; font-si16pt"),
  hr(style = "border-top: 1px solid #000000;"),
  p("Health issues, especially children's health, have always been a social issue that 
    deserves to be discussed and focused on. For infants and young children, 
    and for children under the age of three, malnutrition can be deadly. By 2020,
    nearly half of all under-five deaths could be attributed to malnutrition 
    (Malnutrition in Children, 2022). Malnutrition will increase the risk of 
    children dying from other common infections (Children: Improving survival 
    and well-being, 2020). Fortunately, as civilization and the economy progressed,
    attention toward these issues were slowly and steadily raised. Unfortunately,
    compared to the total population, only a small percentage of people are concerned,
    and even fewer are taking action to improve. Although the prevalence of stunting 
    has been declining since 2000, more than one in five children under the age of 
    five were stunted in 2020, and 45.4 million of the 149.2 million children under 
    the age of five are still suffering from wasting (Malnutrition in Children, 2022).
    The analysis we have done shows how malnutrition in children is, and we also hope 
    that more people will pay attention to it and end this tragedy.", style = "font-family: 'times'; font-si16pt ; font-size:22px;"),
  p("For our analysis, people who have been concerned about children and children's 
    health, Child Welfare Organizations and policymakers will be the direct 
    stakeholders of this webpage. They will actively search and browse such 
    websites and statistical analysis to more accurately help children in distress. 
    Those indirect stakeholders such as producers and manufactures of child food will 
    most likely be affected if our analysis is seen by a large enough number of people. 
    Companies and factories will rigorously ration and maximize the nutrition that 
    children can get from food. Coupled with improved policies and special attention
    to certain families, marginalized and malnourished children will also be cared 
    for and treated.", style = "font-family: 'times'; font-si16pt ; font-size:22px;"),
  p("At the same time, our analysis will achieve the human values of safety and system reliability, 
    which are mutually reinforcing in the case of child malnutrition and child health.
    When child malnutrition is given more attention and improved, the health and 
    safety of children will be ensured. When parents see business, organizations 
    and government’s efforts to focus on children's health, their system reliability
    for society will rise. Likewise, when citizens see that marginalization is being
    addressed, they will have more hope for their lives.", style = "font-family: 'times'; font-si16pt ; font-size:22px;"),
  p("The concern for children's health is a natural benefit of our analysis. This 
    also answers the question “How might the system influence how people make and 
    sustain friendships and family relationships?” in Time domain (Sustained friendships
    - envisioning cards, 2011). This website could strengthen family relationships by 
    improving a child’s safety and health. But at the same time, this analysis has the 
    potential to push mothers and even women into invective. As we all know, the 
    majority of those responsible for caring for infants and children are still mothers
    or women. When the issue of child malnutrition is put under the public spotlight, 
    those who are responsible for caring for children, mothers and women, are likely 
    to be accused of being irresponsible.", style = "font-family: 'times'; font-si16pt ; font-size:22px;"),
  br(),
  h2(strong("Research Questions"), style = "font-family: 'times'; font-si16pt"),
  hr(style = "border-top: 1px solid #000000;"),
  p(strong("1. What is the current prevalence of children suffering from malnutrition?"), style = "font-family: 'times'; font-si16pt ; font-size:22px;"),
  p("The preliminary work is to learn the number of undernourished children with each symptom 
    in the current world. Based on this factual data, we would develop a basic 
    understanding of child malnutrition. More importantly, those who are concerned
    about this issue could obtain quantitative evidence for their work.", style = "font-family: 'times'; font-si16pt ; font-size:22px;"),
  br(),
  p(strong("2. How much progress has been made in resolving child malnutrition in recent years?"), style = "font-family: 'times'; font-si16pt ; font-size:22px;"),
  p("Next, we want to see how the number and proportion of child malnutrition have changed over the 
    past two decades. The trend of the improvement in children’s nutritional levels could motivate 
    people to reflect on the systemic reliability of relevant fields, such as the food 
    supply market.", style = "font-family: 'times'; font-si16pt ; font-size:22px;"),
  br(),
  p(strong("3. How the extent of child malnutrition varies by country and by region?"), style = "font-family: 'times'; font-si16pt ; font-size:22px;"),
  p("Furthermore, we intend to examine whether child malnutrition is disproportionately distributed worldwide. 
    In particular, the relationship between the nutritional status of children in different regions and the 
    local economic strength is worth exploring. Based on these results, policymakers in each country can 
    formulate solutions.", style = "font-family: 'times'; font-si16pt ; font-size:22px;"),
  br(),
  h2(strong("The Dataset"), style = "font-family: 'times'; font-si16pt"),
  hr(style = "border-top: 1px solid #000000;"),
  p(strong("Description of dataset"), style = "font-family: 'times'; font-si16pt ; font-size:22px;"),
  p("Stunting - Prevalence", style = "font-family: 'times'; font-si16pt ; font-size:22px;"),
  p("Stunting refers to children who are too short for his or her height. In this dataset, the 
    percentage of children aged 0-59 months whose height-for-age was below minus two standard 
    deviations from WHO child growth standards was recorded for 87 different countries and
    territories from 2000 to 2020.", style = "font-family: 'times'; font-si16pt ; font-size:22px;"),
  
  p("Overweight - Prevalence", style = "font-family: 'times'; font-si16pt ; font-size:22px;"),
  p("Overweight refers to children who are too heavy for his or her height. In this dataset, 
    the percentage of children aged 0-59 months whose weight-for-height was higher than minus 
    two standard deviations from WHO child growth standards was recorded for 87 different countries
    and territories from 2000 to 2020.", style = "font-family: 'times'; font-si16pt ; font-size:22px;"),
  
  p("Wasting - Prevalence & Numbers", style = "font-family: 'times'; font-si16pt ; font-size:22px;"),
  p("Wasting refers to children who are too thin for his or her height. In this dataset, the percentage 
    of children aged 0-59 months whose weight-for-height was above minus three standard deviations 
    from WHO child growth standards in 2020 was recorded for 87 different countries and territories.", style = "font-family: 'times'; font-si16pt ; font-size:22px;"),
  
  p("Wasting - Detail", style = "font-family: 'times'; font-si16pt ; font-size:22px;"),
  p("This dataset is about a more detailed trend for children whose weight-for-height was above minus
    three standard deviations. This dataset could be used together with the Wasting - Prevalence & 
    Numbers for better understanding the datasets.", style = "font-family: 'times'; font-si16pt ; font-size:22px;"),
  p("Overall", style = "font-family: 'times'; font-si16pt ; font-size:22px;"),
  p("These three aspects together make up the data on child malnutrition, and they all contain data over time and by country
    and region, allowing us to reach our research objective, which is to investigate the pattern of child malnutrition 
    over geography and time. By comparing the data across different years, we can analyze our research question.", style = "font-family: 'times'; font-si16pt ; font-size:22px;"),
  p(strong("Summary of dataset"), style = "font-family: 'times'; font-si16pt ; font-size:22px;"),
  img("", src = "datasetTable.png"),
  a("Citation: Malnutrition in Children. (2022, September 6). UNICEF DATA.", href = "https://data.unicef.org/topic/nutrition/malnutrition/"),
  p(strong("The Provenance of Our Dataset"), style = "font-family: 'times'; font-si16pt ; font-size:22px;"),
  p("Because all datasets cover prevalence trend indices, such a dataset helps us to study the prevalence
    of malnourished children in general. The dataset counts data for each country, which facilitates us to 
    study how child malnutrition differs or affects each region. By comparing the trends of malnourished 
    children across countries and regions, further analysis of the impact of household income could be reached.", style = "font-family: 'times'; font-si16pt ; font-size:22px;"),
  p(strong("Description of dataset"), style = "font-family: 'times'; font-si16pt ; font-size:22px;"),
  p("The collector of the dataset is the United Nations International Children's Emergency Fund (UNICEF). 
  The first version of Joint Malnutrition Estimates was released in 2012 and provided estimates of stunting, 
  wasting, severe wasting, underweight, and overweight, with detailed descriptions of the methodology. 
  The latest edition was updated in May 2022. UNICEF has a mission to address the long-term needs of 
  children and women in developing countries everywhere. This dataset was created to respond to the call
  for harmonization of child malnutrition estimates. UNICEF relies solely on voluntary contributions.
  Researchers and related organizations and institutions wishing to conduct statistics and research on
  undernourished children have access to this data set for valid analysis (Malnutrition in Children, 2022).
  Since UNICEF is a nonprofit, nongovernmental organization, there are not many people who can profit from
  this data. They validate the data by updating national primary source data sets, applying country-level 
  models of stunting and overweight to generate annual estimates, generating regional and global totals for
  stunting, wasting, severe wasting, and overweight, and consulting with countries before finalizing and 
  disseminating estimates for 2021. They have the UNICEF Data Warehouse to host the dataset, which contains
  a database of hundreds of internationally valid and comparable indicators (Query Data, 2020). It is a 
  credible source of data because the organization has reliable sources of data collection and models for 
  collating data. We obtain these data by accessing the official UNICEF website, querying, 
  and filtering relevant data, and downloading data. When analyzing and using the data, 
    such as writing paragraphs and creating web pages, we will indicate the source of the data. 
    The above information is derived from the official website of UNICEF.", style = "font-family: 'times'; font-si16pt ; font-size:22px;"),
  br(),
  h2(strong("Expected Implications"), style = "font-family: 'times'; font-si16pt"),
  hr(style = "border-top: 1px solid #000000;"),
  p("The first expected implication is linked mainly with the direct stakeholder we have stated
    in the problem domain, policymakers or child welfare organizations. For policymakers, after
    examining the recent trends in child malnutrition, possible actions they might take are setting
    more strict standards in checking the food quality for children. In addition, it is also possible for them 
    to enact welfare policies with a more intuitive focus on regions that have the most severe circumstances. 
    Besides, we also expect that child welfare organizations worldwide will thrive to provide more assistance 
    for children with malnutrition and work toward guaranteeing every child's well-being.", style = "font-family: 'times'; font-si16pt ; font-size:22px;"),
  p("The second expected implication is our indirect stakeholder, children's food manufacturers. 
    As we strive for greater awareness of child malnutrition, we anticipate that children's food 
    manufacturers might be contacted and reached by policymakers or welfare organizations. 
    We expect those food manufacturers to put efforts into dealing with child malnutrition, 
    for example, introducing more nutritionally balanced products and putting more consideration
    on regional differences.", style = "font-family: 'times'; font-si16pt ; font-size:22px;"),
  br(),
  h2(strong("Limitations"), style = "font-family: 'times'; font-si16pt"),
  hr(style = "border-top: 1px solid #000000;"),
  p("The first limitation we are encountering is the estimated dataset. All the data files 
    we are using are modeled, and survey estimates. In detail, UNICEF applied country-level 
    models to generate annual estimates, generating regional and global totals of stunting, 
    wasting, severe wasting, and overweight. Therefore, we are concerned about the lack of 
    accuracy in this information. Specifically, some factors we considered are over-optimism 
    about the circumstance or failure to account for risks (Malnutrition in Children, 2022). 
    Plus, algorithm models would inevitably result in unexpected bias or discrimination (Shin, 2020). 
    To address this limitation, we decided not to use the dataset directly. Instead, we will calculate 
    the ratio or proportion by adopting more datasets and providing a relatively more accurate result.", 
    style = "font-family: 'times'; font-si16pt ; font-size:22px;"),
  p("The second limitation we are concerning is the lack of data for some regions. 
  With this limitation, we will possibly encounter difficulty in answering our research question, 
  how the extent of child malnutrition varies by country and region? In addressing this problem, we 
  will make explicit explanations on that and try to eliminate misleading information to the largest extent.", 
    style = "font-family: 'times'; font-si16pt ; font-size:22px;"),
  br(),
  h2(strong("Acknowledgements"), style = "font-family: 'times'; font-si16pt"),
  hr(style = "border-top: 1px solid #000000;"),
  p("We are very thankful for our friends that provided inspiration for us and helped us brainstorm. 
    And we are also grateful to UNICEF for making the dataset and dedicating more attention to kids worldwide.", style = "font-family: 'times'; font-si16pt ; font-size:22px;"),
  br(),
  h2(strong("References"), style = "font-family: 'times'; font-si16pt"),
  hr(style = "border-top: 1px solid #000000;"),
  p("Children: Improving survival and well-being. (2020, September 9). World Health Organization.", style = "font-family: 'times'; font-si16pt ; font-size:22px;"),
  a("https://www.who.int/news-room/fact-sheets/detail/children-reducing-mortality", href = "https://www.who.int/news-room/fact-sheets/detail/children-reducing-mortality"),
  p("Malnutrition in Children. (2022, September 6). UNICEF DATA.", style = "font-family: 'times'; font-si16pt ; font-size:22px;"),
  a("https://data.unicef.org/topic/nutrition/malnutrition/", href = "https://data.unicef.org/topic/nutrition/malnutrition/"),
  p("Query Data. (2020, June 17). UNICEF DATA.", style = "font-family: 'times'; font-si16pt ; font-size:22px;"),
  a("https://data.unicef.org/dv_index/", href = "https://data.unicef.org/dv_index/"),
  p("Shin, T. (2020, June 4). Real-life examples of discriminating artificial intelligence.", style = "font-family: 'times'; font-si16pt ; font-size:22px;"),
  a("https://towardsdatascience.com/real-life-examples-of-discriminating-artificial-intelligence-cae395a90070", href = "https://towardsdatascience.com/real-life-examples-of-discriminating-artificial-intelligence-cae395a90070"),
  p("Sustained friendships - envisioning cards. (2011)", style = "font-family: 'times'; font-si16pt ; font-size:22px;"),
  a("http://www.envisioningcards.com/envision_pdfs/Time-Sustained-Friendships.pdf", href = "http://www.envisioningcards.com/envision_pdfs/Time-Sustained-Friendships.pdf"),
  br(),
  h2(strong("Appendix A: Questions"), style = "font-family: 'times'; font-si16pt"),
  hr(style = "border-top: 1px solid #000000;"),
  p("N/A", style = "font-family: 'times'; font-si16pt ; font-size:22px;"),
  br()
  
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
