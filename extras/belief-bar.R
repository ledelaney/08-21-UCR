library(tidyverse)
library(ggplot2)

theme_niwot <- function(){
  theme_bw() +
    theme(
      axis.text = element_text(size = 16), 
      axis.title = element_text(size = 18),
      axis.line.x = element_line(color="black"), 
      axis.line.y = element_line(color="black"),
      panel.border = element_blank(),
      panel.grid.major.x = element_blank(),                                          
      panel.grid.minor.x = element_blank(),
      panel.grid.minor.y = element_blank(),
      panel.grid.major.y = element_blank(),  
      plot.margin = unit(c(1, 1, 1, 1), units = , "cm"),
      plot.title = element_text(size = 18, vjust = 1, hjust = 0),
      legend.text = element_text(size = 12),          
      legend.title = element_blank(),                              
      legend.position = c(0.95, 0.15), 
      legend.key = element_blank(),
      legend.background = element_rect(color = "black", 
                                       fill = "transparent", 
                                       size = 2, linetype = "blank"))
}


x <- c(0.89, 0.25, 0.10)
y <- c("general public", "biologists", "evolutionary biologists")

dat <- bind_cols(x, y) %>%
  setNames(., c("proportion", "population")) %>%
  mutate(population = factor(population, levels = c("general public", "biologists", "evolutionary biologists")))



pdf(file = "10-belief.pdf",
    bg = "transparent",
    width = 11,
    height = 9)

ggplot(dat) +
  geom_col(aes(x=population, y = proportion, fill = population), width=0.5) +
  theme_niwot() +
  theme(axis.line.x = element_blank(), axis.ticks.x = element_blank(), legend.position = "none", 
        axis.title.x = element_blank(), axis.title.y = element_blank())

dev.off()


