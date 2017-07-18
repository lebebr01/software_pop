# load in journal keyword data

# Names are: keyword_results_* where * is journal abbreviation

load('data/keyword_aerj.rda')
load('data/keyword_eepa.rda')
load('data/keyword_jee.rda')

# combine
library(dplyr)

software_keywords <- bind_rows(
  keyword_results_aerj, 
  keyword_results_eepa, 
  keyword_results_jee
)

# extract year from pdf_name
mat <- regexpr("-[0-9]{4}-", software_keywords$pdf_name)

software_keywords <- software_keywords %>%
  mutate(year2 = regmatches(software_keywords$pdf_name, mat), 
         year = gsub("-", "", year2))

# explore number of articles with a match for each journal
# AERJ: 443 Articles
# EEPA: 188 Articles
# JEE: 208 Articles

software_keywords %>%
  select(ID, journal) %>%
  distinct(ID, journal) %>%
  group_by(journal) %>%
  count()

# plot unique keyword counts by journal
count_keyword <- software_keywords %>%
  select(ID, journal, keyword) %>%
  distinct() %>%
  group_by(journal, keyword) %>%
  count()

library(ggplot2)
ggplot(count_keyword, aes(x = keyword, y = n)) + 
  geom_bar(stat = 'identity') +
  theme_bw() + 
  coord_flip() + 
  xlab("Count") + 
  ylab("Keyword")

ggplot(count_keyword, aes(x = keyword, y = n)) + 
  geom_bar(stat = 'identity') +
  theme_bw() + 
  coord_flip() + 
  xlab("Count") + 
  ylab("Keyword") + 
  facet_wrap(~ journal)

# look at trends by year
count_year <- software_keywords %>%
  select(ID, journal, keyword, year) %>%
  distinct() %>%
  group_by(year, keyword) %>%
  count()

ggplot(count_year, aes(x = keyword, y = n)) + 
  geom_bar(stat = 'identity') +
  theme_bw() + 
  coord_flip() + 
  xlab("Count") + 
  ylab("Keyword")

ggplot(count_year, aes(x = keyword, y = n)) + 
  geom_bar(stat = 'identity') +
  theme_bw() + 
  coord_flip() + 
  xlab("Count") + 
  ylab("Keyword") + 
  facet_wrap(~ year)
