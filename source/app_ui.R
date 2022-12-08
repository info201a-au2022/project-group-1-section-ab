library("shiny")
library("plotly")
library("shinyWidgets")
library("shinythemes")

##### Introduction

intro_page <- tabPanel(
  "Introduction",
  h1("Data Analysis on Worldwide Child Malnutrition", style = " font-size: 40px ; font-family: 'times'; font-si16pt"),
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
  can influence child malnutrition differently.", style = "font-family: 'times'; font-si16pt ; font-size:19px;"),
  br(),
  h2(strong("Analyzed Data"), style = "font-family: 'times'; font-si16pt"),
  hr(style = "border-top: 1px solid #000000;"),
  p("We focused on three types of child malnutrition symptoms which are stunting,
  overweight, and wasting. In terms of data, we analyzed both the prevalence and total
  affected numbers for each symptom. For symptoms of stunting and overweight,
  we examined the data from 2010 through 2020. However, for wasting, we were only able
  to find the data for 2020. In addition, we analyzed data in terms of different world regions
  (divided by the World Health Organization) to examine how different places can have an influence
  on child malnutrition.", style = "font-family: 'times'; font-si16pt ; font-size:19px;"),
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
    have the symptom of stunting and wasting. ", style = "font-family: 'times'; font-si16pt ; font-size:19px;"),
  br(),
  h2(strong("Research Questions"), style = "font-family: 'times'; font-si16pt"),
  hr(style = "border-top: 1px solid #000000;"),
  p("1. What is the current prevalence of children suffering from malnutrition?", style = "font-family: 'times'; font-si16pt ; font-size:19px;"),
  p("2. How much progress has been made in resolving child malnutrition in recent years?", style = "font-family: 'times'; font-si16pt ; font-size:19px;"),
  p("3. How the extent of child malnutrition varies by income and by region?", style = "font-family: 'times'; font-si16pt ; font-size:19px;"),
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
  plotlyOutput(outputId = "map", height = 500, width = 900)
)

interactive_page_one <- tabPanel(
  "Regional Levels",
  h1("The Prevalence of Children Malnutrition", style = "font-family: 'times'; font-si16pt"),
  p("This global map depicts the distribution of children under the age of five
  with various malnutrition symptoms in different regions. This map allows viewers
  to pick different malnutrition symptoms, the prevalence or number of children
  affected, and different years to have a better understanding of the global
  prevalence of malnutrition among children. The worldwide map enables viewers
  to compare and comprehend the prevalence of malnutrition globally.", style = "font-family: 'times'; font-si16pt ; font-size:19px;"),
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
  the present situation.", style = "font-family: 'times'; font-si16pt ; font-size:19px;"),
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
  on malnourished children.", style = "font-family: 'times'; font-si16pt ; font-size:19px;"),
  hr(style = "border-top: 1px solid #000000;"),
  sidebarLayout(
    pie_chart_sidebar,
    pie_chart_main
  )
)

##### Summary Takeaways

summary_takeaways <- tabPanel(
  "Summary Takeaways",
  h2(strong("Stunted Kids over Regions"), style = "font-family: 'times'; font-si16pt"),
  hr(style = "border-top: 1px solid #000000;"),
  p("We can see that there are children in every region who are experiencing different symptoms of malnutrition. 
    One of the most worrisome is the problem of stunting, and most of the stunted children are from the African region, 
    which confirms the fact that most of the children we found in our Google image search of stunted children 
    are of African descent. This is a phenomenon that deserves the attention of the world 
    to help the children who are suffering in specific regions.", style = "font-family: 'times'; font-si16pt; font-size:19px;"),
  plotlyOutput("plot_1",width ="90%"),
  #br(),
  h2(strong("Global Trends"), style = "font-family: 'times'; font-si16pt"),
  hr(style = "border-top: 1px solid #000000;"),
  p("Here we have good news and bad news.", style = "font-family: 'times'; font-si16pt; font-size:19px;"),
  p("Good: Numbers of stunted children are steadily decreasing over the last 10 years.", style = "font-family: 'times'; font-si16pt; font-size:19px;"),
  p("Bad: In this planet, more and more lovely kids are suffering from malnutrition specifically overweight.", style = "font-family: 'times'; font-si16pt; font-size:19px;"),
  p("Understanding the trend of number affected warms us how urgent it is to take actions and save those children.
     The increasing number also motivates all of us to find out which region need more help and what factor contributes to this tragedy.  
     We did a good job in some extent, but that is not enough.", style = "font-family: 'times'; font-si16pt; font-size:19px;"),
  plotlyOutput("plot_2",width = "92%"),
  #br(),
  h2(strong("Determinent - Household Income"), style = "font-family: 'times'; font-si16pt"),
  hr(style = "border-top: 1px solid #000000;"),
  p("Our last takeaway is that children in lower-middle income family need more help. The majority of malnourished kids are from
    family with lower-middle income. This finding provides policymakers a specific group that needs to be helped. This also critically reflects
    that the group we will concern more is not the low income group which we normally think. It may be one of the reasons why we see
    lower-middle and upper-middle income family have more portions. The truth is not as simply as we thought and so does helping kids. 
    We have a long but meaningful way to go.", style = "font-family: 'times'; font-si16pt; font-size:19px;"),
  plotOutput("plot_st",width = "90%"),
  plotOutput("plot_ov",width = "90%"),
  plotOutput("plot_wa",width = "90%"),
  br()
)

##### Report

report <- tabPanel(
  "Report",
  h2(strong("Project title"), style = "font-family: 'times'; font-si16pt"),
  hr(style = "border-top: 1px solid #000000;"),
  p("Data Analysis on Worldwide Child Malnutrition", style = "font-family: 'times'; font-si16pt ; font-size:19px;"),
  br(),
  h2(strong("Code name"), style = "font-family: 'times'; font-si16pt"),
  hr(style = "border-top: 1px solid #000000;"),
  p("Starving kids", style = "font-family: 'times'; font-si16pt ; font-size:19px;"),
  br(),
  h2(strong("Authors"), style = "font-family: 'times'; font-si16pt"),
  hr(style = "border-top: 1px solid #000000;"),
  p("Jing Cao", style = "font-family: 'times'; font-si16pt ; font-size:19px;"),
  a("caojing@uw.edu", href = "caojing@uw.edu"),
  p("JingJing Dong", style = "font-family: 'times'; font-si16pt ; font-size:19px;"),
  a("jdong02@uw.edu", href = "caojing@uw.edu"),
  p("Xinyue Sun", style = "font-family: 'times'; font-si16pt ; font-size:19px;"),
  a("xsun6@uw.edu", href = "caojing@uw.edu"),
  p("Erica Zhang", style = "font-family: 'times'; font-si16pt ; font-size:19px;"),
  a("qiyinz@uw.edu", href = "caojing@uw.edu"),
  br(),
  h2(strong("Affiliation"), style = "font-family: 'times'; font-si16pt"),
  hr(style = "border-top: 1px solid #000000;"),
  p("INFO-201: Technical Foundations of Informatics - The Information School - University of Washington", style = "font-family: 'times'; font-si16pt ; font-size:19px;"),
  br(),
  h2(strong("Date"), style = "font-family: 'times'; font-si16pt"),
  hr(style = "border-top: 1px solid #000000;"),
  p("Autumn 2022", style = "font-family: 'times'; font-si16pt ; font-size:19px;"),
  br(),
  h2(strong("Abstract"), style = "font-family: 'times'; font-si16pt"),
  hr(style = "border-top: 1px solid #000000;"),
  p("Our main question is to investigate the pattern of child malnutrition over
    geography and time. As a minority group, children have been majorly excluded
    from the information system. Therefore, it is significantly important for us
    to pay more attention to them. In helping to address this problem, especially
    for children in marginal regions, we will present a comprehensive analysis of
    the data on this topic with the aim of driving more attention to them.", style = "font-family: 'times'; font-si16pt ; font-size:19px;"),
  br(),
  h2(strong("Keywords"), style = "font-family: 'times'; font-si16pt"),
  hr(style = "border-top: 1px solid #000000;"),
  p("Children, Health, Malnutrition, Stunting", style = "font-family: 'times'; font-si16pt ; font-size:19px;"),
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
    and thus contribute to actions to address this problem.", style = "font-family: 'times'; font-si16pt ; font-size:19px;"),
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
    that more people will pay attention to it and end this tragedy.", style = "font-family: 'times'; font-si16pt ; font-size:19px;"),
  p("For our analysis, people who have been concerned about children and children's
    health, Child Welfare Organizations and policymakers will be the direct
    stakeholders of this webpage. They will actively search and browse such
    websites and statistical analysis to more accurately help children in distress.
    Those indirect stakeholders such as producers and manufactures of child food will
    most likely be affected if our analysis is seen by a large enough number of people.
    Companies and factories will rigorously ration and maximize the nutrition that
    children can get from food. Coupled with improved policies and special attention
    to certain families, marginalized and malnourished children will also be cared
    for and treated.", style = "font-family: 'times'; font-si16pt ; font-size:19px;"),
  p("At the same time, our analysis will achieve the human values of safety and system reliability,
    which are mutually reinforcing in the case of child malnutrition and child health.
    When child malnutrition is given more attention and improved, the health and
    safety of children will be ensured. When parents see business, organizations
    and government’s efforts to focus on children's health, their system reliability
    for society will rise. Likewise, when citizens see that marginalization is being
    addressed, they will have more hope for their lives.", style = "font-family: 'times'; font-si16pt ; font-size:19px;"),
  p("The concern for children's health is a natural benefit of our analysis. This
    also answers the question “How might the system influence how people make and
    sustain friendships and family relationships?” in Time domain (Sustained friendships
    - envisioning cards, 2011). This website could strengthen family relationships by
    improving a child’s safety and health. But at the same time, this analysis has the
    potential to push mothers and even women into invective. As we all know, the
    majority of those responsible for caring for infants and children are still mothers
    or women. When the issue of child malnutrition is put under the public spotlight,
    those who are responsible for caring for children, mothers and women, are likely
    to be accused of being irresponsible.", style = "font-family: 'times'; font-si16pt ; font-size:19px;"),
  br(),
  h2(strong("Research Questions"), style = "font-family: 'times'; font-si16pt"),
  hr(style = "border-top: 1px solid #000000;"),
  p(strong("1. What is the current prevalence of children suffering from malnutrition?"), style = "font-family: 'times'; font-si16pt ; font-size:19px;"),
  p("The preliminary work is to learn the number of undernourished children with each symptom
    in the current world. Based on this factual data, we would develop a basic
    understanding of child malnutrition. More importantly, those who are concerned
    about this issue could obtain quantitative evidence for their work.", style = "font-family: 'times'; font-si16pt ; font-size:19px;"),
  br(),
  p(strong("2. How much progress has been made in resolving child malnutrition in recent years?"), style = "font-family: 'times'; font-si16pt ; font-size:19px;"),
  p("Next, we want to see how the number and proportion of child malnutrition have changed over the
    past two decades. The trend of the improvement in children’s nutritional levels could motivate
    people to reflect on the systemic reliability of relevant fields, such as the food
    supply market.", style = "font-family: 'times'; font-si16pt ; font-size:19px;"),
  br(),
  p(strong("3. How the extent of child malnutrition varies by country and by region?"), style = "font-family: 'times'; font-si16pt ; font-size:19px;"),
  p("Furthermore, we intend to examine whether child malnutrition is disproportionately distributed worldwide.
    In particular, the relationship between the nutritional status of children in different regions and the
    local economic strength is worth exploring. Based on these results, policymakers in each country can
    formulate solutions.", style = "font-family: 'times'; font-si16pt ; font-size:19px;"),
  br(),
  h2(strong("The Dataset"), style = "font-family: 'times'; font-si16pt"),
  hr(style = "border-top: 1px solid #000000;"),
  p(strong("Description of dataset"), style = "font-family: 'times'; font-si16pt ; font-size:19px;"),
  p("Stunting - Prevalence", style = "font-family: 'times'; font-si16pt ; font-size:19px;"),
  p("Stunting refers to children who are too short for his or her height. In this dataset, the
    percentage of children aged 0-59 months whose height-for-age was below minus two standard
    deviations from WHO child growth standards was recorded for 87 different countries and
    territories from 2000 to 2020.", style = "font-family: 'times'; font-si16pt ; font-size:19px;"),
  p("Overweight - Prevalence", style = "font-family: 'times'; font-si16pt ; font-size:19px;"),
  p("Overweight refers to children who are too heavy for his or her height. In this dataset,
    the percentage of children aged 0-59 months whose weight-for-height was higher than minus
    two standard deviations from WHO child growth standards was recorded for 87 different countries
    and territories from 2000 to 2020.", style = "font-family: 'times'; font-si16pt ; font-size:19px;"),
  p("Wasting - Prevalence & Numbers", style = "font-family: 'times'; font-si16pt ; font-size:19px;"),
  p("Wasting refers to children who are too thin for his or her height. In this dataset, the percentage
    of children aged 0-59 months whose weight-for-height was above minus three standard deviations
    from WHO child growth standards in 2020 was recorded for 87 different countries and territories.", style = "font-family: 'times'; font-si16pt ; font-size:19px;"),
  p("Wasting - Detail", style = "font-family: 'times'; font-si16pt ; font-size:19px;"),
  p("This dataset is about a more detailed trend for children whose weight-for-height was above minus
    three standard deviations. This dataset could be used together with the Wasting - Prevalence &
    Numbers for better understanding the datasets.", style = "font-family: 'times'; font-si16pt ; font-size:19px;"),
  p("Overall", style = "font-family: 'times'; font-si16pt ; font-size:19px;"),
  p("These three aspects together make up the data on child malnutrition, and they all contain data over time and by country
    and region, allowing us to reach our research objective, which is to investigate the pattern of child malnutrition
    over geography and time. By comparing the data across different years, we can analyze our research question.", style = "font-family: 'times'; font-si16pt ; font-size:19px;"),
  p(strong("Summary of dataset"), style = "font-family: 'times'; font-si16pt ; font-size:19px;"),
  tableOutput("dataset_info"),
  p(strong("The Provenance of Our Dataset"), style = "font-family: 'times'; font-si16pt ; font-size:19px;"),
  p("Because all datasets cover prevalence trend indices, such a dataset helps us to study the prevalence
    of malnourished children in general. The dataset counts data for each country, which facilitates us to
    study how child malnutrition differs or affects each region. By comparing the trends of malnourished
    children across countries and regions, further analysis of the impact of household income could be reached.", style = "font-family: 'times'; font-si16pt ; font-size:19px;"),
  p(strong("Description of dataset"), style = "font-family: 'times'; font-si16pt ; font-size:19px;"),
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
    The above information is derived from the official website of UNICEF.", style = "font-family: 'times'; font-si16pt ; font-size:19px;"),
  br(),
  h2(strong("Expected Implications"), style = "font-family: 'times'; font-si16pt"),
  hr(style = "border-top: 1px solid #000000;"),
  p("The first expected implication is linked mainly with the direct stakeholder we have stated
    in the problem domain, policymakers or child welfare organizations. For policymakers, after
    examining the recent trends in child malnutrition, possible actions they might take are setting
    more strict standards in checking the food quality for children. In addition, it is also possible for them
    to enact welfare policies with a more intuitive focus on regions that have the most severe circumstances.
    Besides, we also expect that child welfare organizations worldwide will thrive to provide more assistance
    for children with malnutrition and work toward guaranteeing every child's well-being.", style = "font-family: 'times'; font-si16pt ; font-size:19px;"),
  p("The second expected implication is our indirect stakeholder, children's food manufacturers.
    As we strive for greater awareness of child malnutrition, we anticipate that children's food
    manufacturers might be contacted and reached by policymakers or welfare organizations.
    We expect those food manufacturers to put efforts into dealing with child malnutrition,
    for example, introducing more nutritionally balanced products and putting more consideration
    on regional differences.", style = "font-family: 'times'; font-si16pt ; font-size:19px;"),
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
    style = "font-family: 'times'; font-si16pt ; font-size:19px;"
  ),
  p("The second limitation we are concerning is the lack of data for some regions.
  With this limitation, we will possibly encounter difficulty in answering our research question,
  how the extent of child malnutrition varies by country and region? In addressing this problem, we
  will make explicit explanations on that and try to eliminate misleading information to the largest extent.",
    style = "font-family: 'times'; font-si16pt ; font-size:19px;"
  ),
  br(),
  h2(strong("Findings"), style = "font-family: 'times'; font-si16pt"),
  hr(style = "border-top: 1px solid #000000;"),
  p(strong("1. What is the current prevalence of children suffering from malnutrition?"), style = "font-family: 'times'; font-si16pt ; font-size:19px;"),
  p("There are several global prevalence patterns for various child malnutrition symptoms.
  To begin with, Africa, the Eastern Mediterranean, and South-East Asia have much greater rates 
  of child stunting than other regions, as indicated by the deeper colors on the interactive map.
  In comparison, children in the Americas, Europe, the Eastern Mediterranean, and the Western Pacific
  are more likely to be overweight. In particular, both Eastern Mediterranean countries have a significant
  prevalence of symptoms in malnourished children, which merits additional consideration. We do not have 
  enough data to evaluate for waste, however based on the available data, South-East Asia has a greater 
  dispersion. As a result, the prevalence trend of child malnutrition varies greatly from region to region. 
", style = "font-family: 'times'; font-si16pt ; font-size:19px;"),
  br(),
  p(strong("2. How much progress has been made in resolving child malnutrition in recent years?"), style = "font-family: 'times'; font-si16pt ; font-size:19px;"),
  p("Since the prevalence of child malnutrition is very different in each region, the next 
  component we investigate is whether individuals are aware of child malnutrition and if they
  have taken action to ameliorate this aspect. Since the database only has data for 2020 wasting,
  we explored the trends of two other symptoms, using line charts to compare the numbers in 
  different regions as the years increased, and thus to determine whether child malnutrition
  has improved. For the symptom of stunting, the overall global trend is decreasing. In addition, 
  stunting prevalence and the number of effects is decreasing in all regions (Africa, Americas, 
  South-East Asia, Eastern Mediterranean, Europe, and Western Pacific according to WHO). This is
  a positive indicator that the phenomenon of malnourished children with this condition is improving. 
  However, the global incidence of overweight children leveled off between 2010 and 2020, and the number
  of persons affected rose year after year, with no improvement in the symptoms of being overweight. 
  Simultaneously, there is little increase or stagnation in the number of overweight people in all
  areas except Europe, where the number of overweight people is decreasing year after year. This shows
  that child malnutrition is still a huge issue that must be addressed.", style = "font-family: 'times'; font-si16pt ; font-size:19px;"),
  br(),
  p(strong("3. How the extent of child malnutrition varies by country and by region?"), style = "font-family: 'times'; font-si16pt ; font-size:19px;"),
  p("We discovered that child malnutrition is still an issue through the aforementioned study, 
  and we suspect that income is one of the explanations, therefore we asked questions and utilized 
  pie charts to analyze the impacts of different incomes on child malnutrition. Lower-middle income 
  children had the highest percentage of stunting children, accounting for more than 60%, followed by 
  low-income children, while upper-middle and high-income children had a lesser share. We think that 
  precise data records may be difficult to get in low-income communities due to the difficulties of data 
  surveys and the reality that some children die from starvation. According to these findings, poorer 
  income has a stronger influence on stunting. The data for overweight children changed dramatically. 
  Lower-middle and upper-middle incomes accounted for a sizable amount, 40.3% and 36.9%, respectively, 
  suggesting that medium income had a significant influence on overweight. Lower-middle income has 76.4% 
  of the waste share, whereas high income has 0.46%. This might imply that lower-middle-income families 
  have a substantial effect on wasting children.", style = "font-family: 'times'; font-si16pt ; font-size:19px;"),
  br(),
  h2(strong("Discussion"), style = "font-family: 'times'; font-si16pt"),
  hr(style = "border-top: 1px solid #000000;"),
  p("As mentioned in our first finding, trends in child malnutrition and the 
  prevalence of individual symptoms vary from region to region. This finding 
  can be extremely helpful in improving or even addressing child malnutrition. 
  This illustrates the need for different programs to be implemented in different 
  regions. For Africa, the Eastern Mediterranean, and South-East Asia, 
  where the prevalence of stunting is high, governments with this report 
  could begin or refine programs to help stunted children. For example, funding 
  could be invested in medical research for children with stunting; a separate 
  department for children with stunting could be established in children's hospitals. 
  Similarly, for the Americas, Europe, the Eastern Mediterranean, and the Western 
  Pacific regions, based on our current findings, more attention should be given to 
  addressing overweight symptoms in these regions. Therefore, in addition to the 
  above-mentioned implications, governments and regulatory authorities in these 
  regions could also focus on food safety issues, especially children's food.
  Preventing children from consuming too much sugar and fat would be effective
  in controlling the number of overweight children.",
    style = "font-family: 'times'; font-si16pt ; font-size:19px;"
  ),
  p("After investigating the awareness and actions to address malnutrition in 
  each region, we found that the number of stunting children is decreasing every
  year. This indicates that the problem of stunting is becoming more and more 
  important in each region, thus enabling more children to have a healthy life. 
  However, we also found that the global trend of the number of children affected
  by overweight is increasing year by year. On the one hand, this phenomenon 
  indicates that children are getting enough food, but on the other hand, it
  also indicates that children are getting too much food or food with an imbalanced 
  nutritional ratio. This finding will draw attention to the problem of overweight 
  in all regions. Parental control of children's diets becomes particularly important
  for children between the ages of one and five who do not yet have full choice of 
  their own diet. At the same time, the safety of the food itself and the nutritional 
  content must also be regulated and controlled.",
    style = "font-family: 'times'; font-si16pt ; font-size:19px;"
  ),
  p("We believe that there is a strong relationship between children's nutritional
  problems and the income of their families. Our findings suggest that the households
  with the three most prevalent symptoms of child malnutrition are not the lowest-income 
  households as we suspected, but rather lower-middle income and upper-middle income.  
  The finding not only shatters our suspicions but also makes us think critically about
  the causes. As mentioned in the finding, the statistics for low income may be insufficient 
  or the children in low-income households who are suffering may unfortunately go to heaven 
  before their first birthday. But at the same time, it may also indicate that the 
  lower-middle and upper-middle families have been forgotten because we all share the 
  same conjecture. Therefore, while helping low-income families, the government and major 
  organizations should also focus on other families in need, so as to give more children 
  a healthy life.", style = "font-family: 'times'; font-si16pt ; font-size:19px;"
  ),
  br(),
  h2(strong("Conclusion"), style = "font-family: 'times'; font-si16pt"),
  hr(style = "border-top: 1px solid #000000;"),
  p("TIn conclusion of this project, we did a decent job of analyzing and visualizing
  the current situation of child malnutrition globally for the last 10 years. All of these 
  were done out of the purpose of aiming for a future with no child being malnourished. Because 
  malnutrition is such a severe problem that it places children at higher risk of mortality from 
  common infections and could also increase the incidence and severity of these common infections, 
  as well as delay recovery. And due to the reason that children don't have any actual power over 
  the cyber world, which intensifies them becoming a group that is often out of the view of the
  dominant group in the technology space. Therefore this project was significantly valuable in
  helping the world pay more attention to children and child malnutrition. ", style = "font-family: 'times'; font-si16pt ; font-size:19px;"
  ),
  p("Secondly, coming back with the concept of envisioning cards that help us as the designer
  to consider our project's long-term impact deeply, let's start with the human value aspect. 
  Overall, this project connected and supported both human values, safety, and system reliability.
  While we gained more attention to child malnutrition around the world, the health condition and 
  safety of children could have obtained a greater extent of the guarantee. In terms of system 
  reliability, if organizations or governments got to notice the current situation of child malnutrition, 
  the system reliability of our society will surely be raised. Then, regarding stakeholders,
  our direct stakeholder Child Welfare Organization and policymakers will definitely take action 
  to better the situation. At the same time, we believe they will also influence the indirect 
  stakeholder like the children's food manufacturers in putting efforts with child malnutrition.",
    style = "font-family: 'times'; font-si16pt ; font-size:19px;"
  ),
  p("Lastly, in terms of the research questions, we came up with. We successfully 
    revealed the current prevalence of children suffering from malnutrition, the current year's 
    progress on child malnutrition, and how child malnutrition could be varied by region and income. 
    A quick conclusion of the key findings, Africa, the Eastern Mediterranean, and South-East Asia have 
    greater rates of stunting, whereas the Americas, Europe, the Eastern Mediterranean, and the Western 
    Pacific have this situation for overweighting. And around the recent 10 years, applying the chart 
    we have built, we could get a sense that the overall global trend for stunting has decreased. 
    However, this was the opposite for overweighting. In terms of household incomes, we found that 
    children from high-income families tend to have the lowest chance of getting stunting and wasting. 
    Overall, our project investigated the pattern of child malnutrition over geography and time and 
    revealed the public with it.",  style = "font-family: 'times'; font-si16pt ; font-size:19px;"
  ),
  br(),
  h2(strong("Acknowledgements"), style = "font-family: 'times'; font-si16pt"),
  hr(style = "border-top: 1px solid #000000;"),
  p("We are very thankful for our friends that provided inspiration for us and helped us brainstorm.
    And we are also grateful to UNICEF for making the dataset and dedicating more attention to kids worldwide.", style = "font-family: 'times'; font-si16pt ; font-size:19px;"),
  br(),
  h2(strong("References"), style = "font-family: 'times'; font-si16pt"),
  hr(style = "border-top: 1px solid #000000;"),
  p("Children: Improving survival and well-being. (2020, September 9). World Health Organization.", style = "font-family: 'times'; font-si16pt ; font-size:19px;"),
  a("https://www.who.int/news-room/fact-sheets/detail/children-reducing-mortality", href = "https://www.who.int/news-room/fact-sheets/detail/children-reducing-mortality"),
  p("Malnutrition in Children. (2022, September 6). UNICEF DATA.", style = "font-family: 'times'; font-si16pt ; font-size:19px;"),
  a("https://data.unicef.org/topic/nutrition/malnutrition/", href = "https://data.unicef.org/topic/nutrition/malnutrition/"),
  p("Query Data. (2020, June 17). UNICEF DATA.", style = "font-family: 'times'; font-si16pt ; font-size:19px;"),
  a("https://data.unicef.org/dv_index/", href = "https://data.unicef.org/dv_index/"),
  p("Shin, T. (2020, June 4). Real-life examples of discriminating artificial intelligence.", style = "font-family: 'times'; font-si16pt ; font-size:19px;"),
  a("https://towardsdatascience.com/real-life-examples-of-discriminating-artificial-intelligence-cae395a90070", href = "https://towardsdatascience.com/real-life-examples-of-discriminating-artificial-intelligence-cae395a90070"),
  p("Sustained friendships - envisioning cards. (2011)", style = "font-family: 'times'; font-si16pt ; font-size:19px;"),
  a("http://www.envisioningcards.com/envision_pdfs/Time-Sustained-Friendships.pdf", href = "http://www.envisioningcards.com/envision_pdfs/Time-Sustained-Friendships.pdf"),
  br(),
  h2(strong("Appendix A: Questions"), style = "font-family: 'times'; font-si16pt"),
  hr(style = "border-top: 1px solid #000000;"),
  p("N/A", style = "font-family: 'times'; font-si16pt ; font-size:19px;"),
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
