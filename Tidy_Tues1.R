##############################
## Tidy Tuesday #1
##
## Matt Brachmann (PhDMattyB)
##
## 2019-02-14
##
##############################

library(tidyverse)
library(wesanderson)
library(patchwork)
library(janitor)

theme_set(theme_bw())

# Other packages to load

fed_rd = read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-02-12/fed_r_d_spending.csv")
energy_spend = read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-02-12/energy_spending.csv")
climate_spend = read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-02-12/climate_spending.csv")

unique(energy_spend$department)

E4energy = energy_spend %>%
  as_tibble() %>% 
  arrange(department) %>% 
  rename(Department = department)
str(E4energy)


ggplot(data = E4energy, aes(x = year, y = energy_spending))+
  geom_point(aes(col = Department))+
  geom_smooth(aes(col = Department), se = FALSE)+
  labs(x = 'Year', y = 'Federal spending')
  
