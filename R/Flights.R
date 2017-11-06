rm (list = ls())

#Exercice
library("dplyr")
library("nycflights13")

data(flights)
data(planes)
data(airports)
data(airlines)

str(flights)
str(planes)
str(airports)
str(airlines)

#Filter data

df1 <- filter(flights, tailnum =="N14228")
class(df1)
df2 <- filter(flights, dep_delay  >= 180 )
filter(flights, carrier == "MQ" |carrier == "EV")
# filter(flights, carrier %in% c("MQ", "EV")


arrange(flights, dep_delay, arr_delay, desc(arr_delay)) # Using desc() pour ordre décroissant

select(airports, faa, name)

select(airports, -faa, -name) # All Except faa and name

# ADD variable to a dataframe
mutate(flights, distance_km = distance / 0.62137)
transmute (flights, distance_km = distance / 0.62137) # affiche seulement les nouvelles colonnes créées
transmute (flights, distance_km = distance / 0.62137, distance_knot=distance/1.15078) # affiche seulement les nouvelles colonnes créées

summarise(flights,
          average_departure_delay = mean(dep_delay, na.rm=TRUE),
          average_arrival_delay = mean(arr_delay, na.rm=TRUE))

# IDealement grouper les données avant summarise
grouped <- group_by(flights, carrier)

summarise(grouped,
          average_departure_delay = mean(dep_delay, na.rm=TRUE),
          average_arrival_delay = mean(arr_delay, na.rm=TRUE))

summarise(grouped,
          average_departure_delay = mean(dep_delay, na.rm=TRUE),
          average_arrival_delay = mean(arr_delay, na.rm=TRUE),
          number_of_observations =n())


