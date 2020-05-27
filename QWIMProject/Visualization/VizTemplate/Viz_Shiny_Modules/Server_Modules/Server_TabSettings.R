


Mod_Viz_Server_TabSettings <- modules::module(
{

## packages that need to be explicitly imported within this module 
#    modules::import(from = "dplyr")  ## needed for %>%


## define local piping operator, to avoid loading dplyr package
    `%>%` <- dplyr::`%>%`


## local files or functions that have to be imported explicitly
#   nameForLocalUsage <- modules::use(module = "SomeName")  


## functions exported from this module
    modules::export("RenderContent")


RenderContent <- function(
## the first three arguments of the function have to be input, output and session
    input, output, session,
## the regular function arguments
    data_MVSTS_RC,
    funcs_MVSTS_RC)
{
  nameFunctionForMessage <- "Mod_Viz_Server_TabSettings$RenderContent() "
  reportr::setOutputLevel(reportr::OL$Error)
  
  theOutput <- NULL
  
  return(theOutput)
  
}


})
