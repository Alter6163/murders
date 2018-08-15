library(dslabs)
library(dplyr)
library(ggplot2)
library(ggrepel) # ==> for geom_text_repel

# print all packages installed 
# library()   

# print the loaded package
search()

# load data
data(murders)
# head(murders)

data(polls_us_election_2016)
# head(results_us_election_2016)  # note we use results_

# combine our 2 datasets : we now have a abb column
tab <- left_join(murders, results_us_election_2016, by="state")
head(tab)

# plot geom_text_repel
tab %>% ggplot(aes(population/10^6, electoral_votes, label = abb)) +
  geom_point() +
  geom_text_repel() +
  scale_x_continuous(trans="log2") +
  scale_y_continuous(trans="log2") +
  geom_smooth(method="lm", se=FALSE) +
  theme_bw()