#Nettoyer/vider Global environement  au lieu coup de balai
rm (list = ls())


x <-10

while (x>=2) {
  
  print (x) # print the value x
  
x <- x-2 # Decrease the value of x by 2
}

##############
y <- 12334
cpt <- 0

while (y >= 0.001) {  # Condition, roule la boulce thant que y est égal ou supérieur à 0.001
  
  print (y) # Pas obligatoire
  
  y <- y/3 # Divisie la valeur e y par 3
  
  cpt <- cpt + 1
}

print (cpt)
##############
install.packages("vegan")
library("vegan")
update.packages(ask=FALSE)


# HELP #
?rm
browseVignettes()  # List available vignettes () functions
help(rm)

# Write a good script
#GOOD
day_one
day_1
#BAD
first_day_of_the_month
DayOne
dayone
djm1

#Spacing, make the srcipt easy to read through: Ctl+Shift+A
average <- mean(feet / 12 + inches, 
                na.rm=TRUE, 
                y=5)

#File names
#Good
fit_models.R
utility_functions.R

#Bad
stuff.R

# READ FILES

install.packages("readr")
library(readr)
mydata <- read_csv ("/path/to/myfile.csv") 

install.packages("readxl")
library(readxl)
mydata <- read_excel ("/path/to/myfile.xls", sheet=3) # if no indication, it reads the first sheet

#Exercice
mpg <- read_csv ("/Users/jferland/Documents/Lab_Bioreacteur/CoursR/Cours_Phil_Massicotte/Data/mpg.csv") 

#mpg <- read_csv ("Data/mpg.csv") 

head (mpg) # see the first 6 rows
str(mpg)
names(mpg) # nom des colonnes
nrow(mpg)
ncol(mpg)

mpg [1, 3]  # [ligne, colonne]
mpg [ ,4] # visualise la 4e colonne et toutes ses lignes
mpg$manufacturer # return the values of the vector named "manufaturer"
mpg$cyl[1:10] # return first 10 value of the vector







