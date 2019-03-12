# load packages ----
library(tidyverse)
library(bib2df)

# find bib files ----
bib_files <- list.files(path = "data/bib", full.names = TRUE)

# Use bib2df ----
bib <- dplyr::bind_rows(
  lapply(bib_files, bib2df)
)

bib2 <- bib[, 1:29]

# process bib file ----
bib2 <- bib2 %>% 
  mutate(journal = case_when(
    JOURNAL %in% c('American Economic Journal-Applied Economics') ~ "aej_ae",
    JOURNAL %in% c('American Educational Research Journal') ~ "AERJ",
    JOURNAL %in% c('American Journal of Political Science') ~ "am_j_pol_sci",
    JOURNAL %in% c('Educational Evaluation and Policy Analysis') ~ "EEPA",
    JOURNAL %in% c('Economic Journal', 'The Economic Journal', 'Econ J (London)') ~ 'ej',
    JOURNAL %in% c('Educational Researcher') ~ 'er',
    JOURNAL %in% c('Higher Education') ~ 'he',
    JOURNAL %in% c('Journal of Experimental Education', 'The Journal of Experimental Education') ~ 'JEE',
    JOURNAL %in% c('Political Science Quarterly') ~ 'pol_sci_quar',
    JOURNAL %in% c('Public Policy and Administration') ~ 'pub_policy_admin',
    JOURNAL %in% c('Journal of Public Policy') ~ 'public_policy',
    JOURNAL %in% c('Sociology of Education') ~ 'SE'
  ),
  pdf = grepl('internal-pdf', bib$NOTE)
  )

jour_art <- data.frame(
  journal = c('aej_ae', 'AERJ', 'am_j_pol_sci', 'EEPA',
              'ej', 'er', 'he', 'JEE', 'pol_sci_quar',
              'pub_policy_admin', 'public_policy',
              'SE'),
  num_pdfs = c(363, 444, 922, 188, 
               1829, 742, 1914, 517, 2722,
               83, 27, 261),
  total_articles = c(364, 444, 1436, 405,
                     3376, 794, 1914, 525, 3589,
                     83, 180, 453),
  journal2 = c('AEJ', 'AERJ', 'AJPS', 'EEPA',
               'EJ', 'ER', 'HE',
               'JEE', 'PSQ', 
               'PPA', 'JPP', 
               'SE')
) %>% 
  mutate(perc_pdf = round((num_pdfs / total_articles)*100, 1))

num_year <- bib2 %>%
  group_by(journal, YEAR, pdf) %>%
  summarise(num = n()) %>%
  mutate(num_year = sum(num),
         prop_year = num / num_year,
         pdf = ifelse(pdf, 'yes', 'no')) %>%
  na.omit() %>%
  left_join(jour_art)


