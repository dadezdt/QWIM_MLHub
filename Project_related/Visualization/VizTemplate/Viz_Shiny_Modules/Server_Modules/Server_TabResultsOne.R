


Mod_Viz_Server_TabResultsOne <- modules::module(
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
    data_MVSTR1_RC,
    funcs_MVSTR1_RC,
    reactiveInputs_MVSTR1_RC, 
    reactiveVars_MVSTR1_RC,
    reactiveTriggers_MVSTR1_RC,
    output_MVSTR1_RC)
{
  nameFunctionForMessage <- "Mod_Viz_Server_TabResultsOne$RenderContent() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  objReactive_UserInputs <- reactiveInputs_MVSTR1_RC
  
  theOutputIDs <- output_MVSTR1_RC
  
  
  return(theOutputIDs)
}



})
