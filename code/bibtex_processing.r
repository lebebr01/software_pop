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
