library("stringr")
library("dplyr")
library("tidyr")

stunting_number <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-1-section-ab/main/data/stunting_number.csv")
stunting_number <- stunting_number[c(14, 17, 90:95, 98:102), c(1, 13, 18, 23, 28, 33, 38, 43, 48, 53, 58, 63)]
colnames(stunting_number) <- stunting_number[1, ]
colnames(stunting_number)[1] <- "region"
colnames(stunting_number)[12] <- "2020"
stunting_number <- stunting_number[-1, ]
stunting_number <- stunting_number %>%
  gather(key = year, value = stunting_number_millions, -region)

stunting_prevalence <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-1-section-ab/main/data/stunting_prevalence.csv")
stunting_prevalence <- stunting_prevalence[c(14, 17, 90:95, 98:102), c(1, 13, 18, 23, 28, 33, 38, 43, 48, 53, 58, 63)]
colnames(stunting_prevalence) <- stunting_prevalence[1, ]
colnames(stunting_prevalence)[1] <- "region"
colnames(stunting_prevalence)[12] <- "2020"
stunting_prevalence <- stunting_prevalence[-1, ]
stunting_prevalence <- stunting_prevalence %>%
  gather(key = year, value = stunting_prevalence_percentage, -region)

stunting_data <- left_join(stunting_number, stunting_prevalence)

overweight_number <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-1-section-ab/main/data/overweight_number.csv")
overweight_number <- overweight_number[c(14, 17, 90:95, 98:102), c(1, 13, 18, 23, 28, 33, 38, 43, 48, 53, 58, 63)]
colnames(overweight_number) <- overweight_number[1, ]
colnames(overweight_number)[1] <- "region"
colnames(overweight_number)[12] <- "2020"
overweight_number <- overweight_number[-1, ]
overweight_number <- overweight_number %>%
  gather(key = year, value = overweight_number_millions, -region)

overweight_prevalence <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-1-section-ab/main/data/overweight_prevalence.csv")
overweight_prevalence <- overweight_prevalence[c(14, 17, 90:95, 98:102), c(1, 13, 18, 23, 28, 33, 38, 43, 48, 53, 58, 63)]
colnames(overweight_prevalence) <- overweight_prevalence[1, ]
colnames(overweight_prevalence)[1] <- "region"
colnames(overweight_prevalence)[12] <- "2020"
overweight_prevalence <- overweight_prevalence[-1, ]
overweight_prevalence <- overweight_prevalence %>%
  gather(key = year, value = overweight_prevalence_percentage, -region)

overweight_data <- left_join(overweight_number, overweight_prevalence)

wasting_data <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-1-section-ab/main/data/wasting_number_prevalence.csv")
wasting_data <- wasting_data[c(14, 17, 90:95, 98:102), c(1, 3, 13)]
colnames(wasting_data) <- wasting_data[1, ]
colnames(wasting_data)[1] <- "region"
colnames(wasting_data)[2] <- "wasting_prevalence_percentage"
colnames(wasting_data)[3] <- "wasting_number_millions"
wasting_data <- wasting_data[-1, ]
wasting_data[wasting_data == "-"] <- NA
wasting_data <- wasting_data %>%
  mutate(year = "2020") %>%
  select(c(1, 4, 3, 2))

malnutrition_data <- left_join(stunting_data, overweight_data) %>%
  left_join(wasting_data)
malnutrition_data[, 2:8] <- round(as.numeric(unlist(malnutrition_data[, 2:8])), 2)
malnutrition_data <- group_by(malnutrition_data, region)
