


Mod_Viz_Server_TabAnalysisTwo <- modules::module(
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
    data_MVSTA2_RC,
    funcs_MVSTA2_RC,
    reactiveInputs_MVSTA2_RC, 
    reactiveVars_MVSTA2_RC,
    reactiveTriggers_MVSTA2_RC,
    output_MVSTA2_RC)
{
  nameFunctionForMessage <- "Mod_Viz_Server_TabAnalysisTwo$RenderContent() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  theOutputIDs <- output_MVSTA2_RC
  
  shiny::observeEvent(
    
    eventExpr = reactiveInputs_MVSTA2_RC[["InvestorName"]],
    
    handlerExpr = {
      
      theOutputIDs$outputID_TabAnalysisTwo_dotplotOne <- plotly::renderPlotly({
        shiny::callModule(
          module = CalcDotPlot,
          id = "ID_Mod_Viz_Svr_TabAnalysis2_CalcDotPlot",
          data_MVSTA2_CDP = data_MVSTA2_RC[["DataCars"]],
          funcs_MVSTA2_CDP = funcs_MVSTA2_RC)
    })
  }) 
  
  shiny::observeEvent(
    
    eventExpr = reactiveInputs_MVSTA2_RC[["InvestorName"]],
    
    handlerExpr = {
      
      theOutputIDs$outputID_TabAnalysisTwo_DT <- DT::renderDataTable({
        shiny::callModule(
          module = CalcDT,
          id = "ID_Mod_Viz_Svr_TabAnalysis2_CalcDT",
          data_MVSTA2_CDT = data_MVSTA2_RC[["DataCars"]],
          funcs_MVSTA2_CDT = funcs_MVSTA2_RC)
    })
      
  }) 
  
  return(theOutputIDs)
}


CalcDotPlot <- function(
## the first three arguments of the function have to be input, output and session
    input, output, session,  
## the regular function arguments
    data_MVSTA2_CDP,
    funcs_MVSTA2_CDP)
{
  nameFunctionForMessage <- "Mod_Viz_Server_TabAnalysisTwo$CalcDotPlot() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  colscale <- c(semantic.dashboard::semantic_palette[["red"]],
                semantic.dashboard::semantic_palette[["green"]], 
                semantic.dashboard::semantic_palette[["blue"]])
  
  thePlot <- ggplot2::ggplot(data_MVSTA2_CDP) +
    ggplot2::aes(x = wt, y = mpg) +
    ggplot2::geom_point(ggplot2::aes(colour = base::factor(x = cyl), size = qsec)) +
    ggplot2::scale_colour_manual(values = colscale)
  
  theOutput <- plotly::ggplotly(p = thePlot)
  
  return(theOutput)
} 


CalcDT <- function(
## the first three arguments of the function have to be input, output and session
    input, output, session,  
## the regular function arguments
    data_MVSTA2_CDT,
    funcs_MVSTA2_CDT)
{
  nameFunctionForMessage <- "Mod_Viz_Server_TabAnalysisTwo$CalcDT() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  outputTable <- DT::datatable(data = data_MVSTA2_CDT)
  numColsTable <- base::ncol(data_MVSTA2_CDT)
  
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
