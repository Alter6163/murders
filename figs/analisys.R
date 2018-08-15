library(tidyverse)
load("/Data_Science/projects/murders/rda/murders.rda")
murders %>% mutate(abb = reorder(abb, rate)) %>%
  ggplot(aes(abb, rate)) +
  geom_bar(width = 0.5, stat = "identity", color = "black") +
  coord_flip()
ggsave("/Data_Science/projects/murders/figs/barplot.png")