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
                   'CRAN', 'R software', 'R core team',
                   'M-Plus', 'RStudio')
soft_ignore <- c(FALSE, FALSE, FALSE, FALSE, FALSE,
                 FALSE, FALSE, TRUE, FALSE,
                 FALSE, TRUE, FALSE, FALSE, FALSE,
                 FALSE, FALSE, FALSE, FALSE, 
                 FALSE, TRUE, TRUE, TRUE, TRUE,
                 TRUE, TRUE, TRUE, TRUE, TRUE, 
                 TRUE, FALSE, TRUE, 
                 FALSE, FALSE, TRUE, TRUE, TRUE, TRUE)

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

save(keyword_results_aerj, file = 'C:/Users/bleb/OneDrive - University of Iowa/JournalArticlesInProgress/software_pop/data/keyword_aerj_v2.rda')

# -------------------------
# EEPA

keyword_results_eepa <- keyword_directory(directory = 'C:/Users/bleb/Documents/EEPA.Data/PDF',
                                          keyword = soft_keywords, 
                                          surround_lines = FALSE,
                                          ignore_case = soft_ignore,
                                          split_pdf = TRUE,
                                          full_names = TRUE,
                                          recursive = TRUE,
                                          max_search = NULL)

keyword_results_eepa$journal <- 'EEPA'

save(keyword_results_eepa, file = 'C:/Users/bleb/OneDrive - University of Iowa/JournalArticlesInProgress/software_pop/data/keyword_eepa_v2.rda')


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

save(keyword_results_jee, file = 'C:/Users/bleb/OneDrive - University of Iowa/JournalArticlesInProgress/software_pop/data/keyword_jee_v2.rda')

# -------------------------
# am_j_pol_sci

keyword_results_am_j_pol_sci <- keyword_directory(directory = 'C:/Users/bleb/Documents/am_j_pol_sci.Data/PDF',
                                         keyword = soft_keywords, 
                                         split_pdf = TRUE,
                                         surround_lines = FALSE,
                                         ignore_case = soft_ignore,
                                         full_names = TRUE,
                                         recursive = TRUE,
                                         max_search = NULL)

keyword_results_am_j_pol_sci$journal <- 'am_j_pol_sci'

save(keyword_results_am_j_pol_sci, file = 'C:/Users/bleb/OneDrive - University of Iowa/JournalArticlesInProgress/software_pop/data/keyword_am_j_pol_sci_v2.rda')

# -------------------------
# economic journal

keyword_results_ej <- keyword_directory(directory = 'C:/Users/bleb/Documents/ej.Data/PDF',
                                         keyword = soft_keywords, 
                                         surround_lines = FALSE,
                                         ignore_case = soft_ignore,
                                         full_names = TRUE,
                                         recursive = TRUE,
                                         max_search = NULL)

keyword_results_ej$journal <- 'ej'

save(keyword_results_ej, file = 'C:/Users/bleb/OneDrive - University of Iowa/JournalArticlesInProgress/software_pop/data/keyword_ej_v2.rda')

# -------------------------
# educational researcher

keyword_results_er <- keyword_directory(directory = 'C:/Users/bleb/Documents/ER.Data/PDF',
                                         keyword = soft_keywords, 
                                         split_pdf = TRUE,
                                         surround_lines = FALSE,
                                         ignore_case = soft_ignore,
                                         full_names = TRUE,
                                         recursive = TRUE,
                                         max_search = NULL)

keyword_results_er$journal <- 'er'

save(keyword_results_er, file = 'C:/Users/bleb/OneDrive - University of Iowa/JournalArticlesInProgress/software_pop/data/keyword_er_v2.rda')

# -------------------------
# HE

keyword_results_he <- keyword_directory(directory = 'C:/Users/bleb/Documents/HE.Data/PDF',
                                         keyword = soft_keywords, 
                                         surround_lines = FALSE,
                                         ignore_case = soft_ignore,
                                         full_names = TRUE,
                                         recursive = TRUE,
                                         max_search = NULL)

keyword_results_he$journal <- 'he'

save(keyword_results_he, file = 'C:/Users/bleb/OneDrive - University of Iowa/JournalArticlesInProgress/software_pop/data/keyword_he_v2.rda')

# -------------------------
# pol_sci_quar

keyword_results_pol_sci_quar <- keyword_directory(directory = 'C:/Users/bleb/Documents/pol_sci_quar.Data/PDF',
                                         keyword = soft_keywords, 
                                         surround_lines = FALSE,
                                         ignore_case = soft_ignore,
                                         full_names = TRUE,
                                         recursive = TRUE,
                                         max_search = NULL)

keyword_results_pol_sci_quar$journal <- 'pol_sci_quar'

save(keyword_results_pol_sci_quar, file = 'C:/Users/bleb/OneDrive - University of Iowa/JournalArticlesInProgress/software_pop/data/keyword_pol_sci_quar_v2.rda')

# -------------------------
# pub_policy_admin

keyword_results_pub_policy_admin <- keyword_directory(directory = 'C:/Users/bleb/Documents/pub_policy_admin.Data/PDF',
                                         keyword = soft_keywords, 
                                         surround_lines = FALSE,
                                         ignore_case = soft_ignore,
                                         full_names = TRUE,
                                         recursive = TRUE,
                                         max_search = NULL)

keyword_results_pub_policy_admin$journal <- 'pub_policy_admin'

save(keyword_results_pub_policy_admin, file = 'C:/Users/bleb/OneDrive - University of Iowa/JournalArticlesInProgress/software_pop/data/keyword_pub_policy_admin_v2.rda')

# -------------------------
# SE

keyword_results_SE <- keyword_directory(directory = 'C:/Users/bleb/Documents/SE.Data/PDF',
                                         keyword = soft_keywords, 
                                        split_pdf = TRUE,
                                         surround_lines = FALSE,
                                         ignore_case = soft_ignore,
                                         full_names = TRUE,
                                         recursive = TRUE,
                                         max_search = NULL)

keyword_results_SE$journal <- 'SE'

save(keyword_results_SE, file = 'C:/Users/bleb/OneDrive - University of Iowa/JournalArticlesInProgress/software_pop/data/keyword_SE_v2.rda')


# -------------------------
# public_policy

keyword_results_public_policy <- keyword_directory(directory = 'C:/Users/bleb/Documents/public_policy.Data/PDF',
                                         keyword = soft_keywords, 
                                         surround_lines = FALSE,
                                         ignore_case = soft_ignore,
                                         full_names = TRUE,
                                         recursive = TRUE,
                                         max_search = NULL)

keyword_results_public_policy$journal <- 'public_policy'

save(keyword_results_public_policy, file = 'C:/Users/bleb/OneDrive - University of Iowa/JournalArticlesInProgress/software_pop/data/keyword_public_policy_v2.rda')


# -------------------------
# American Economic Journal

keyword_results_aej_ae <- keyword_directory(directory = 'C:/Users/bleb/Documents/aej_ae.Data/PDF',
                                            keyword = soft_keywords, 
                                            surround_lines = FALSE,
                                            ignore_case = soft_ignore,
                                            full_names = TRUE,
                                            recursive = TRUE,
                                            max_search = NULL)

keyword_results_aej_ae$journal <- 'aej_ae'

save(keyword_results_aej_ae, file = 'C:/Users/bleb/OneDrive - University of Iowa/JournalArticlesInProgress/software_pop/data/keyword_aej_ae_v2.rda')
