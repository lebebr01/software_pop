library(pdfsearch)

# -------------------------
# Setup

model_keywords <- c('Regression', 'HLM', 'Hierarchical Linear Model', 'Linear Mixed Model',
                    'LMM', 'Multilevel Model', 'Multi-level Model', 'Analysis of Variance',
                    'ANOVA', 'ANCOVA', 'Analysis of Covariance', 'structural equation modeling',
                    'SEM', 'growth model', 'latent growth model', 'LGM', 'item response theory', 
                    'IRT', 'confirmatory factor analysis', 'CFA', 'exploratory factor analysis',
                    'EFA', 'latent variable modeling', 'multiple regression', 'linear regression',
                    'multiple linear regression', 'nonlinear regression', 'non-linear regression',
                    'cluster analysis', 'hierarchical cluster analysis', 'logistic regression', 
                    'propensity score matching', 'propensity score analysis', 'meta analysis', 
                    'meta-analysis', 'multivariate analysis of variance', 'MANOVA', 
                    'repeated measures analysis of variance', 'RMANOVA', 'RM-ANOVA',
                    'one sample t-test', 'one-sample t-test', 'two sample t-test',
                    'two-sample t-test', 'nonparametric analysis', 'dependent samples t-test',
                    'dependent-sample t-test', 'ordinal regression', 'multinomial logistic regression',
                    'multinomial regression', 'generalized additive models', 'GAM', 'chi-square( analysis)?',
                    'general(ized)? linear model', 'general(ized)? linear mixed model')
model_ignore <- c(TRUE, FALSE, TRUE, TRUE,
                  FALSE, TRUE, TRUE, TRUE,
                  FALSE, FALSE, TRUE, TRUE,
                  FALSE, TRUE, TRUE, FALSE, TRUE,
                  FALSE, TRUE, FALSE, TRUE,
                  FALSE, TRUE, TRUE, TRUE,
                  TRUE, TRUE, TRUE,
                  TRUE, TRUE, TRUE,
                  TRUE, TRUE, TRUE,
                  TRUE, TRUE, FALSE,
                  TRUE, FALSE, FALSE,
                  TRUE, TRUE, TRUE,
                  TRUE, TRUE, TRUE,
                  TRUE, TRUE, TRUE,
                  TRUE, TRUE, FALSE, TRUE,
                  TRUE, TRUE)
length(model_keywords) == length(model_ignore)

# -------------------------
# AERJ

keyword_results_aerj <- keyword_directory(directory = 'C:/Users/bleb/Documents/AERJ.Data/PDF',
                                          keyword = model_keywords, 
                                          surround_lines = FALSE,
                                          ignore_case = model_ignore,
                                          full_names = TRUE,
                                          recursive = TRUE,
                                          max_search = NULL)

keyword_results_aerj$journal <- 'AERJ'

save(keyword_results_aerj, file = 'C:/Users/bleb/OneDrive - University of Iowa/JournalArticlesInProgress/software_pop/data/keyword_aerj_model_v2.rda')

# -------------------------
# EEPA

keyword_results_eepa <- keyword_directory(directory = 'C:/Users/bleb/Documents/EEPA.Data/PDF',
                                          keyword = model_keywords, 
                                          surround_lines = FALSE,
                                          split_pdf = TRUE,
                                          ignore_case = model_ignore,
                                          full_names = TRUE,
                                          recursive = TRUE,
                                          max_search = NULL)

keyword_results_eepa$journal <- 'EEPA'

save(keyword_results_eepa, file = 'C:/Users/bleb/OneDrive - University of Iowa/JournalArticlesInProgress/software_pop/data/keyword_eepa_model_v2.rda')


# -------------------------
# JEE

keyword_results_jee <- keyword_directory(directory = 'C:/Users/bleb/Documents/JEE.Data/PDF',
                                          keyword = model_keywords, 
                                          surround_lines = FALSE,
                                          ignore_case = model_ignore,
                                          full_names = TRUE,
                                          recursive = TRUE,
                                          max_search = NULL)

keyword_results_jee$journal <- 'JEE'

save(keyword_results_jee, file = 'C:/Users/bleb/OneDrive - University of Iowa/JournalArticlesInProgress/software_pop/data/keyword_jee_model_v2.rda')

# -------------------------
# am_j_pol_sci

keyword_results_am_j_pol_sci <- keyword_directory(directory = 'C:/Users/bleb/Documents/am_j_pol_sci.Data/PDF',
                                         keyword = model_keywords, 
                                         split_pdf = TRUE,
                                         surround_lines = FALSE,
                                         ignore_case = model_ignore,
                                         full_names = TRUE,
                                         recursive = TRUE,
                                         max_search = NULL)

keyword_results_am_j_pol_sci$journal <- 'am_j_pol_sci'

save(keyword_results_am_j_pol_sci, file = 'C:/Users/bleb/OneDrive - University of Iowa/JournalArticlesInProgress/software_pop/data/keyword_am_j_pol_sci_model_v2.rda')

# -------------------------
# economic journal

keyword_results_ej <- keyword_directory(directory = 'C:/Users/bleb/Documents/ej.Data/PDF',
                                         keyword = model_keywords, 
                                         surround_lines = FALSE,
                                         ignore_case = model_ignore,
                                         full_names = TRUE,
                                         recursive = TRUE,
                                         max_search = NULL)

keyword_results_ej$journal <- 'ej'

save(keyword_results_ej, file = 'C:/Users/bleb/OneDrive - University of Iowa/JournalArticlesInProgress/software_pop/data/keyword_ej_model_v2.rda')

# -------------------------
# educational researcher

keyword_results_er <- keyword_directory(directory = 'C:/Users/bleb/Documents/ER.Data/PDF',
                                         keyword = model_keywords, 
                                         surround_lines = FALSE,
                                        split_pdf = TRUE,
                                         ignore_case = model_ignore,
                                         full_names = TRUE,
                                         recursive = TRUE,
                                         max_search = NULL)

keyword_results_er$journal <- 'er'

save(keyword_results_er, file = 'C:/Users/bleb/OneDrive - University of Iowa/JournalArticlesInProgress/software_pop/data/keyword_er_model_v2.rda')

# -------------------------
# HE

keyword_results_he <- keyword_directory(directory = 'C:/Users/bleb/Documents/HE.Data/PDF',
                                         keyword = model_keywords, 
                                         surround_lines = FALSE,
                                         ignore_case = model_ignore,
                                         full_names = TRUE,
                                         recursive = TRUE,
                                         max_search = NULL)

keyword_results_he$journal <- 'he'

save(keyword_results_he, file = 'C:/Users/bleb/OneDrive - University of Iowa/JournalArticlesInProgress/software_pop/data/keyword_he_model_v2.rda')

# -------------------------
# pol_sci_quar

keyword_results_pol_sci_quar <- keyword_directory(directory = 'C:/Users/bleb/Documents/pol_sci_quar.Data/PDF',
                                         keyword = model_keywords, 
                                         surround_lines = FALSE,
                                         ignore_case = model_ignore,
                                         full_names = TRUE,
                                         recursive = TRUE,
                                         max_search = NULL)

keyword_results_pol_sci_quar$journal <- 'pol_sci_quar'

save(keyword_results_pol_sci_quar, file = 'C:/Users/bleb/OneDrive - University of Iowa/JournalArticlesInProgress/software_pop/data/keyword_pol_sci_quar_model_v2.rda')

# -------------------------
# pub_policy_admin

keyword_results_pub_policy_admin <- keyword_directory(directory = 'C:/Users/bleb/Documents/pub_policy_admin.Data/PDF',
                                         keyword = model_keywords, 
                                         surround_lines = FALSE,
                                         ignore_case = model_ignore,
                                         full_names = TRUE,
                                         recursive = TRUE,
                                         max_search = NULL)

keyword_results_pub_policy_admin$journal <- 'pub_policy_admin'

save(keyword_results_pub_policy_admin, file = 'C:/Users/bleb/OneDrive - University of Iowa/JournalArticlesInProgress/software_pop/data/keyword_pub_policy_admin_model_v2.rda')

# -------------------------
# SE

keyword_results_SE <- keyword_directory(directory = 'C:/Users/bleb/Documents/SE.Data/PDF',
                                         keyword = model_keywords, 
                                        split_pdf = TRUE,
                                         surround_lines = FALSE,
                                         ignore_case = model_ignore,
                                         full_names = TRUE,
                                         recursive = TRUE,
                                         max_search = NULL)

keyword_results_SE$journal <- 'SE'

save(keyword_results_SE, file = 'C:/Users/bleb/OneDrive - University of Iowa/JournalArticlesInProgress/software_pop/data/keyword_SE_model_v2.rda')


# -------------------------
# public_policy

keyword_results_public_policy <- keyword_directory(directory = 'C:/Users/bleb/Documents/public_policy.Data/PDF',
                                         keyword = model_keywords, 
                                         surround_lines = FALSE,
                                         ignore_case = model_ignore,
                                         full_names = TRUE,
                                         recursive = TRUE,
                                         max_search = NULL)

keyword_results_public_policy$journal <- 'public_policy'

save(keyword_results_public_policy, file = 'C:/Users/bleb/OneDrive - University of Iowa/JournalArticlesInProgress/software_pop/data/keyword_public_policy_model_v2.rda')


# -------------------------
# American Economic Journal

keyword_results_aej_ae <- keyword_directory(directory = 'C:/Users/bleb/Documents/aej_ae.Data/PDF',
                                            keyword = model_keywords, 
                                            surround_lines = FALSE,
                                            ignore_case = model_ignore,
                                            full_names = TRUE,
                                            recursive = TRUE,
                                            max_search = NULL)

keyword_results_aej_ae$journal <- 'aej_ae'

save(keyword_results_aej_ae, file = 'C:/Users/bleb/OneDrive - University of Iowa/JournalArticlesInProgress/software_pop/data/keyword_aej_ae_model_v2.rda')
