# Preparation jeu données temperature pour qu'il soit prêt au traitement
df <- read.csv("Data/raw/T_Antalya_EM.csv")

#Colonnes devrait être des mois

df <- gather(df,mois,temperature,-tplace,-year)

#Save the data
write_csv(df, "Data/clean/Antalya_EM.csv")

