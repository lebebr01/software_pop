library(pdfsearch)

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

keyword_results <- keyword_directory(directory = 'C:/Users/bleb/Documents/Master.Data/PDF',
                  keyword = soft_keywords, 
                  surround_lines = FALSE,
                  ignore.case = soft_ignore,
                  full_names = TRUE,
                  recursive = TRUE,
                  max_search = NULL)

save(keyword_results, file = 'C:/Users/bleb/OneDrive for Business/JournalArticlesInProgress/software_pop/data/initial_keyword.rda')

