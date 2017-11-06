#Exercice #1
###################
# Dans le dossier Google Drive, il y a un fichier nommé starwars.csv contenant certaines statistiques sur les
# personnages des films starwars. Je vous demande:
# • Télécharger le fichier sur votre ordinateur.
# • Importer les données du fichier dans R.
# Une fois les données importées, utiliser les outils que nous avons vus en classe pour:
#   1. Calculer la mass moyenne des personnages en fonction de eye_color (donnez aussi le nombre
#                                                                         d’observations dans chaque groupe).
# 2. Pour chaque personnage, calculer le nombre de films où il/elle apparait.

library(dplyr)
rm(list =ls())
library(tidyverse)
library(readr)

sw <- read_csv ("//Users/jferland/Documents/Lab_Bioreacteur/CoursR/Cours_Phil_Massicotte/Data/starwars.csv") 
sw <- read_csv ("../Data/starwars.csv") 
sw <- read_csv("../Data/")
res <- group_by(sw, eye_color) 

#Question 1
summarise(res, 
          mean_mass=mean(mass, na.rm=TRUE)) # Fonction mean

#Question 2
name <- group_by(sw, name)
summarise(name, 
          n=n())
# autre option, évite de devoir grouper a priori
count (sw, name)


