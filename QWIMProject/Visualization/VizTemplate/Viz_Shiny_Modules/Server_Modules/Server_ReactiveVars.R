

Mod_Viz_Svr_ReactiveVars <- modules::module(
{
  
## packages that need to be explicitly imported within this module 
#    modules::import(from = "dplyr")  ## needed for %>%


## define local piping operator, such that we do not need to import explicitly dplyr package
    `%>%` <- dplyr::`%>%`  

## local files or functions that have to be imported explicitly
#   nameForLocalUsage <- modules::use(module = "SomeName")  
    # pathFile <- base::file.path('UI_Modules','UI_TabData.R')
    # Mod_UI_TDa <- modules::use(module = pathFile)


## functions exported from this module
    modules::export("SetInitialValues_ReactiveUserInputs")
    modules::export("SetInitialValues_ReactiveInnerVariables")
    modules::export("SetInitialValues_ReactiveTriggers")
    modules::export("ObserveEvents_ReactiveUserInputs")
    modules::export("ObserveEvents_ReactiveInnerVariables")
    modules::export("ObserveEvents_ReactiveTriggers")
    modules::export("RenderContent")


SetInitialValues_ReactiveUserInputs <- function(
## the first three arguments of the function have to be input, output and session
    input, output, session,  
## the regular function arguments
    data_MVSRV_SIV_RUI)
{
  nameFunctionForMessage <- "Mod_Viz_Svr_ReactiveVars$SetInitialValues_ReactiveUserInputs() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  theReactiveUserInputs <- shiny::reactiveValues(
## Investor Info
    InvestorName = data_MVSRV_SIV_RUI[["DefaultInputs"]][["Investor"]][["Name"]],
    InvestorDateOfBirth = data_MVSRV_SIV_RUI[["DefaultInputs"]][["Investor"]][["DateOfBirth"]],
    InvestorLifeExpectancy = data_MVSRV_SIV_RUI[["DefaultInputs"]][["Investor"]][["LifeExpectancy"]],
    InvestorRetirementAge = data_MVSRV_SIV_RUI[["DefaultInputs"]][["Investor"]][["RetirementAge"]],

## Investor Tax rates    
    FederalTaxRate = data_MVSRV_SIV_RUI[["DefaultInputs"]][["TaxRates"]][["FederalTaxRate"]],
    StateTaxRate = data_MVSRV_SIV_RUI[["DefaultInputs"]][["TaxRates"]][["StateTaxRate"]],
    CapitalGainsTaxRate = data_MVSRV_SIV_RUI[["DefaultInputs"]][["TaxRates"]][["CapitalGainsTaxRate"]],
    DividendTaxRate = data_MVSRV_SIV_RUI[["DefaultInputs"]][["TaxRates"]][["DividendTaxRate"]],
    
## Investor cash flows and goals
    InvestorCashFlows = data_MVSRV_SIV_RUI[["DefaultInputs"]][["InvestorCashFlows"]],
    InvestorGoals = data_MVSRV_SIV_RUI[["DefaultInputs"]][["InvestorGoals"]],
    
## name time series
    NameTimeSeries_TabAnalysisTwo_SecondSubTab = "Series_2"
  )
  
  return(theReactiveUserInputs)
}


SetInitialValues_ReactiveInnerVariables <- function(
## the first three arguments of the function have to be input, output and session
    input, output, session,  
## the regular function arguments
    data_MVSRV_SIV_RIV)
{
  nameFunctionForMessage <- "Mod_Viz_Svr_ReactiveVars$SetInitialValues_ReactiveInnerVariables() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  theReactiveInnerVariables <- shiny::reactiveValues(
 
    PortfolioValue = data_MVSRV_SIV_RIV[["DefaultInnerVariables"]][["PortfolioValue"]],
    TotalValue = data_MVSRV_SIV_RIV[["DefaultInnerVariables"]][["TotalValue"]],
    DateLastUpdate = data_MVSRV_SIV_RIV[["DefaultInnerVariables"]][["DateLastUpdate"]],
    DateLastReport = data_MVSRV_SIV_RIV[["DefaultInnerVariables"]][["DateLastReport"]]
  )
  
  return(theReactiveInnerVariables)
}


SetInitialValues_ReactiveTriggers <- function(
## the first three arguments of the function have to be input, output and session
    input, output, session,  
## the regular function arguments
    data_MVSRV_SIV_RT)
{
  nameFunctionForMessage <- "Mod_Viz_Svr_ReactiveVars$SetInitialValues_ReactiveTriggers() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  theReactiveTriggers <- shiny::reactiveValues(
    
    ActionButton_TabSummary_TotalValue = NULL,
    ActionButton_TabSummary_DateLastReport = NULL
    
  )
  
  return(theReactiveTriggers)
}


RenderContent <- function(
## the first three arguments of the function have to be input, output and session
    input, output, session,  
## the regular function arguments
    data_MVSRV_RC,
    output_MVSRV_RC)
{
  nameFunctionForMessage <- "Mod_Viz_Svr_ReactiveVars$RenderContent() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  theOutputIDs <- output_MVSRV_RC
  
  return(theOutputIDs)
}


ObserveEvents_ReactiveUserInputs <- function(
## the first three arguments of the function have to be input, output and session
    input, output, session,  
## the regular function arguments
    inputs_MVSRV_OE_RUI,
    reactiveInputs_MVSRV_OE_RUI)
{
  nameFunctionForMessage <- "Mod_Viz_Svr_ReactiveVars$ObserveEvents_ReactiveUserInputs() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  theReactiveUserInputs <- reactiveInputs_MVSRV_OE_RUI
  
  theReactiveUserInputs <- ObserveEvents_InvestorInfo(
    input, output, session,  
    inputs_MVSRV_OE_II = inputs_MVSRV_OE_RUI,
    reactiveInputs_MVSRV_OE_II = theReactiveUserInputs)
  
  theObjReactive_UserInputs <- ObserveEvents_TaxRates(
    input, output, session,  
    inputs_MVSRV_OE_TR = inputs_MVSRV_OE_RUI,
    reactiveInputs_MVSRV_OE_TR = theReactiveUserInputs)  
  
  theObjReactive_UserInputs <- ObserveEvents_TimeSeries(
    input, output, session,  
    inputs_MVSRV_OE_TS = inputs_MVSRV_OE_RUI,
    reactiveInputs_MVSRV_OE_TS = theReactiveUserInputs)
  
  return(theReactiveUserInputs)
}


ObserveEvents_InvestorInfo <- function(
## the first three arguments of the function have to be input, output and session
    input, output, session,  
## the regular function arguments
    inputs_MVSRV_OE_II,
    reactiveInputs_MVSRV_OE_II)
{
  nameFunctionForMessage <- "Mod_Viz_Svr_ReactiveVars$ObserveEvents_InvestorInfo() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  theReactiveUserInputs <- reactiveInputs_MVSRV_OE_II
  theInputs <- inputs_MVSRV_OE_II
  
  shiny::observeEvent(
    
    eventExpr = theInputs$inputID_investorName, 
    
    handlerExpr = {
      theReactiveUserInputs[["InvestorName"]] <- theInputs$inputID_investorName
    })
  
  shiny::observeEvent(
    
    eventExpr = theInputs$inputID_investorDateOfBirth,
    
    handlerExpr = {
      theReactiveUserInputs[["InvestorDateOfBirth"]] <- theInputs$inputID_investorDateOfBirth
    })
  
  shiny::observeEvent(
    
    eventExpr = theInputs$inputID_investorLifeExpectancy,
    
    handlerExpr = {
      theReactiveUserInputs[["InvestorLifeExpectancy"]] <- theInputs$inputID_investorLifeExpectancy
    })
  
  shiny::observeEvent(
    
    eventExpr = theInputs$inputID_investorRetirementAge, 
    
    handlerExpr = {
      theReactiveUserInputs[["InvestorRetirementAge"]] <- theInputs$inputID_investorRetirementAge
    })
  
  shiny::observeEvent(
    
    eventExpr = theInputs$inputID_investorRiskTolerance, 
    
    handlerExpr = {
      theReactiveUserInputs[["InvestorRiskTolerance"]] <- theInputs$inputID_investorRiskTolerance
    })
  
  shiny::observeEvent(
    
    eventExpr = theInputs$outputID_TabData_inputInvestorCashFlows, 
    
## NOTE: When values are given through a rhandsontable, same ID is used for both output and input
    handlerExpr = {
      theReactiveUserInputs[["InvestorCashFlows"]] <- 
        rhandsontable::hot_to_r(theInputs$outputID_TabData_inputInvestorCashFlows)
    })  
  
  return(theReactiveUserInputs)
}


ObserveEvents_TaxRates <- function(
## the first three arguments of the function have to be input, output and session
    input, output, session,  
## the regular function arguments
    inputs_MVSRV_OE_TR,
    reactiveInputs_MVSRV_OE_TR)
{
  nameFunctionForMessage <- "Mod_Viz_Svr_ReactiveVars$ObserveEvents_TaxRates() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  theReactiveUserInputs <- reactiveInputs_MVSRV_OE_TR
  theInputs <- inputs_MVSRV_OE_TR
  
  shiny::observeEvent(
    
    eventExpr = theInputs$inputID_federalTaxRate, 
    
    handlerExpr = {
      theReactiveUserInputs[["FederalTaxRate"]] <- theInputs$inputID_federalTaxRate
    })    
  
  shiny::observeEvent(
    
    eventExpr = theInputs$inputID_stateTaxRate, 
    
    handlerExpr = {
      theReactiveUserInputs[["StateTaxRate"]] <- theInputs$inputID_stateTaxRate
    })    
  
  shiny::observeEvent(
    
    eventExpr = theInputs$inputID_capitalGainsTaxRate, 
    
    handlerExpr = {
      theReactiveUserInputs[["CapitalGainsTaxRate"]] <- theInputs$inputID_capitalGainsTaxRate
    })    
  
  shiny::observeEvent(
    
    eventExpr = theInputs$inputID_dividendTaxRate, 
    
    handlerExpr = {
      theReactiveUserInputs[["DividendTaxRate"]] <- theInputs$inputID_dividendTaxRate
    })      
  
  return(theReactiveUserInputs)
}


ObserveEvents_TimeSeries <- function(
## the first three arguments of the function have to be input, output and session
    input, output, session,  
## the regular function arguments
    inputs_MVSRV_OE_TS,
    reactiveInputs_MVSRV_OE_TS)
{
  nameFunctionForMessage <- "Mod_Viz_Svr_ReactiveVars$ObserveEvents_TimeSeries() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  theReactiveUserInputs <- reactiveInputs_MVSRV_OE_TS
  shiny::observeEvent(
    
    eventExpr = inputs_MVSRV_OE_TS$inputID_TabAnalysisOne_SecondSubTab_SelectTimeSeries, 
    
    handlerExpr = {
      theReactiveUserInputs[["NameTimeSeries_TabAnalysisOne_SecondSubTab"]] <- inputs_MVSRV_OE_TS$inputID_TabAnalysisOne_SecondSubTab_SelectTimeSeries
    }) 
  
  return(theReactiveUserInputs)
}





ObserveEvents_ReactiveTriggers <- function(
## the first three arguments of the function have to be input, output and session
    input, output, session,  
## the regular function arguments
    inputs_MVSRV_OE_RT,
    reactiveTriggers_MVSRV_OE_RT)
{
  nameFunctionForMessage <- "Mod_Viz_Svr_ReactiveVars$ObserveEvents_ReactiveTriggers() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  theReactiveTriggers <- reactiveTriggers_MVSRV_OE_RT
  
  theReactiveTriggers <- ObserveEvents_ReactiveTriggers_TabSummary(
    input, output, session,  
    inputs_MVSRV_OE_RT_TS = inputs_MVSRV_OE_RT,
    reactiveTriggers_MVSRV_OE_RT_TS = reactiveTriggers_MVSRV_OE_RT)
  
  return(theReactiveTriggers)
}


ObserveEvents_ReactiveTriggers_TabSummary <- function(
## the first three arguments of the function have to be input, output and session
    input, output, session,  
## the regular function arguments
    inputs_MVSRV_OE_RT_TS,
    reactiveTriggers_MVSRV_OE_RT_TS)
{
  nameFunctionForMessage <- "Mod_Viz_Svr_ReactiveVars$ObserveEvents_ReactiveTriggers_TabSummary() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  theReactiveTriggers <- reactiveTriggers_MVSRV_OE_RT_TS
  theInputs <- inputs_MVSRV_OE_RT_TS
  
  shiny::observeEvent(
    
    eventExpr = theInputs$inputID_ActionButton_TabSummary_TotalValue, 
    
    handlerExpr = {
      theReactiveTriggers[["ActionButton_TabSummary_TotalValue"]] <- 
        theInputs$inputID_ActionButton_TabSummary_TotalValue
  })
  
  shiny::observeEvent(
    
    eventExpr = theInputs$inputID_ActionButton_TabSummary_DateLastReport, 
    
    handlerExpr = {
      theReactiveTriggers[["ActionButton_TabSummary_DateLastReport"]] <- 
        theInputs$inputID_ActionButton_TabSummary_DateLastReport
  })  
  
  return(theReactiveTriggers)
}


ObserveEvents_ReactiveInnerVariables <- function(
## the first three arguments of the function have to be input, output and session
    input, output, session,  
## the regular function arguments
    inputs_MVSRV_OE_RIV,
    reactiveVars_MVSRV_OE_RIV)
{
  nameFunctionForMessage <- "Mod_Viz_Svr_ReactiveVars$ObserveEvents_ReactiveInnerVariables() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  theReactiveInnerVariables <- reactiveVars_MVSRV_OE_RIV
  
  theReactiveInnerVariables <- ObserveEvents_Temp(
    input, output, session,  
    inputs_MVSRV_OE_T = inputs_MVSRV_OE_RIV,
    reactiveVars_MVSRV_OE_T = reactiveVars_MVSRV_OE_RIV)
  
  return(theReactiveInnerVariables)
}


## Just a placeholder for now
ObserveEvents_Temp <- function(
## the first three arguments of the function have to be input, output and session
    input, output, session,  
## the regular function arguments
    inputs_MVSRV_OE_T,
    reactiveVars_MVSRV_OE_T)
{
  nameFunctionForMessage <- "Mod_Viz_Svr_ReactiveVars$ObserveEvents_Temp() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  theReactiveInnerVars <- reactiveVars_MVSRV_OE_T

  currentTotalValue <- shiny::isolate(expr = theReactiveInnerVars[["TotalValue"]])
  updatedTotalValue <- 1.10 * currentTotalValue
  theReactiveInnerVars[["TotalValue"]] <- updatedTotalValue
  
  return(theReactiveInnerVars)
}


})
