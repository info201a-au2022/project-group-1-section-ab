library("stringr")
library("dplyr")
library("tidyr")
library("ggplot2")

source("../source/aggregate_table.R")


first_plot <- malnutrition_data[c(122:127) ,c(1, 2, 4, 6, 8)]
region <- c(rep("African Region", 3),  
            rep("Region of the Americas", 3), 
            rep("South-East Asia Region", 3),
            rep("Eastern Mediterranean Region", 3),
            rep("Europe Region", 3),
            rep("Western Pacific Region", 3))
type <- rep(c("stunting_prevalence_perccentage", 
              "overweight_prevalence_percentage", 
              "wasting_prevalence_percentage"), 6)
percentage <- c(31.7, 4.2, 5.8, 
                30.1, 3.3, 14.5, 
                26.2, 7.7, 7.4, 
                9.3, 7.5, 2.1, 
                8.9, 8.0, 0.7, 
                5.7, 7.9, NA)
first_data <- data.frame(region, type, percentage)

plot_1 <- ggplot(first_data, aes(fill = type, x = region, y = percentage)) + 
  geom_bar(stat = "identity", position = "dodge") + labs(title = "Overweight Prevalence Over Regions") + 
  theme(axis.text.x = element_text(angle = 45, hjust=1))
plot_1


# This bar plot directly shows the how three malnutrition types distributed 
# in different WHO regions in 2020. The purpose of this plot is to demonstrate
# and compare the current prevalence of children suffering from malnutrition 
# over different regions which is one of our research questions. As shown in 
# the plot, six different regions are counted which are African Region, Region 
# of the Americas, South-East Asia Region, Eastern Mediterranean Region, Europe 
# Region, and Western Pacific Region. The three types of malnutrition are overweight, 
# stunting, and wasting. The condition in each region is totally different. Except
# western pacific region, stunting children occupies the largest percentage of all 
# malnutrition children in other regions for which the percentage of stunting children 
# reach the largest among all regions in African Region. In African Region and Region 
# of the Americas, the percengate of wasting children is the second large. 









