# Data Analysis on Worldwide Child Malnutrition: Project Proposal

### Project title
Data Analysis on Worldwide Child Malnutrition

### Code name
Starving kids

### Authors
Jing Cao caojing@uw.edu  
Jingjing Dong jdong02@uw.edu  
Xinyue Sun xsun6@uw.edu  
Erica Zhang qiyinz@uw.edu  

### Affiliation
INFO-201: Technical Foundations of Informatics - The Information School - University of Washington

### Date
Autumn 2022

## Abstract
Our main question is to investigate the pattern of child malnutrition over geography and time. As a minority group, children have been majorly excluded from the information system. Therefore, it is significantly important for us to pay more attention to them. In helping to address this problem, especially for children in marginal regions, we will present a comprehensive analysis of the data on this topic with the aim of driving more attention to them.

## Keywords
Children, Health, Malnutrition, Stunting

## Introduction
Concerned with child health issues, this project aims to analyze and visualize child malnutrition on the global scale in recent years. As UNICEF pointed out, “undernutrition puts children at greater risk of dying from common infections, increases the frequency and severity of such infections, and delays recovery” (_Malnutrition in Children_, 2022), good nutritional conditions are the foundation for children to thrive. However, the health status of children from minoritized groups is often out of the view of dominant groups. Therefore, revealing the changing process of child malnutrition around the world can arouse people’s awareness of this problem. In this project, we would use the survey estimates about child malnutrition provided by UNICEF to present the distributions of stunting, wasting, and overweight children under the age of five in different regions from 2000 to 2020. Through this data analysis and visualization, we hope to improve public understanding of child malnutrition and thus contribute to actions to address this problem.

## Problem Domain
Health issues, especially children's health, have always been a social issue that deserves to be discussed and focused on. For infants and young children, and for children under the age of three, malnutrition can be deadly. By 2020, nearly half of all under-five deaths could be attributed to malnutrition (_Malnutrition in Children_, 2022). Malnutrition will increase the risk of children dying from other common infections (_Children: Improving survival and well-being_, 2020). Fortunately, as civilization and the economy progressed, attention toward these issues were slowly and steadily raised. Unfortunately, compared to the total population, only a small percentage of people are concerned, and even fewer are taking action to improve. Although the prevalence of stunting has been declining since 2000, more than one in five children under the age of five were stunted in 2020, and 45.4 million of the 149.2 million children under the age of five are still suffering from wasting (_Malnutrition in Children_, 2022). The analysis we have done shows how malnutrition in children is, and we also hope that more people will pay attention to it and end this tragedy.  

For our analysis, people who have been concerned about children and children's health, Child Welfare Organizations and policymakers will be the direct stakeholders of this webpage. They will actively search and browse such websites and statistical analysis to more accurately help children in distress. Those indirect stakeholders such as producers and manufactures of child food will most likely be affected if our analysis is seen by a large enough number of people. Companies and factories will rigorously ration and maximize the nutrition that children can get from food. Coupled with improved policies and special attention to certain families, marginalized and malnourished children will also be cared for and treated.  

At the same time, our analysis will achieve the human values of safety and system reliability, which are mutually reinforcing in the case of child malnutrition and child health. When child malnutrition is given more attention and improved, the health and safety of children will be ensured. When parents see business, organizations and government’s efforts to focus on children's health, their system reliability for society will rise. Likewise, when citizens see that marginalization is being addressed, they will have more hope for their lives.  

The concern for children's health is a natural benefit of our analysis. This also answers the question “How might the system influence how people make and sustain friendships and family relationships?” in Time domain (_Sustained friendships - envisioning cards_, 2011). This website could strengthen family relationships by improving a child’s safety and health. But at the same time, this analysis has the potential to push mothers and even women into invective. As we all know, the majority of those responsible for caring for infants and children are still mothers or women. When the issue of child malnutrition is put under the public spotlight, those who are responsible for caring for children, mothers and women, are likely to be accused of being irresponsible.

## Research Questions
1. What is the current prevalence of children suffering from malnutrition?  
The preliminary work is to learn the number of undernourished children with each symptom in the current world. Based on this factual data, we would develop a basic understanding of child malnutrition. More importantly, those who are concerned about this issue could obtain quantitative evidence for their work.

2. How much progress has been made in resolving child malnutrition in recent years?  
Next, we want to see how the number and proportion of child malnutrition have changed over the past two decades. The trend of the improvement in children’s nutritional levels could motivate people to reflect on the systemic reliability of relevant fields, such as the food supply market.

3. How the extent of child malnutrition varies by country and by region?  
Furthermore, we intend to examine whether child malnutrition is disproportionately distributed worldwide. In particular, the relationship between the nutritional status of children in different regions and the local economic strength is worth exploring. Based on these results, policymakers in each country can formulate solutions.

## The Dataset
### Description of dataset  
* Stunting - Prevalence  
Stunting refers to children who are too short for his or her height. In this dataset, the percentage of children aged 0-59 months whose height-for-age was below minus two standard deviations from WHO child growth standards was recorded for 87 different countries and territories from 2000 to 2020.
* Overweight - Prevalence  
Overweight refers to children who are too heavy for his or her height. In this dataset, the percentage of children aged 0-59 months whose weight-for-height was higher than minus two standard deviations from WHO child growth standards was recorded for 87 different countries and territories from 2000 to 2020.
* Wasting - Prevalence & Numbers  
Wasting refers to children who are too thin for his or her height. In this dataset, the percentage of children aged 0-59 months whose weight-for-height was above minus three standard deviations from WHO child growth standards in 2020 was recorded for 87 different countries and territories.
* Wasting - Detail  
This dataset is about a more detailed trend for children whose wheight-for-height was above minus three standard deviations. This dataset could be used together with the Wasting - Prevalence & Numbers for better understanding the datasets.
* Overall  
These three aspects together make up the data on child malnutrition, and they all contain data over time and by country and region, allowing us to reach our research objective, which is to investigate the pattern of child malnutrition over geography and time. By comparing the data across different years, we can analyze our research question.

### Summary of dataset
| Summary | Details |
|---------|---------|
| Data file name | 1. Stunting - Prevalence <br> 2. Overweight - Prevalence <br> 3. Wasting - Prevalence & Numbers
| Purpose | Analyzing the geographic and temporal patterns of child malnutrition
| Observations # (respectively) | 87, 87, 87, 990
| Variables # (respectively) | 52, 52, 16, 1011
| Citation | _Malnutrition in Children_. (2022, September 6). UNICEF DATA. https://data.unicef.org/topic/nutrition/malnutrition/

### Relate to Research Questions
Because all datasets cover prevalence trend indices, such a dataset helps us to study the prevalence of malnourished children in general. The dataset counts data for each country, which facilitates us to study how child malnutrition differs or affects each region. By comparing the trends of malnourished children across countries and regions, further analysis of the impact of household income could be reached.

### The Provenance of Our Dataset
The collector of the dataset is the United Nations International Children's Emergency Fund (UNICEF). The first version of Joint Malnutrition Estimates was released in 2012 and provided estimates of stunting, wasting, severe wasting, underweight, and overweight, with detailed descriptions of the methodology. The latest edition was updated in May 2022. UNICEF has a mission to address the long-term needs of children and women in developing countries everywhere. This dataset was created to respond to the call for harmonization of child malnutrition estimates. UNICEF relies solely on voluntary contributions. Researchers and related organizations and institutions wishing to conduct statistics and research on undernourished children have access to this data set for valid analysis (_Malnutrition in Children_, 2022).  

Since UNICEF is a nonprofit, nongovernmental organization, there are not many people who can profit from this data. They validate the data by updating national primary source data sets, applying country-level models of stunting and overweight to generate annual estimates, generating regional and global totals for stunting, wasting, severe wasting, and overweight, and consulting with countries before finalizing and disseminating estimates for 2021. They have the UNICEF Data Warehouse to host the dataset, which contains a database of hundreds of internationally valid and comparable indicators (_Query Data_, 2020). It is a credible source of data because the organization has reliable sources of data collection and models for collating data.  

We obtain these data by accessing the official UNICEF website, querying, and filtering relevant data, and downloading data. When analyzing and using the data, such as writing paragraphs and creating web pages, we will indicate the source of the data. The above information is derived from the official website of UNICEF.  

## Expected Implications
The first expected implication is linked mainly with the direct stakeholder we have stated in the problem domain, policymakers or child welfare organizations. For policymakers, after examining the recent trends in child malnutrition, possible actions they might take are setting more strict standards in checking the food quality for children. In addition, it is also possible for them to enact welfare policies with a more intuitive focus on regions that have the most severe circumstances. Besides, we also expect that child welfare organizations worldwide will thrive to provide more assistance for children with malnutrition and work toward guaranteeing every child's well-being.  

The second expected implication is our indirect stakeholder, children's food manufacturers. As we strive for greater awareness of child malnutrition, we anticipate that children's food manufacturers might be contacted and reached by policymakers or welfare organizations. We expect those food manufacturers to put efforts into dealing with child malnutrition, for example, introducing more nutritionally balanced products and putting more consideration on regional differences.  

## Limitations
The first limitation we are encountering is the estimated dataset. All the data files we are using are modeled, and survey estimates. In detail, UNICEF applied country-level models to generate annual estimates, generating regional and global totals of stunting, wasting, severe wasting, and overweight. Therefore, we are concerned about the lack of accuracy in this information. Specifically, some factors we considered are over-optimism about the circumstance or failure to account for risks (_Malnutrition in Children_, 2022). Plus, algorithm models would inevitably result in unexpected bias or discrimination (_Shin_, 2020). To address this limitation, we decided not to use the dataset directly. Instead, we will calculate the ratio or proportion by adopting more datasets and providing a relatively more accurate result.  

The second limitation we are concerning is the lack of data for some regions. With this limitation, we will possibly encounter difficulty in answering our research question, how the extent of child malnutrition varies by country and region? In addressing this problem, we will make explicit explanations on that and try to eliminate misleading information to the largest extent.  

## Acknowledgements
We are very thankful for our friends that provided inspiration for us and helped us brainstorm. And we are also grateful to UNICEF for making the dataset and dedicating more attention to kids worldwide.

## References
_Children: Improving survival and well-being_. (2020, September 9). World Health Organization. https://www.who.int/news-room/fact-sheets/detail/children-reducing-mortality  
_Malnutrition in Children_. (2022, September 6). UNICEF DATA. https://data.unicef.org/topic/nutrition/malnutrition/  
_Query Data_. (2020, June 17). UNICEF DATA. https://data.unicef.org/dv_index/  
Shin, T. (2020, June 4). _Real-life examples of discriminating artificial intelligence_. https://towardsdatascience.com/real-life-examples-of-discriminating-artificial-intelligence-cae395a90070  
_Sustained friendships - envisioning cards_. (2011). http://www.envisioningcards.com/envision_pdfs/Time-Sustained-Friendships.pdf  

## Appendix A: Questions
We are wondering if our topic idea is solid enough and what suggestions you have for our final project?
