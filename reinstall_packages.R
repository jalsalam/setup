
reinstall_my_packages <- function() {
  
  pkgs <- c("tidyverse", 
            "shiny",
            
            #r-lib
            "devtools", 
            "usethis", 
            "testthat", 
            "roxygen2",
            "rlang",
            #"pryr",
            #"lobstr",
            "covr",
            "here",
            "keyring",
            "reprex",
            "datapasta",
            "glue",
            #"vctrs",
            #"sloop",
            #"arrow",
            
            #data
            "nycflights13",
            "babynames",
            #"fivethirtyeight",
            #the economist
            
            #files
            "openxlsx",
            "tidyxl",
            "tidygraph",
            "ggraph",
            #"gganimate",
            "writexl",
            "r2d3",
            "data.tree",
            
            #Database
            "DBI",
            "RSQLite",
            #"RPostgres",
            #"RMariaDB",
            "odbc",
            
            #GIS
            "ncdf4",
            "sf",
            
            #Rmarkdown
            "rmarkdown",
            "tinytex",
            "commonmark",
            "blogdown",
            "bookdown",
            "pkgdown",
            "servr",
            
            #Ropensci/APIs
            "aws.s3",
            "drake",
            #"rrtools",
            "rusda",
            "rnoaa",
            "EIAdata",
            #"ghql",
            "pdftools",
            "tabulizer",
            "magick",
            "rtweet",
            
            
            #plotting
            "ggthemes",
            "viridis",
            "plotly",
            #"patchwork",
            "cowplot",
            
            #tables
            "huxtable",
            "kableExtra"
            )
  
  miss_pkgs <- setdiff(pkgs, installed.packages())
  
  install.packages(miss_pkgs)
  
}