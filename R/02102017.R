rm(list =ls())
library(dplyr)
library(tidyverse)
library(readr)

ctd <-read_csv("//Users/jferland/Documents/Lab_Bioreacteur/CoursR/Cours_Phil_Massicotte/TP2/ctd_ic_2016.csv")
dept <-read_csv("//Users/jferland/Documents/Lab_Bioreacteur/CoursR/Cours_Phil_Massicotte/TP2/Departments.csv")
employee <-read_csv("//Users/jferland/Documents/Lab_Bioreacteur/CoursR/Cours_Phil_Massicotte/TP2/Employees.csv")

#QUESTION 1
#Calcul moyenne journaliere temperature des 5 premiers metres

# Filtrer tout ce qui ne servira pas, >5m
ctd <- filter(ctd, depth<=5)
#Grouper par jour
ctd <- group_by(ctd, date)
#Calculer la moyenne de temperature sur fichier déjà groupé
ctd <- summarise(ctd, temp_day = mean(water_temperature), na.rm = TRUE,
                 sd_day= sd(water_temperature), n=n())
ctd

#QUESTION 2
# Quelle est la profondeur temperature minimale et maximale par jour
ctd <-read_csv("//Users/jferland/Documents/Lab_Bioreacteur/CoursR/Cours_Phil_Massicotte/TP2/ctd_ic_2016.csv")

#Grouper par jour
ctd <- group_by(ctd, date)

# min ou max , table de logique
#filter (df, variable_name== fonction(variable_name))
ctd <- filter(
  ctd,
  water_temperature == max(water_temperature) |
    water_temperature == min(water_temperature)
)

ctd

#QUESTION 3

data <-read_csv("//Users/jferland/Documents/Lab_Bioreacteur/CoursR/Cours_Phil_Massicotte/data/T_Antalya_EM.csv")
# MESSY data
#Key: nom new column qui va prendre valeurs
#Value:
data <- gather (data, month, temperature, -tplace, -year)
#ou autre manière de conserver des colonnes qui se suivent
#data <- gather (data, month, temperature, -(tplace:year)

data <- group_by(data, year)

data <- filter(
  data,
  temperature == max(temperature))

#QUESTION 4
# En prenant en compte les données comptenues dans les fichiers Departments.csv et Employees.csv:
# 1. Trouver le nom du département où travail chaque employé. 
# 2. Lister le semployés n’étant pas associés à un département. 
# 3. Quel département n’a pas d’employés.
rm(list =ls())
dept <-read_csv("//Users/jferland/Documents/Lab_Bioreacteur/CoursR/Cours_Phil_Massicotte/TP2/Departments.csv")
employee <-read_csv("//Users/jferland/Documents/Lab_Bioreacteur/CoursR/Cours_Phil_Massicotte/TP2/Employees.csv")

 res <-left_join(employee, dept, by= c("DepartmentNo"="Department"))
res_1 <-inner_join(employee, dept, by= c("DepartmentNo"="Department"))
res_2 <-anti_join(employee, dept, by= c("DepartmentNo"="Department"))
