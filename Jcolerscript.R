library(tidyverse)
library(here)
library(jsonlite)
library(ggplot2)
library(dplyr)
library(igraph)
library(tm)
library(SnowballC)
library(wordcloud)
library(RColorBrewer)
library(lubridate)
library(graph)
library(Rgraphviz)
library(NLP)

library("stringi")
library(syuzhet)
library(tidyverse)
library(tidytext)

library(tidyr)
library(scales)
library(readr)
library(stringr)
library(stringi)
library(ggplot2)
library(igraph)
library(ggraph)
library(topicmodels)
library(reshape2)
library(ggthemes)
library(FactoMineR)
library(factoextra)
library(ggrepel)
library(ape)
library(tsne)
library(Rtsne)
library(fpc)
library(wordcloud2)
library(slam)
library(Rmpfr)
#library(rgl)
library(cluster)
library(ggalt)
library(widyr)


data <- read_json(here("data/J. Cole.json"), simplifyVector = TRUE)



# Selecting based on album and filtering for Born Sinner Album
born_sinner_album <- data %>% 
  filter(album == "Born Sinner") 



# Selecting based on album and filter for 2014 Forest Hills Drive
forest_hills_drive_album <- data %>% 
  filter(album == "2014 Forest Hills Drive") 



pal = brewer.pal(8, "Dark2") #add colors

practice_wordcloud1 <- Corpus(VectorSource(forest_hills_drive_album$lyrics)) #covert datatset to corpus
practice_wordcloud1

wordcloud(practice_wordcloud1, max.words = 500, random.order = FALSE, colors=pal)

##Adding cleaning conditions to wordcloud dataset
practice_wordcloud1 <- tm_map(practice_wordcloud1, removePunctuation)
practice_wordcloud2 <- tm_map(practice_wordcloud1, tolower)
practice_wordcloud3 <- tm_map(practice_wordcloud2, stripWhitespace)
practice_wordcloud4 <- tm_map(practice_wordcloud3, removeWords, c(stopwords('english'), "fuck", "nigga", "fucked", "bitches", "faggot", "uh-huh", "niggas", "fucking", "shit", "bitch", "cole", "hoes", "dick","fuckin"))

wordcloud(practice_wordcloud4, max.words=100, random.order=FALSE, colors=pal)
