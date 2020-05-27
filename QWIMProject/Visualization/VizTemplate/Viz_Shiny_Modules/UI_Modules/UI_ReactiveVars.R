

Mod_Viz_UI_ReactiveVars <- modules::module(
{

## packages that need to be explicitly imported within this module 
#    modules::import(from = "dplyr")  ## needed for %>%


## define local piping operator, such that we do not need to import explicitly dplyr package
    `%>%` <- dplyr::`%>%`  

    
## local files or functions that have to be imported explicitly
#   nameForLocalUsage <- modules::use(module = "SomeName")  


## functions exported from this module



})
