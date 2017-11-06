df <- read_csv("Data/clean/Antalya_EM.csv")

df %>%
  ggplot(aes(x=mois, y=temperature))+
  geom_boxplot()

ggsave("graphs/boxplot_temperature.pdf")
