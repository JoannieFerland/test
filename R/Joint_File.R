rm(list =ls())
library(dplyr)
library(tidyverse)
library(readr)


#Joindre des fichiers avec colonnes communes
# dplyr::left_join (table 1 à fusionner, table 2 à fusionner, by=colonne clé)
# dplyr::right_join()
# dplyr::inner_join() join data. Retain only rows in both et that matches, only commun data
# dplyr::full_join() join data. Retain ALL 
# dplyr::anti_join() join data. Les exclus only

# Creation of two new subsets to join from "nycflights13"
library("nycflights13")
data(flights)
data(planes)
data(airports)
data(airlines)

flights2 <-select(flights, year, month, day, hour, origin)
flights2
airports2 <- select(airports, faa, name)
airports2

left_join(flights2, airports2, by= c("origin"="faa"))
# Comme pas de colonne clé, cération d'une appellation qui dit quelles colonnes sont idem 
# c("origin"="faa")

left_join(airports2, flights2, by= c("faa"="origin")) 
# Ordre des tables "a" et "b" importe, modifier ordre d'appellation colonnes clés

right_join(flights2, airports2, by= c("origin"="faa"))
#right_join idem que faire left_join avec inversion de table "a" et "b"

inner_join(flights2, airports2, by= c("origin"="faa"))
full_join(flights2, airports2, by= c("origin"="faa"))
anti_join(airports2, flights2, by= c("faa"="origin"))

#EXERCICE
rm(list =ls())
# From which countries there is NO packages

#http://cran-logs.rstudio.com/2015/2015-11-21.csv.gz

downloads <-read_csv("//Users/jferland/Documents/Lab_Bioreacteur/CoursR/Cours_Phil_Massicotte/Data/2015-11-21.csv")
countries <-read_csv("//Users/jferland/Documents/Lab_Bioreacteur/CoursR/Cours_Phil_Massicotte/Data/countries_ISO.csv")

res <- anti_join(x=countries, 
                 y=downloads, 
                c("CODE"="country"))

# TIDY DATA
#5 problems
#(1) cloumns headers are values, not variables names
#(2) Multiple varaibles are stored in one column
#(3) Variables are stored both in column and rows
#(4) Mutiple types of obs units are stored in the same table
#(5) __

# Use Tydiverse packages
library(tidyverse)
messy <- read_csv("https://goo.gl/4rjDWu")

# Need the "gather" function
#gather(df, key, value)
#df: dataframe
#key: new column name that will contain the values of the data spread (colum name) in the old dataframe
#value: is the name of the new colum that will contain the actual values
# -var operator: ne pas toucher/modifier cette variable

#Exemple
# 2 news columns "income", "frequency" and one old "religion"
fixed <- gather(messy,income, frequency, -religion)

#Exemple
#columns name = observations

messy <- read_csv("https://goo.gl/xyxnJU")
messy <- select(messy, -new_sp)

fixed <-  gather(messy, demographic, frequency, -iso2, -year)

# multiple information in one column name
# new_sp_m04
# separate () function

fixed <- separate (data=fixed, # which data frame we separate
                   col= demographic, #which column we want to separate
                   into =c("junk", "sex", "age_group"), # The new col.names
                   sep = c(7,8)) #How do we split the demographic col?
# Idem a:
#fixed <- separate (fixed, demographic,into =c("junk", "sex", "age_group"), sep = c(7,8)) 


#Exemple
# colonne headers are values- not variable names

messy <- read_csv("http://goo.gl/eUUJ6n")
fixed <- gather (messy, day, temperature, -id, -year, -month, -element)
fixed<- na.omit(fixed) # retire valeurs manquantes du df

# convertir d1 en numéric, 1
fixed <- mutate(fixed, day=parse_number(day))

#tmin et tmax (colonne "element") devrait etre nom colonne pas variable (row)

fixed <- spread (fixed, element, temperature) # etaler les differentes lignes d'une colonne en nouvelle colonne




