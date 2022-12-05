library("stringr")
library("dplyr")
library("tidyr")
library("ggplot2")
library("scales")

source("../source/aggregate_table.R")

malnutrition_by_region <- malnutrition_data %>%
  group_by(region) %>%
  summarize(
    stunting_number_millions_avg = round(mean(stunting_number_millions, na.rm = TRUE), 2),
    stunting_prevalence_percentage_avg = round(mean(stunting_prevalence_percentage, na.rm = TRUE), 2),
    overweight_number_millions_avg = round(mean(overweight_number_millions, na.rm = TRUE), 2),
    overweight_prevalence_percentage_avg = round(mean(overweight_prevalence_percentage, na.rm = TRUE), 2),
    wasting_number_millions_avg = round(mean(wasting_number_millions, na.rm = TRUE), 2),
    wasting_prevalence_percentage_avg = round(mean(wasting_prevalence_percentage, na.rm = TRUE), 2)
  )

malnutrition_by_income <- malnutrition_by_region %>% 
  filter(str_detect(region, regex('income', ignore_case = T))) %>% 
  rename(income = region) %>% 
  slice(2, 3, 5, 1)

blank_theme <- theme_bw() + theme(
  axis.line = element_blank(),
  axis.text = element_blank(),
  axis.ticks = element_blank(),
  axis.title = element_blank(),
  panel.grid.major = element_blank(),  
  panel.grid.minor = element_blank(), 
  panel.border = element_blank()
)

stunting_plot <- ggplot(data = malnutrition_by_income) +
  geom_col(mapping = aes(x = "", y = stunting_number_millions_avg, fill = income)) +
  coord_polar("y") + scale_fill_brewer() + blank_theme + 
  labs(title = "How Different Income Affects Stunting") 
stunting_plot


overweight_plot <- ggplot(data = malnutrition_by_income) +
  geom_col(mapping = aes(x = "", y = overweight_number_millions_avg, fill = income)) +
  coord_polar("y") + scale_fill_brewer() + blank_theme + 
  labs(title = "How Different Income Affects Overweight") 
overweight_plot

wasting_plot <- ggplot(data = malnutrition_by_income) +
  geom_col(mapping = aes(x = "", y = wasting_number_millions_avg, fill = income)) +
  coord_polar("y") + scale_fill_brewer() + blank_theme + 
  labs(title = "How Different Income Affects Wasting") 
wasting_plot

# These visualizations were designed to answer one of our research questions, 
# how does household income affect child malnutrition? Three pie charts are presented, 
# each corresponding to one specific malnutrition type: overweighting, stunting, 
# and wasting. These pie charts show the number of malnutrition kids by different income types. 
# For overweighting and stunting, the number displayed was the average count 
# of malnutrition kids from 2011 to 2020. For wasting, we are showing the malnutrition data for 2020 
# since we only have the dataset for that year. One significant insight is that 
# low-middle income always has the largest number across all types of malnutrition. 
# High income has the lowest number in both stunting and wasting, 
# whereas low income has the highest number in overweighting malnutrition.



