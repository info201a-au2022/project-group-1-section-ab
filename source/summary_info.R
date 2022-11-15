source("../source/mulnutrition_data_aggregate.R")

summary_info <- list()

summary_info$num_observations <- mulnutrition_data %>%
  filter(year == 2010) %>% 
  nrow()

summary_info$num_variables <- mulnutrition_data %>%
  ncol()

summary_info$beginning_year <- mulnutrition_data %>% 
  filter(year == min(year, na.rm = F),region == "Global") %>% 
  pull(year)

summary_info$end_year <- mulnutrition_data %>% 
  filter(year == max(year, na.rm = F),region == "Global") %>% 
  pull(year)

max_num <- max(mulnutrition_data$stunting_prevalence_percentage)
summary_info$max_stunting_prev_num_region <- mulnutrition_data %>%
  filter(stunting_prevalence_percentage == max_num) %>% 
  select(stunting_prevalence_percentage)

max_num2 <- max(mulnutrition_data$overweight_prevalence_percentage)
summary_info$max_overweight_prev_num_region <- mulnutrition_data %>%
  filter(overweight_prevalence_percentage == max_num2) %>% 
  select(overweight_prevalence_percentage)

max_num3 <- max(mulnutrition_data$wasting_prevalence_percentage, na.rm = T)
summary_info$max_wasting_prev_num_region <- mulnutrition_data %>%
  filter(wasting_prevalence_percentage == max_num3) %>% 
  select(wasting_prevalence_percentage)



