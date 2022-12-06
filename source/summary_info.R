source("../source/aggregate_table.R")

summary_info <- list()

summary_info$num_observations <- malnutrition_data %>%
  filter(year == 2010) %>% 
  nrow()

summary_info$num_variables <- malnutrition_data %>%
  ncol()

summary_info$beginning_year <- malnutrition_data %>% 
  filter(year == min(year, na.rm = F),region == "Global") %>% 
  pull(year)

summary_info$end_year <- malnutrition_data %>% 
  filter(year == max(year, na.rm = F),region == "Global") %>% 
  pull(year)

max_num <- max(malnutrition_data$stunting_prevalence_percentage)
summary_info$max_stunting_prev_num_region <- malnutrition_data %>%
  filter(stunting_prevalence_percentage == max_num) %>% 
  select(stunting_prevalence_percentage)

max_num2 <- max(malnutrition_data$overweight_prevalence_percentage)
summary_info$max_overweight_prev_num_region <- malnutrition_data %>%
  filter(overweight_prevalence_percentage == max_num2) %>% 
  select(overweight_prevalence_percentage)

max_num3 <- max(malnutrition_data$wasting_prevalence_percentage, na.rm = T)
summary_info$max_wasting_prev_num_region <- malnutrition_data %>%
  filter(wasting_prevalence_percentage == max_num3) %>% 
  select(wasting_prevalence_percentage)
