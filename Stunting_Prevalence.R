library("dplyr")
library("tidyverse")

data <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-1-section-ab/main/data/Stunting-Prevalence.csv")
filtered_data <-slice(data,17,89:103)
filtered_data <- rename(filtered_data, "2010 Stunting Prevalence (%)"= X.12,
                                       "2011 Stunting Prevalence (%)" = X.17,
                        "2012 Stunting Prevalence (%)" = X.22,
                        "2013 Stunting Prevalence (%)" = X.27,
                        "2014 Stunting Prevalence (%)" = X.32,
                        "2015 Stunting Prevalence (%)" = X.37,
                        "2016 Stunting Prevalence (%)" = X.42,
                        "2017 Stunting Prevalence (%)" = X.47,
                        "2018 Stunting Prevalence (%)" = X.52,
                        "2019 Stunting Prevalence (%)" = X.57,
                        "2020 Stunting Prevalence (%)" = X.62,
                        "2" = X)
filtered_data <- select(filtered_data,starts_with("2"))
filtered_data <- rename(filtered_data,"Region" = "2")

write.csv(Stunting Prevalence,"/Users/AbbydeMacBook-Pro/Documents/info201/project-group-1-section-ab/Stunting Prevalence.csv",row.names=FALSE)
