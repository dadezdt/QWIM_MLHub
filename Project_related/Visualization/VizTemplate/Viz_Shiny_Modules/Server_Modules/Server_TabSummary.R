


Mod_Viz_Server_TabSummary <- modules::module(
{

## packages that need to be explicitly imported within this module 
#    modules::import(from = "dplyr")  ## needed for %>%


## define local piping operator, to avoid loading dplyr package
`%>%` <- dplyr::`%>%`


## local files or functions that have to be imported explicitly
#   nameForLocalUsage <- modules::use(module = "SomeName")  
    pathFile <- base::file.path('Server_Modules','Server_TabResultsTwo.R')
    MVS_TR2 <- modules::use(module = pathFile)


## functions exported from this module
    modules::export("RenderContent")


RenderContent <- function(
## the first three arguments of the function have to be input, output and session
    input, output, session,  
## the regular function arguments
    data_MVSTS_RC,
    funcs_MVSTS_RC,
    reactiveInputs_MVSTS_RC,
    reactiveVars_MVSTS_RC,
    reactiveTriggers_MVSTS_RC,
    output_MVSTS_RC)
{
  nameFunctionForMessage <- "Mod_Viz_Server_TabSummary$RenderContent() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  theOutputIDs <- output_MVSTS_RC
 
  theOutputIDs <- RenderContent_FirstRow(
    input, output, session,  
    data_MVSTS_RC_R1 = data_MVSTS_RC,
    funcs_MVSTS_RC_R1 = funcs_MVSTS_RC,
    reactiveInputs_MVSTS_RC_R1 = reactiveInputs_MVSTS_RC,
    reactiveVars_MVSTS_RC_R1 = reactiveVars_MVSTS_RC,
    output_MVSTS_RC_R1 = theOutputIDs)
  
  theOutputIDs <- RenderContent_SecondRow(
    input, output, session,  
    data_MVSTS_RC_R2 = data_MVSTS_RC,
    funcs_MVSTS_RC_R2 = funcs_MVSTS_RC,
    reactiveInputs_MVSTS_RC_R2 = reactiveInputs_MVSTS_RC,
    reactiveVars_MVSTS_RC_R2 = reactiveVars_MVSTS_RC,
    output_MVSTS_RC_R2 = theOutputIDs)
  
  theOutputIDs <- RenderContent_ThirdRow(
    input, output, session,  
    data_MVSTS_RC_R3 = data_MVSTS_RC,
    funcs_MVSTS_RC_R3 = funcs_MVSTS_RC,
    reactiveInputs_MVSTS_RC_R3 = reactiveInputs_MVSTS_RC,
    reactiveVars_MVSTS_RC_R3 = reactiveVars_MVSTS_RC,
    output_MVSTS_RC_R3 = theOutputIDs)
  
  theOutputIDs <- PerformShinyEvents(
    input, output, session,  
    data_MVSTS_PSE = data_MVSTS_RC,
    funcs_MVSTS_PSE = funcs_MVSTS_RC,
    reactiveInputs_MVSTS_PSE = reactiveInputs_MVSTS_RC,
    reactiveVars_MVSTS_PSE = reactiveVars_MVSTS_RC,
    reactiveTriggers_MVSTS_PSE = reactiveTriggers_MVSTS_RC,
    output_MVSTS_PSE = theOutputIDs)  
  
  return(theOutputIDs)
}


RenderContent_FirstRow <- function(
## the first three arguments of the function have to be input, output and session
    input, output, session,  
## the regular function arguments
    data_MVSTS_RC_R1,
    funcs_MVSTS_RC_R1,
    reactiveInputs_MVSTS_RC_R1,
    reactiveVars_MVSTS_RC_R1,
    output_MVSTS_RC_R1)
{
  nameFunctionForMessage <- "Mod_Viz_Server_TabSummary$RenderContent_FirstRow() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  theOutputIDs <- output_MVSTS_RC_R1
  theReactiveVars <- reactiveVars_MVSTS_RC_R1
  
  shiny::observeEvent(
    
    eventExpr = theReactiveVars[["TotalValue"]],
    
    handlerExpr = {
      
      theOutputIDs$outputID_TabSummary_TotalValue <-  shiny::callModule(
        module = RenderTotalValue,
        id = "ID_Mod_Viz_Server_TabSummary_RenderTotalValue",
        data_MVSTS_RTV = data_MVSTS_RC_R1,
        funcs_MVSTS_RTV = funcs_MVSTS_RC_R1,
        reactiveVars_MVSTS_RTV = theReactiveVars)
      
  })
  
  return(theOutputIDs)
}


RenderContent_SecondRow <- function(
## the first three arguments of the function have to be input, output and session
    input, output, session,  
## the regular function arguments
    data_MVSTS_RC_R2,
    funcs_MVSTS_RC_R2,
    reactiveInputs_MVSTS_RC_R2,
    reactiveVars_MVSTS_RC_R2,
    output_MVSTS_RC_R2)
{
  nameFunctionForMessage <- "Mod_Viz_Server_TabSummary$RenderContent_SecondRow() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  theOutputIDs <- output_MVSTS_RC_R2
  theReactiveVars <- reactiveVars_MVSTS_RC_R2
  
  shiny::observeEvent(
    
    eventExpr = theReactiveVars[["PortfolioValue"]],
    
    handlerExpr = {   
      
      theOutputIDs$outputID_TabSummary_PortfolioValue <- shiny::callModule(
        module = RenderPortfolioValue,
        id = "ID_Mod_Viz_Server_TabSummary_RenderPortfolioValue",
        data_MVSTS_RPV = data_MVSTS_RC_R2,
        funcs_MVSTS_RPV = funcs_MVSTS_RC_R2,
        reactiveVars_MVSTS_RPV = theReactiveVars)
      
    })      
  

  return(theOutputIDs)
}


RenderContent_ThirdRow <- function(
## the first three arguments of the function have to be input, output and session
    input, output, session,  
## the regular function arguments
    data_MVSTS_RC_R3,
    funcs_MVSTS_RC_R3,
    reactiveInputs_MVSTS_RC_R3,
    reactiveVars_MVSTS_RC_R3,
    output_MVSTS_RC_R3)
{
  nameFunctionForMessage <- "Mod_Viz_Server_TabSummary$RenderContent_ThirdRow() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  theOutputIDs <- output_MVSTS_RC_R3
  theReactiveVars <- reactiveVars_MVSTS_RC_R3
  
  shiny::observeEvent(
    
    eventExpr = reactiveVars_MVSTS_RC_R3[["DateLastUpdate"]],
    
    handlerExpr = {   
      
      theOutputIDs$outputID_TabSummary_DateLastUpdate <- shiny::callModule(
        module = RenderDateLastUpdate,
        id = "ID_Mod_Viz_Server_TabSummary_RenderDateLastUpdate",
        data_MVSTS_RDLE = data_MVSTS_RC_R3,
        funcs_MVSTS_RDLE = funcs_MVSTS_RC_R3,
        reactiveVars_MVSTS_RDLE = theReactiveVars)   
      
  })   
  
  shiny::observeEvent(
    
    eventExpr = reactiveVars_MVSTS_RC_R3[["DateLastReport"]],
    
    handlerExpr = {   
      
      theOutputIDs$outputID_TabSummary_DateLastReport <- shiny::callModule(
        module = RenderDateLastReport,
        id = "ID_Mod_Viz_Server_TabSummary_RenderDateLastReport",
        data_MVSTS_RDLR = data_MVSTS_RC_R3,
        funcs_MVSTS_RDLR = funcs_MVSTS_RC_R3,
        reactiveVars_MVSTS_RDLR = theReactiveVars)   
      
  })     
  
  return(theOutputIDs)
}


RenderPortfolioValue <- function(
## the first three arguments of the function have to be input, output and session
    input, output, session,
## the regular function arguments
    data_MVSTS_RPV,
    funcs_MVSTS_RPV,
    reactiveVars_MVSTS_RPV)
{
  nameFunctionForMessage <- "Mod_Viz_Server_TabSummary$RenderPortfolioValue() "
  reportr::setOutputLevel(reportr::OL$Error)
  
  theValue <- shiny::isolate(expr = reactiveVars_MVSTS_RPV[["PortfolioValue"]])
  formattedValue <- base::prettyNum(
    x = theValue,
    big.mark = ",", 
    preserve.width = "none")
  
  theOutput <- semantic.dashboard::renderValueBox(
    
    expr = semantic.dashboard::valueBox(
      value = formattedValue,
      subtitle = "Portfolio Value",
      icon = semantic.dashboard::icon("dollar"),
      color = "",
      width = 2,
      size = "tiny")
  )
  
  return(theOutput)
}


RenderTotalValue <- function(
## the first three arguments of the function have to be input, output and session
    input, output, session,
## the regular function arguments
    data_MVSTS_RTV,
    funcs_MVSTS_RTV,
    reactiveVars_MVSTS_RTV)
{
  nameFunctionForMessage <- "Mod_Viz_Server_TabSummary$RenderTotalValue() "
  reportr::setOutputLevel(reportr::OL$Error)
  
  theValue <- shiny::isolate(expr = reactiveVars_MVSTS_RTV[["TotalValue"]])
  formattedValue <- base::prettyNum(
    x = theValue,
    big.mark = ",", 
    preserve.width = "none")
  
  theOutput <- semantic.dashboard::renderValueBox(
    
    expr = semantic.dashboard::valueBox(
      value = formattedValue,
      subtitle = "Total Value",
      icon = semantic.dashboard::icon("dollar"),
      color = "",
      width = 2,
      size = "tiny")
  )
  
  return(theOutput)
}


RenderDateLastUpdate <- function(
## the first three arguments of the function have to be input, output and session
    input, output, session,
## the regular function arguments
    data_MVSTS_RDLE,
    funcs_MVSTS_RDLE,
    reactiveVars_MVSTS_RDLE)
{
  nameFunctionForMessage <- "Mod_Viz_Server_TabSummary$RenderDateLastUpdate() "
  reportr::setOutputLevel(reportr::OL$Error)
  
  theValue <- shiny::isolate(expr = reactiveVars_MVSTS_RDLE[["DateLastUpdate"]])
  #  formattedValue <- lubridate::stamp(x = theValue)
  
  theOutput <- semantic.dashboard::renderValueBox(
    
    expr = semantic.dashboard::valueBox(
      value = "Feb 02, 2020", # formattedValue,
      subtitle = "Date Last Update",
      icon = semantic.dashboard::icon("calendar alternate outline"),
      color = "",
      width = 2,
      size = "tiny")
    
  )
  
  return(theOutput)
}


RenderDateLastReport <- function(
## the first three arguments of the function have to be input, output and session
    input, output, session,
## the regular function arguments
    data_MVSTS_RDLR,
    funcs_MVSTS_RDLR,
    reactiveVars_MVSTS_RDLR)
{
  nameFunctionForMessage <- "Mod_Viz_Server_TabSummary$RenderDateLastReport() "
  reportr::setOutputLevel(reportr::OL$Error)
  
  theValue <- shiny::isolate(expr = reactiveVars_MVSTS_RDLR[["DateLastReport"]])
  #  formattedValue <- lubridate::stamp(x = theValue)
  
  theOutput <- semantic.dashboard::renderValueBox(
    
    expr = semantic.dashboard::valueBox(
      value = "Feb 10, 2020", # formattedValue,
      subtitle = "Date Last Report",
      icon = semantic.dashboard::icon("calendar alternate outline"),
      color = "",
      width = 2,
      size = "tiny")
    
  )
  
  return(theOutput)
}


PerformShinyEvents <- function(
## the first three arguments of the function have to be input, output and session
    input, output, session,  
## the regular function arguments
    data_MVSTS_PSE,
    funcs_MVSTS_PSE,
    reactiveInputs_MVSTS_PSE,
    reactiveVars_MVSTS_PSE,
    reactiveTriggers_MVSTS_PSE,
    output_MVSTS_PSE)
{
  nameFunctionForMessage <- "Mod_Viz_Server_TabSummary$PerformShinyEvents() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  theOutputIDs <- output_MVSTS_PSE
  
  shiny::observeEvent(
    
    eventExpr = reactiveTriggers_MVSTS_PSE[["ActionButton_TabSummary_TotalValue"]],
    
    handlerExpr = {
      
      theOutputIDs$outputID_TabResultsTwo_FirstSubTab_TableDT <- DT::renderDataTable({
        
        theData <- data_MVSTS_PSE[["DataCars"]]
        base::colnames(theData)[3] <- "FirstChange"
        
        shiny::callModule(
          module =  MVS_TR2$Mod_Viz_Server_TabResultsTwo$DisplaySampleDT,
          id = "ID_Mod_Viz_Svr_TabReport2_SampleDT_ActionButton_TabSummary_TotalValue",
          data_MVSTR2_DSDT = theData,
          funcs_MVSTR2_DSDT = funcs_MVSTS_PSE)
    })
      
  })    
  
  shiny::observeEvent(
    
    eventExpr = reactiveTriggers_MVSTS_PSE[["ActionButton_TabSummary_DateLastReport"]],
    
    handlerExpr = {
      
      theOutputIDs$outputID_TabResultsTwo_FirstSubTab_TableDT <- DT::renderDataTable({
        
        theData <- data_MVSTS_PSE[["DataCars"]]
        base::colnames(theData)[3] <- "SecondChange"
        
        shiny::callModule(
          module = MVS_TR2$Mod_Viz_Server_TabResultsTwo$DisplaySampleDT,
          id = "ID_Mod_Viz_Svr_TabReport2_SampleDT_ActionButton_TabSummary_DateLastReport",
          data_MVSTR2_DSDT = theData,
          funcs_MVSTR2_DSDT = funcs_MVSTS_PSE)
    })
      
  })    
  
  return(theOutputIDs)  
}


})
