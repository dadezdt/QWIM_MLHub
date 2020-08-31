


Mod_Viz_Server_TabResultsTwo <- modules::module(
{

## packages that need to be explicitly imported within this module 
#    modules::import(from = "dplyr")  ## needed for %>%


## define local piping operator, to avoid loading dplyr package
    `%>%` <- dplyr::`%>%`


## local files or functions that have to be imported explicitly
#   nameForLocalUsage <- modules::use(module = "SomeName")  


## functions exported from this module
    modules::export("RenderContent")
    modules::export("DisplaySampleDT")


RenderContent <- function(
## the first three arguments of the function have to be input, output and session
    input, output, session,  
## the regular function arguments
    data_MVSTR2_RC,
    funcs_MVSTR2_RC,
    reactiveInputs_MVSTR2_RC, 
    reactiveVars_MVSTR2_RC,
    reactiveTriggers_MVSTR2_RC,
    output_MVSTR2_RC)
{
  nameFunctionForMessage <- "Mod_Viz_Server_TabResultsTwo$RenderContent() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  objReactive_UserInputs <- reactiveInputs_MVSTR2_RC
  
  theOutputIDs <- output_MVSTR2_RC
  
  shiny::observeEvent(
    
    eventExpr = reactiveInputs_MVSTR2_RC[["InvestorName"]],
    
    handlerExpr = {
      
      theOutputIDs$outputID_TabResultsTwo_FirstSubTab_TableDT <- DT::renderDataTable({
        
        theData <- data_MVSTR2_RC[["DataCars"]]
        base::colnames(theData)[3] <- "Original"
        
        shiny::callModule(
          module = DisplaySampleDT,
          id = "ID_Mod_Viz_Svr_TabReport2_DisplaySampleDT",
          data_MVSTR2_DSDT = theData,
          funcs_MVSTR2_DSDT = funcs_MVSTR2_RC)
    })
      
  })   
  
  return(theOutputIDs)
}


DisplaySampleDT <- function(
## the first three arguments of the function have to be input, output and session
    input, output, session,  
## the regular function arguments
    data_MVSTR2_DSDT,
    funcs_MVSTR2_DSDT)
{
  nameFunctionForMessage <- "Mod_Viz_Server_TabReportTwo$DisplaySampleDT() "    
  reportr::setOutputLevel(reportr::OL$Error)

  outputTable <- DT::datatable(data = data_MVSTR2_DSDT)
  numColsTable <- base::ncol(data_MVSTR2_DSDT)
  
  # outputTable <- DT::formatRound(
  #   table = outputTable,
  #   columns = c(2:numColsTable),
  #   digits = 2)
  
  theOutput <- DT::formatStyle(
    table = outputTable,
    columns = c(2:numColsTable),
    'text-align' = 'center')
  
  return(theOutput)
} 


})
