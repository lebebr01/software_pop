library(pdfsearch)

# -------------------------
# Setup

soft_keywords <- c('SPSS Statistics', ' R ', 'SAS', 'STATA', 'MATLAB', 
                   'Statistica ', 'Statsoft', 'Java', 'Hadoop',
                   'Python', 'Minitab', 'Systat', 'JMP', 'SPSS Modeler', 
                   'Tableau', 'Scala', 'Julia', 'Azure Machine', 
                   'Mplus', 'LISREL', 'AMOS', 'BILOG', 'BILOG-MG',
                   'R-project', 'R project', 'Multilog', 'PARSCALE', 'IRT PRO',
                   'HLM[0-9]', 'HLM [0-9]', 'SAS Institute', 'SPSS', 
                   '[:alpha:] package')
soft_ignore <- c(FALSE, FALSE, FALSE, FALSE, FALSE,
                 FALSE, FALSE, TRUE, FALSE,
                 FALSE, TRUE, FALSE, FALSE, FALSE,
                 FALSE, FALSE, FALSE, FALSE, 
                 FALSE, TRUE, TRUE, TRUE, TRUE,
                 TRUE, TRUE, TRUE, TRUE, TRUE, 
                 TRUE, TRUE, FALSE, TRUE, 
                 FALSE)

# -------------------------
# AERJ

keyword_results_aerj <- keyword_directory(directory = 'C:/Users/bleb/Documents/AERJ.Data/PDF',
                                          keyword = soft_keywords, 
                                          surround_lines = FALSE,
                                          ignore_case = soft_ignore,
                                          full_names = TRUE,
                                          recursive = TRUE,
                                          max_search = NULL)

keyword_results_aerj$journal <- 'AERJ'

save(keyword_results_aerj, file = 'C:/Users/bleb/OneDrive for Business/JournalArticlesInProgress/software_pop/data/keyword_aerj.rda')

# -------------------------
# EEPA

keyword_results_eepa <- keyword_directory(directory = 'C:/Users/bleb/Documents/EEPA.Data/PDF',
                                          keyword = soft_keywords, 
                                          surround_lines = FALSE,
                                          ignore_case = soft_ignore,
                                          full_names = TRUE,
                                          recursive = TRUE,
                                          max_search = NULL)

keyword_results_eepa$journal <- 'EEPA'

save(keyword_results_eepa, file = 'C:/Users/bleb/OneDrive for Business/JournalArticlesInProgress/software_pop/data/keyword_eepa.rda')


# -------------------------
# JEE

keyword_results_jee <- keyword_directory(directory = 'C:/Users/bleb/Documents/JEE.Data/PDF',
                                          keyword = soft_keywords, 
                                          surround_lines = FALSE,
                                          ignore_case = soft_ignore,
                                          full_names = TRUE,
                                          recursive = TRUE,
                                          max_search = NULL)

keyword_results_jee$journal <- 'JEE'

save(keyword_results_jee, file = 'C:/Users/bleb/OneDrive for Business/JournalArticlesInProgress/software_pop/data/keyword_jee.rda')

