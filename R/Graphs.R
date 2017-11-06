rm(list =ls())
library(dplyr)
library(tidyverse) # inclus ggplot2
library(readr)
library(ggplot2)

#Besoin de TIDY DATA, not messy ones
#ggplot2 combines layers
# cheat sheet

#ggplot(data = data, aesthetic)+
#geom_XXX(additionnal parameters)
#geom_point(additionnal parameters)

#ggplot(mpg = mpg, aes(x=displ, yhwy))+
#geom_point()

# Histogramme - data continuous
# Bar plot - data discontinue

data(mpg)
mpg

#First create the mapping HISTOGRAMM
p<-ggplot(data=mpg, mapping=aes(x=cty))
#Then add one histogram layer (geom) with ni parameter
p + geom_histogram()
p + geom_histogram(binwidth = 5)

p<-ggplot(data=mpg, mapping=aes(x=displ))
#Then add one histogram layer (geom) with ni parameter
p + geom_histogram(fill="red", color="blue")

#First create the mapping BAR PLOT
  ggplot(data=mpg, aes(x= reorder(class))) +
    geom_bar()
  
  #First create the mapping
  p<- ggplot(mpg, aes(x=displ, y=hwy))
  #Then tell ggplot we want lines forthe relation between x and y
  p+geom_line()
  p+geom_point()
  
  p<- ggplot(mpg, aes(x=displ, y=hwy))
  +geom_line()
  +geom_point()
  p # afficher graph
  
  
  p <- ggplot(mpg, aes(x=hwy, y=cty))+
      geom_point(color="blue", size=4)
  p
  
  #BOXPLOT
  #Need discrete/categorical variable in "x" & continuous variable in "y"
  
  ggplot (data=mpg, mapping=aes(x=class, y=cty))+
    geom_boxplot() #boxplot geom with no parameter
  
  ggplot (data=mpg, mapping=aes(x=cyl, y=hwy))+
    geom_boxplot() #boxplot geom with no parameter
  # cyl est une valeur continue... PROBLEM
  #solution convertir cyl en facteur
  ggplot (data=mpg, mapping=aes(x=factor(cyl), y=hwy)) +
    geom_boxplot() + #boxplot geom with no parameter
  theme_bw() # enleve le fond graph
  
  
  
  
  
  
  
  
  
  
