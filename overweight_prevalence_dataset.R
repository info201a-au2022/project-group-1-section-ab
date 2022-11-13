overweight_prevalence <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-1-section-ab/main/data/Overweight-Prevalence.csv")
view(overweight_prevalence)

overweight_prevalence1 <- overweight_prevalence %>%
  slice(13:15, 17, 89:102) %>%
  select(X, X.12, X.17, X.22, X.27, X.32, X.37, X.42, X.47, X.52, X.57, X.62) %>%
  rename("2010 (overweight prevalence)" = X.12, 
  "2011 (overweight prevalence)" = X.17, 
  "2012 (overweight prevalence)" = X.22,
  "2013 (overweight prevalence)" = X.27, 
  "2014 (overweight prevalence)" = X.32, 
  "2015 (overweight prevalence)" = X.37,   
  "2016 (overweight prevalence)" = X.42, 
  "2017 (overweight prevalence)" = X.47,
  "2018 (overweight prevalence)" = X.52,
  "2019 (overweight prevalence)" = X.57,
  "2020 (overweight prevalence)" = X.62) %>% 
  slice(4:18)

  write.csv(overweight_prevalence1, "/Users/ericazhang/Documents/info201/project-group-1-section-ab/overweight_prevalence.csv", row.names = FALSE)