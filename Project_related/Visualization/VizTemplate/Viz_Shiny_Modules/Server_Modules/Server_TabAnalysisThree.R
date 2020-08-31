


Mod_Viz_Server_TabAnalysisThree <- modules::module(
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
    data_MVSTA3_RC,
    funcs_MVSTA3_RC,
    reactiveInputs_MVSTA3_RC, 
    reactiveVars_MVSTA3_RC,
    reactiveTriggers_MVSTA3_RC,
    output_MVSTA3_RC)
{
  nameFunctionForMessage <- "Mod_Viz_Server_TabAnalysisThree$RenderContent() "
  reportr::setOutputLevel(reportr::OL$Error)
  
  theOutputIDs <- output_MVSTA3_RC
  
  shiny::observeEvent(
    
    eventExpr = reactiveInputs_MVSTA3_RC[["InvestorCashFlows"]],
    
    handlerExpr = {
      
      theOutputIDs$outputID_TabAnalysisThree_InvestorCashFlows <- rhandsontable::renderRHandsontable({
        theOutput <- shiny::callModule(
          module = InvestorCashFlowsAsTable,
          id = "ID_Mod_Viz_Server_Tab3_InvestorCashFlowsAsTable",
          data_MVSTA3_ICFAT = data_MVSTA3_RC,
          funcs_MVSTA3_ICFAT = funcs_MVSTA3_RC,
          reactiveInputs_MVSTA3_ICFAT = reactiveInputs_MVSTA3_RC) 
      })
    })
  
  return(theOutputIDs)
}


InvestorCashFlowsAsTable <- function(
## the first three arguments of the function have to be input, output and session
    input, output, session,
## the regular function arguments
    data_MVSTA3_ICFAT,
    funcs_MVSTA3_ICFAT,
    reactiveInputs_MVSTA3_ICFAT)
{
  nameFunctionForMessage <- "Mod_Viz_Server_TabAnalysisThree$InvestorCashFlowsAsTable() "
  reportr::setOutputLevel(reportr::OL$Error)
  
  theOutput <- rhandsontable::rhandsontable(
    data = shiny::isolate(expr = reactiveInputs_MVSTA3_ICFAT[["InvestorCashFlows"]]), 
    width = 800) 
  #      height = 300) 
  
  return(theOutput)
}


})
