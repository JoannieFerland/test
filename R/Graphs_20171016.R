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
  theme_bw() # modifie le thème du fond graph
  
  ggplot(mpg, aes(x=displ, y=hwy))+
    geom_point(aes(color=class))
  
  ggplot(mpg, aes(x=displ, y=hwy))+
    geom_point(aes(size=factor(cyl)))
  
  ggplot(mpg, aes(x=class, y=cty))+
    geom_boxplot(aes(fill=class))+
    theme_bw()
  
  
  #Faceting
  data(mpg)
  mpg
  
  ggplot(mpg, aes(x=displ, y=cty)) + #mapping
    geom_point()+ #we want scatterplot
    facet_wrap(~class) #we want 1 panel for each class
    facet_wrap(~class, scales = "free")#we want 1 panel for each class and each panel with its own scale
     facet_wrap(~class, scales = "free_x")
     
     ggplot(mpg, aes(x=displ, y=hwy)) +
       geom_point() +
       facet_grid(cyl~class) #number of cyl in function of clasx
  
  #Smoothing
    #Add trend lines
  
     ggplot(mpg, aes(x=displ, y=hwy)) +
       geom_point() +
      # geom_smooth() #par defaut loess or gam model en fonction numbre data
       #geom_smooth(method="lm") #modele lineraire
       geom_smooth(method="lm", se=FALSE ) #supprime standard error (se)
  
  #Themes
     #par defaut fond gris, peut être modifié
     
     ggplot(mpg, aes(x=displ, y=hwy)) +
       geom_point() +
       theme_classic()
     
     #Changing axe titles
     
     ggplot(mpg, aes(x=displ, y=hwy)) +
       geom_point() +
       xlab("Displacement (liters)")+
       ylab("Miles per gallon")
     
     #Legend
     
     ggplot(mpg, aes(x = displ, y = hwy, color = factor(cyl))) +
       geom_point() +
       theme(legend.position = c(0.5,0.5))
      
     #Changing default colors
     ggplot(mpg, aes(x = displ, y = hwy, color = factor(cyl))) +
       geom_point() +
       scale_color_manual(breaks = c(4,5,6,8),
                          values = c("red", "blue", "black", "green"))
     
     #Graphic appearance
     #Voir exemple dans note de cours R du 16 octobre 2017
     
     
     #Saving your graphic
     p <- ggplot(mpg, aes(x=displ, y=cty))+
       geom_point()
     
     #vector formats
     ggsave("path/to/myfile.pdf", p, width = 5.97, height =4.79)
     ggsave("path/to/myfile.eps", p, width = 5.97, height =4.79)
     ggsave("path/to/myfile.", p, width = 5.97, height =4.79)
     
     #Exercice Messy data & graph
     antalya <- read_csv("data/T_Antalya_EM.csv")
     agrinio <- read_csv("data/T_Agrinio_EM.csv")
     
     #HINT #1: bind_rows() to bind 
     
     df <- bind_rows(agrinio, antalya) %>% 
       gather(month, temperature, -tplace, -year) %>%
       mutate(month = parse_number(month)) %>%
       mutate(month2=month.name[month]) %>% #changerle numerode mois pour le nom du mois en utilisant l'indice de la variable actuelle month et le vecteur month.names de 12 unités
       mutate(month2=reorder(as.factor(month2), month)) # convertir month de chaine de caractere a un facteur numérique et reorganise en fonction du month (chiffre)
       
       
    ggplot(df, aes(x = year , y = temperature, color=tplace)) + #color = tplace pas besoij de factor car deja un facteur
      geom_line() +
      facet_wrap(~month2) +
      theme_bw() +
      xlab("Years") +
      labs(colors = "Place") +
      ggtitle("Average temperture between 1961 and 2016") +
      geom_vline(aes(xintercept=2017), lty = 2) 
      
    
      
  