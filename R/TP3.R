rm(list =ls())
library(dplyr)
library(tidyverse) # inclus ggplot2
library(readr)
library(ggplot2)

#Question 1

ctd <- read_csv("data/ctd_ic_2016.csv") %>%
  filter(depth <=5) %>%
  group_by(date) %>%
  summarise(mean_water_temperature = mean(water_temperature, na.rm =TRUE))

ctd <- drop_na(ctd, date, mean_water_temperature)

ctd %>%
  ggplot(aes(x=date, y=mean_water_temperature)) +
  geom_line()
  
#Question 2
#Filtrer et faire un "join"
library("nycflights13")
data(flights)
data(planes)
data(airports)
data(airlines)

View(flights)

res <- flights %>%
  left_join(airlines, by = "carrier") %>%
  filter(
    name %in% c(
      "United Air Lines Inc.",
      "American Ailinres Inc.",
      "JetBlue Airways",
      "Delta Air Lines Inc.",
      "ExpressJet Airlines Inc."
    )
  )
     
res %>%
  ggplot(aes(x = name, y = dep_delay)) +
  geom_boxplot()

#Question 3 Messy data inversion colonne/ligne pour variables et valeurs
df <- read_csv("data/API_CAN_DS2_en_csv_V2.csv", skip = 4) %>%
  select(-X62) %>%
  filter(`Indicator Code` == "EG.ELC.COAL.ZS") %>% #Présence d'espace, utiliser back tick
  gather(year, percent, -(1:4)) %>% #gather (df pas besoin de l'indiquer a cause du pipe %>%, new name column, name column qui contiendra valeur, ne touche pas à ces colonnes)
  mutate(year = parse_number(year))

df %>%
  ggplot(aes(x=year, y=percent))+
  geom_line()+
  geom_point()
