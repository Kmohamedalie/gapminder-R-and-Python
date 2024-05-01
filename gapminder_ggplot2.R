#*************************************************************#
#           Gap minder dataset Scatter plot with ggplot2      #
#*************************************************************#

# plotting gapminder lifeExp vs gdpPercap
library(tidyverse)
library(gapminder)
library(ggplot2)
df_gapMinder <-  as_tibble(gapminder)

sp_gapMinder <- ggplot(df_gapMinder, aes(gdpPercap, lifeExp)) +
  geom_point(aes(color = continent)) +
  theme_light() +
  labs(x = "GPD per capita",
       y = "Life Expectancy",
       title = "Gapminder lifeExpectancy vs gdpPercapital by continent [1952 - 2007]") +
  scale_y_continuous()
print(sp_gapMinder)