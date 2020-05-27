


Mod_Viz_UI_TabSettings <- modules::module(
{

## packages that need to be explicitly imported within this module 
#    modules::import(from = "dplyr")  ## needed for %>%


## define local piping operator, to avoid loading dplyr package
    `%>%` <- dplyr::`%>%`


## local files or functions that have to be imported explicitly
#   nameForLocalUsage <- modules::use(module = "SomeName")  


## functions exported from this module
    modules::export("DisplayContent")


DisplayContent <- function(
    data_MVUITS_DC,
    funcs_MVUITS_DC)
{
  nameFunctionForMessage <- "Mod_Viz_UI_TabSettings$DisplayContent() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
## just a placeholder for now
  theUI <- shiny::fluidRow(

    semantic.dashboard::box(

      width = 8,
      title = "Graphics1 Settings",
      color = "green",
      ribbon = TRUE,
      title_side = "top right"))

  return(theUI)
}


})
