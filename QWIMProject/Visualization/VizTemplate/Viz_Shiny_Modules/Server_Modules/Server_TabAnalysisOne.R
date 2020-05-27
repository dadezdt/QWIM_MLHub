


Mod_Viz_Server_TabAnalysisOne <- modules::module(
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
    data_MVSTA1_RC,
    funcs_MVSTA1_RC,
    reactiveInputs_MVSTA1_RC, 
    reactiveVars_MVSTA1_RC,
    reactiveTriggers_MVSTA1_RC,
    output_MVSTA1_RC)
{
  nameFunctionForMessage <- "Mod_Viz_Server_TabAnalysisOne$RenderContent() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  reactiveInputs <- reactiveInputs_MVSTA1_RC
  
  theOutputIDs <- output_MVSTA1_RC
  
  shiny::observeEvent(
    
    eventExpr = reactiveInputs[["InvestorName"]],
    
    handlerExpr = {
      
      theOutputIDs$outputID_TabAnalysisOne_boxplotOne <- shiny::renderPlot({
        shiny::callModule(
          module = CalcBoxPlot,
          id = "ID_Mod_Viz_Svr_TabAnalysis1_CalcBoxPlot",
          data_MVSTA1_CBP = data_MVSTA1_RC[["DataCars"]],
          funcs_MVSTA1_CBP = funcs_MVSTA1_RC)
      })
      
    }) 
  
  shiny::observeEvent(
    
    eventExpr = reactiveInputs[["NameTimeSeries_TabAnalysisOne_SecondSubTab"]],
    
    handlerExpr = {
      
      theOutputIDs$outputID_TabAnalysisOne_PlotTimeSeries <- plotly::renderPlotly({
        shiny::callModule(
          module = CalcPlotTimeSeries,
          id = "ID_Mod_Viz_Svr_TabAnalysisOne_CalcPlotTimeSeries",
          data_MVSTA1_CPTS = data_MVSTA1_RC,
          reactiveInputs_MVSTA1_CPTS = reactiveInputs,
          funcs_MVSTA1_CPTS = funcs_MVSTA1_RC)
      })
      
    }) 
  
  return(theOutputIDs)
}


CalcBoxPlot <- function(
## the first three arguments of the function have to be input, output and session
    input, output, session,
## the regular function arguments
    data_MVSTA1_CBP,
    funcs_MVSTA1_CBP)
{
  nameFunctionForMessage <- "Mod_Viz_Server_TabAnalysisOne$CalcBoxPlot() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  theData <- data_MVSTA1_CBP
  theData$am <- base::factor(
    x = data_MVSTA1_CBP$am,
    levels = c(0,1),
    labels = c("Automatic","Manual"))
  
  theOutput <- ggplot2::ggplot(theData) +
    ggplot2::aes(x = am, y = mpg) +
    ggplot2::geom_boxplot(fill = semantic.dashboard::semantic_palette[["green"]]) + 
    ggplot2::xlab("gearbox") + 
    ggplot2::ylab("Miles per gallon")
  
  return(theOutput)
}


CalcPlotTimeSeries <- function(
## the first three arguments of the function have to be input, output and session
    input, output, session,
## the regular function arguments
    data_MVSTA1_CPTS,
    funcs_MVSTA1_CPTS,
    reactiveInputs_MVSTA1_CPTS)
{
  nameFunctionForMessage <- "Mod_Viz_Server_TabAnalysisOne$CalcPlotTimeSeries() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  theData <- data_MVSTA1_CPTS[["DataTimeSeries"]]
  theNameTimeSeries <- shiny::isolate(expr = 
      reactiveInputs_MVSTA1_CPTS[["NameTimeSeries_TabAnalysisOne_SecondSubTab"]])
  
  namesTimeSeries <- base::names(theData)
  namesTimeSeries <- namesTimeSeries[-1]  ## since the first column is Date
  idx <- base::which(namesTimeSeries == theNameTimeSeries)
  
  availableColors <- data_MVSTA1_CPTS[["Colors_PlotTimeSeries"]]
  thePlotColor <- base::as.character(availableColors[idx,2])
  
## the static plot
  thePlot <- ggplot2::ggplot(theData) +
    ggplot2::aes_string(x = "Date", y = theNameTimeSeries) + 
    ggplot2::geom_line(color = thePlotColor) +
    ggplot2::xlab(label = "Date") + 
## to exemplify how to use functions which are stored in list funcs_MVSTA1_CPTS
## we have replaced the function below by its saved counterpart in funcs_MVSTA1_CPTS
#    ggplot2::ylab(label = "Value") +
    funcs_MVSTA1_CPTS[["Func_ggplot_ylab"]](label = "Value") +
    ggplot2::theme_bw()
  
## the interactive plot
  theOutput <- plotly::ggplotly(p = thePlot)
  
  return(theOutput)
}


})
