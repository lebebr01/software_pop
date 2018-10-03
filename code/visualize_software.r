# load in journal keyword data

# Names are: keyword_results_* where * is journal abbreviation

load('data/keyword_aej_ae_v2.rda')
load('data/keyword_aerj_v2.rda')
load('data/keyword_am_j_pol_sci_v2.rda')
load('data/keyword_eepa_v2.rda')
load('data/keyword_ej_v2.rda')
load('data/keyword_er_v2.rda')
load('data/keyword_he_v2.rda')
load('data/keyword_jee_v2.rda')
load('data/keyword_pol_sci_quar_v2.rda')
load('data/keyword_pub_policy_admin_v2.rda')
load('data/keyword_public_policy_v2.rda')
load('data/keyword_SE_v2.rda')
# combine
library(dplyr)

software_keywords <- bind_rows(
  keyword_results_aej_ae,
  keyword_results_aerj, 
  keyword_results_am_j_pol_sci,
  keyword_results_eepa, 
  keyword_results_ej,
  keyword_results_er,
  keyword_results_he,
  keyword_results_jee,
  keyword_results_pol_sci_quar,
  keyword_results_pub_policy_admin,
  keyword_results_public_policy,
  keyword_results_SE
) %>%
  mutate(group = 'software')

# Model Keywords ----
load('data/keyword_aej_ae_model_v2.rda')
load('data/keyword_aerj_model_v2.rda')
load('data/keyword_am_j_pol_sci_model_v2.rda')
load('data/keyword_eepa_model_v2.rda')
load('data/keyword_ej_model_v2.rda')
load('data/keyword_er_model_v2.rda')
load('data/keyword_he_model_v2.rda')
load('data/keyword_jee_model_v2.rda')
load('data/keyword_pol_sci_quar_model_v2.rda')
load('data/keyword_pub_policy_admin_model_v2.rda')
load('data/keyword_public_policy_model_v2.rda')
load('data/keyword_SE_model_v2.rda')

# combine
model_keywords <- bind_rows(
  keyword_results_aej_ae,
  keyword_results_aerj, 
  keyword_results_am_j_pol_sci,
  keyword_results_eepa, 
  keyword_results_ej,
  keyword_results_er,
  keyword_results_he,
  keyword_results_jee,
  keyword_results_pol_sci_quar,
  keyword_results_pub_policy_admin,
  keyword_results_public_policy,
  keyword_results_SE
) %>%
  mutate(group = 'model')

# bind rows together ----
keywords <- bind_rows(software_keywords, model_keywords) %>%
  select(journal, everything()) %>%
  arrange(journal, pdf_name)

# extract year from pdf_name
mat <- regexpr("-[0-9]{4}-", keywords$pdf_name)

keywords <- keywords %>%
  mutate(year2 = regmatches(keywords$pdf_name, mat), 
         year = gsub("-", "", year2))

# number of articles gathered by journal -----
jour_art <- data.frame(
  journal = c('aej_ae', 'AERJ', 'am_j_pol_sci', 'EEPA',
              'ej', 'er', 'he', 'JEE', 'pol_sci_quar',
              'pub_policy_admin', 'public_policy',
              'SE'),
  num_pdfs = c(334, 444, 922, 188, 
               1829, 742, 1914, 517, 2722,
               83, 27, 261),
  total_articles = c(364, 444, 1436, 405,
                     3376, 794, 1914, 525, 3589,
                     83, 180, 453),
  journal2 = c('Am. Econ', 'AERJ', 'Am. J. Pol Sci', 'EEPA',
               'Econ. J.', 'Educ. Researcher', 'Higher Educ.',
               'J. Exp. Educ.', 'Pol. Sci. Quar', 
               'Pub. Policy Admin', 'J. Pub. Policy', 
               'Soc. of Educ.')
) %>% 
  mutate(perc_pdf = num_pdfs / total_articles)

library(ggplot2)
library(forcats)
ggplot(jour_art, aes(x = fct_reorder(journal2, perc_pdf), 
                     y = I(perc_pdf*100))) + 
  geom_bar(stat = 'identity') + 
  geom_text(aes(label = num_pdfs), size = 7, 
            hjust = 2, color = 'white') + 
  theme_bw(base_size = 18) + 
  coord_flip() + 
  xlab("Journals") + 
  ylab("Percent of PDFs found")
  

# merge back into data
keywords <- keywords %>%
  left_join(jour_art, by =)

# Remove ' R ' keyword ----
keywords_nor <- keywords %>%
  filter(keyword != ' R ', keyword != '[:alpha:] package',
         keyword != 'Julia', keyword != 'eta-analysis')
  
# Descriptive statistics ----
# number of artcles with software/model mentioned
num_articles <- keywords_nor %>%
  group_by(group, journal) %>%
  summarise(num_ids = length(unique(ID))) %>%
  left_join(jour_art, by = 'journal') %>%
  mutate(percent_keyword = num_ids / num_pdfs)

ggplot(num_articles, aes(x = fct_reorder(journal2, percent_keyword), 
                         y = I(percent_keyword * 100))) + 
  geom_bar(stat = 'identity') + 
  theme_bw(base_size = 18) + 
  coord_flip() + 
  xlab("Journals") + 
  ylab("Percent with a keyword match") + 
  facet_wrap(~ group)


# plot unique keyword counts by journal
count_keyword <- keywords_nor %>%
  group_by(group, journal, keyword) %>%
  summarise(num_ids = length(unique(ID))) %>%
  left_join(jour_art, by = 'journal') %>%
  mutate(percent_keyword = num_ids / num_pdfs)
# 
# library(ggplot2)
# ggplot(count_keyword, aes(x = keyword, y = n)) + 
#   geom_bar(stat = 'identity') +
#   theme_bw() + 
#   coord_flip() + 
#   ylab("Count") + 
#   xlab("Keyword")

# ------------------------------
# combine common keywords

library(forcats)
keywords_nor <- keywords_nor %>%
  mutate(keyword2 = fct_recode(keyword,
            "R" = "R-project" ,
            "R" = "R project",
            "R" = "CRAN",
            "R" = "R core team",
            "R" = "R software",
            "R" = "RStudio",
            "SAS" = "SAS Institute",
            "SAS" = "JMP",
            'SPSS' = "SPSS Statistics",
            'HLM' = 'HLM[0-9]',
            'HLM' = 'HLM [0-9]',
            'IRT' = 'BILOG',
            'IRT' = 'BILOG-MG',
            'IRT' = 'IRT PRO',
            'Other' = 'MATLAB',
            'Mplus' = 'M-Plus',
            'IRT' = 'Multilog',
            'IRT' = 'PARSCALE',
            'Other' = 'Scala',
            'Other' = 'Statistica ',
            'Other' = 'Systat',
            # Model recode
            'ANOVA' = 'Analysis of Covariance',
            'ANOVA' = 'Analysis of Variance',
            'ANOVA' = 'ANCOVA',
            'ANOVA' = 'repeated measures analysis of variance',
            'ANOVA' = 'MANOVA',
            'ANOVA' = 'RM-ANOVA',
            'ANOVA' = 'multivariate analysis of variance',
            'CFA' = 'confirmatory factor analysis',
            'EFA' = 'exploratory factor analysis',
            'GAM' = 'generalized additive models',
            'cluster analysis' = 'hierarchical cluster analysis',
            'Chi-Square' = 'chi-square( analysis)?',
            'Chi-Square' = 'nonparametric analysis',
            't-test' = 'dependent samples t-test',
            't-test' = 'one-sample t-test',
            't-test' = 'two-sample t-test',
            't-test' = 'two sample t-test',
            'SEM' = 'structural equation modeling',
            'SEM' = 'latent variable modeling',
            'eta-analysis' = 'meta analysis',
            'Growth' = 'growth model',
            'Growth' = 'latent growth model',
            'Linear Mixed Model' = 'HLM',
            'Linear Mixed Model' = 'Hierarchical Linear Model',
            'Linear Mixed Model' = 'LMM',
            'Linear Mixed Model' = 'Multi-level Model',
            'Linear Mixed Model' = 'Multilevel Model',
            'Linear Mixed Model' = 'general(ized)? linear mixed model',
            'Linear Model' = 'general(ized)? linear model',
            'Linear Model' = 'linear regression',
            'Linear Model' = 'Regression',
            'Linear Model' = 'multiple regression',
            'Linear Model' = 'multiple linear regression',
            'IRT' = 'item response theory',
            'propensity score' = 'propensity score analysis',
            'propensity score' = 'propensity score matching',
            'logistic regression' = 'multinomial logistic regression',
            'logistic regression' = 'multinomial regression',
            'logistic regression' = 'ordinal regression',
            'non-linear regression' = 'nonlinear regression'
                               ))

# plot unique keyword counts by journal
count_keyword <- keywords_nor %>%
  group_by(group, journal2, keyword2) %>%
  summarise(num_ids = length(unique(ID))) %>%
  left_join(jour_art, by = 'journal2') %>%
  mutate(percent_keyword = num_ids / num_pdfs)

ggplot(dplyr::filter(count_keyword, group == 'software'), 
       aes(x = fct_reorder(keyword2, percent_keyword), 
           y = I(percent_keyword*100))) + 
  geom_bar(stat = 'identity') +
  theme_bw() + 
  xlab("Keyword") + 
  ylab("Percentage") + 
  coord_flip() + 
  facet_wrap(~ journal2)

ggplot(dplyr::filter(count_keyword, group == 'model'), 
       aes(x = fct_reorder(keyword2, percent_keyword), 
           y = I(percent_keyword*100))) + 
  geom_bar(stat = 'identity') +
  theme_bw() + 
  xlab("Keyword") + 
  ylab("Percentage") + 
  coord_flip() + 
  facet_wrap(~ journal2)

# spread data to wide for tile plot
keyword_fj <- full_join(software_keywords,
                        model_keywords,
                        by = c('pdf_name', 'journal')) %>%
  left_join(jour_art) %>%
  filter(keyword.x != ' R ', keyword.x != '[:alpha:] package',
         keyword.x != 'Julia', keyword.x != 'eta-analysis') %>%
  mutate(keyword2.x = fct_recode(keyword.x,
                               "R" = "R-project" ,
                               "R" = "R project",
                               "R" = "CRAN",
                               "R" = "R core team",
                               "R" = "R software",
                               "R" = "RStudio",
                               "SAS" = "SAS Institute",
                               "SAS" = "JMP",
                               'SPSS' = "SPSS Statistics",
                               'HLM' = 'HLM[0-9]',
                               'HLM' = 'HLM [0-9]',
                               'IRT' = 'BILOG',
                               'IRT' = 'BILOG-MG',
                               'IRT' = 'IRT PRO',
                               'Other' = 'MATLAB',
                               'Mplus' = 'M-Plus',
                               'IRT' = 'Multilog',
                               'IRT' = 'PARSCALE',
                               'Other' = 'Scala',
                               'Other' = 'Statistica ',
                               'Other' = 'Systat'),
         keyword2.y = fct_recode(keyword.y,
                               # Model recode
                               'ANOVA' = 'Analysis of Covariance',
                               'ANOVA' = 'Analysis of Variance',
                               'ANOVA' = 'ANCOVA',
                               'ANOVA' = 'repeated measures analysis of variance',
                               'ANOVA' = 'MANOVA',
                               'ANOVA' = 'RM-ANOVA',
                               'ANOVA' = 'multivariate analysis of variance',
                               'CFA' = 'confirmatory factor analysis',
                               'EFA' = 'exploratory factor analysis',
                               'GAM' = 'generalized additive models',
                               'cluster analysis' = 'hierarchical cluster analysis',
                               'Chi-Square' = 'chi-square( analysis)?',
                               'Chi-Square' = 'nonparametric analysis',
                               't-test' = 'dependent samples t-test',
                               't-test' = 'one-sample t-test',
                               't-test' = 'two-sample t-test',
                               't-test' = 'two sample t-test',
                               'SEM' = 'structural equation modeling',
                               'SEM' = 'latent variable modeling',
                               'eta-analysis' = 'meta analysis',
                               'Growth' = 'growth model',
                               'Growth' = 'latent growth model',
                               'Linear Mixed Model' = 'HLM',
                               'Linear Mixed Model' = 'Hierarchical Linear Model',
                               'Linear Mixed Model' = 'LMM',
                               'Linear Mixed Model' = 'Multi-level Model',
                               'Linear Mixed Model' = 'Multilevel Model',
                               'Linear Mixed Model' = 'general(ized)? linear mixed model',
                               'Linear Model' = 'general(ized)? linear model',
                               'Linear Model' = 'linear regression',
                               'Linear Model' = 'Regression',
                               'Linear Model' = 'multiple regression',
                               'Linear Model' = 'multiple linear regression',
                               'IRT' = 'item response theory',
                               'propensity score' = 'propensity score analysis',
                               'propensity score' = 'propensity score matching',
                               'logistic regression' = 'multinomial logistic regression',
                               'logistic regression' = 'multinomial regression',
                               'logistic regression' = 'ordinal regression',
                               'non-linear regression' = 'nonlinear regression'
  ))

count_keyword <- keyword_fj %>%
  group_by(journal2, keyword2.x, keyword2.y) %>%
  summarise(num_ids = length(unique(pdf_name))) %>%
  left_join(jour_art, by = 'journal2') %>%
  mutate(percent_keyword = num_ids / num_pdfs)

# library(gganimate)
library(viridis)
ggplot(count_keyword, aes(x = keyword2.x, y = keyword2.y)) + 
  geom_raster(aes(fill = I(percent_keyword*100))) + 
  xlab("Software") +
  ylab("Models") +
  theme_bw(base_size = 16) + 
  scale_fill_viridis('Percent')
  # labs(title = 'Journal: {frame_states}', x = 'Software', 
  #      y = 'Models') +
  # transition_states(journal2,
  #                   transition_length = 2,
  #                   state_length = 1) 

# look at trends by year
# plot unique keyword counts by journal
count_keyword <- keywords_nor %>%
  group_by(group, journal2, year, keyword2) %>%
  summarise(num_ids = length(unique(ID))) %>%
  left_join(jour_art, by = 'journal2') %>%
  mutate(percent_keyword = num_ids / num_pdfs,
         year2 = as.integer(year)) %>%
  group_by(group, year2, keyword2) %>%
  summarise(percent_keyword = mean(percent_keyword))

library(gganimate)
count_model <- dplyr::filter(count_keyword, group == 'model')
ggplot(count_model, 
       aes(y = keyword2, 
           x = percent_keyword)) + 
  geom_point(size = 4) +
  theme_bw() + 
  xlab("Journal") + 
  ylab("Keyword") +
  labs(title = 'Year: {frame_time}') +
  transition_time(year2) + 
  ease_aes('linear')

count_software <- dplyr::filter(count_keyword, group == 'software')
ggplot(count_software, 
       aes(y = keyword2, 
           x = percent_keyword)) + 
  geom_point(size = 4) +
  theme_bw() + 
  xlab("Journal") + 
  ylab("Keyword") +
  labs(title = 'Year: {frame_time}') +
  transition_time(year2) + 
  ease_aes('linear')
