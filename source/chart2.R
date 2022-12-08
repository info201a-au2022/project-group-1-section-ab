library("ggplot2")
library("tidyverse")

source("../source/aggregate_table.R")

chart_data <- malnutrition_data %>%
  filter(region == "Global") %>%
  select(year, stunting_number_millions, overweight_number_millions, wasting_number_millions)

colors <- c("Stunting" = "orange", "Overweight" = "blue")

chart <- ggplot(chart_data, aes(x = year)) +
  geom_line(aes(y = stunting_number_millions, color = "Stunting"), linewidth = 1) +
  geom_line(aes(y = overweight_number_millions, color = "Overweight"), linewidth = 1) +
  scale_x_continuous(breaks = seq(2010, 2020, 1)) +
  scale_y_continuous(breaks = seq(35, 190, 25)) +
  labs(
    x = "Year",
    y = "Number of Affected (millions)",
    title = "Number of Children Affected by Stunting and Overweight from 2010 to 2020",
    subtitle = "Data from organized Global Malnutrition data frame",
    caption = "Final Project of INFO-201 (Autumn, 2022).",
    alt = "Number of Children Affected by Stunting and Overweight from 2010 to 2020",
    color = "Legend"
  ) +
  scale_color_manual(values = colors) + theme_bw() +
  theme(rect = element_rect(fill = "transparent"))
chart

# This run chart shows number of millions of children affected by stunting and overweight globally from 2010 to 2020.
# All children suffered from those two malnutrition symptoms are aged under five.
# It is clearly reflected that many more children are affected by stunting over recent ten years.
# The number of overweight children is between 35 to 40 million and is increasing slowly.
# The number of stunting children had reached 180.5 million in year 2010,
# but the negative slope also shows a positive trend that there are fewer children are stunting.
