#*************************************************************#
#             Gap minder animation with plotly                #
#*************************************************************#
library(plotly)
library(tidyverse)
library(gapminder)
gapminder <-  as_tibble(gapminder)

# link: https://plotly.com/r/animations/

df <- gapminder 
fig <- df %>%
  plot_ly(
    x = ~gdpPercap, 
    y = ~lifeExp, 
    size = ~pop, 
    color = ~continent, 
    frame = ~year, 
    text = ~country, 
    hoverinfo = "text",
    type = 'scatter',
    mode = 'markers' 
  )

fig <- fig %>% layout(
  title="Gapminder lifeExpectancy vs gdpPercapital by continent [1952 - 2007]",
  xaxis = list(
    type = "log"
  )
)

fig <- fig %>% animation_opts(
  1000, easing = "elastic", redraw = FALSE
)

fig <- fig %>% animation_button(
  x = 1, xanchor = "right", y = 0, yanchor = "bottom"
)

fig <- fig %>% animation_slider(
  currentvalue = list(prefix = "YEAR ", font = list(color="red"))
)

# render the animation
print(fig)