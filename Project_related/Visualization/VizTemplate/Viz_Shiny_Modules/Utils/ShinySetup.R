


## as soon as we run the code for the Shiny app, the working directory becomes 
## WorkingDir_RProject/.../Viz_Shiny_Modules
## instead of 
## WorkingDir_RProject
## this is reflected in the relative path of the files sourced below


## define local piping operator
`%>%` <- dplyr::`%>%`

OptionsShinyViz <- list()
# Define a comma separator option of Highcharter
hcopslang <- base::getOption('highcharter.lang')
hcopslang$thousandsSep <- ','
base::options(highcharter.lang = hcopslang)

# Turns off Shiny reactive log (Ctrl + F3) for increased performance
base::options(shiny.reactlog = FALSE)

# ## Define variables to build Shiny UI
OptionsShinyViz[["headerBackgroundColor"]] <- "blue"
OptionsShinyViz[["headerFontColor"]] <- 'white'
