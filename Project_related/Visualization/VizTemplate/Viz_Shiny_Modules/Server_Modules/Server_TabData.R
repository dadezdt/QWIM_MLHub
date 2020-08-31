
Mod_Viz_Server_TabData <- modules::module(
{

## packages that need to be explicitly imported within this module 
#    modules::import(from = "dplyr")  ## needed for %>%


## define local piping operator, to avoid loading dplyr package
    `%>%` <- dplyr::`%>%`


## local files or functions that have to be imported explicitly
#   nameForLocalUsage <- modules::use(module = "SomeName")  
    pathFile <- base::file.path('UI_Modules','UI_TabData.R')
    Mod_UI_TDa <- modules::use(module = pathFile)

## functions exported from this module
    modules::export("RenderContent")


RenderContent <- function(
## the first three arguments of the function have to be input, output and session
    input, output, session,  
## the regular function arguments
    data_MVSTD_RC,
    funcs_MVSTD_RC,
    reactiveInputs_MVSTD_RC, 
    reactiveVars_MVSTD_RC,
    reactiveTriggers_MVSTD_RC,
    output_MVSTD_RC)
{
  nameFunctionForMessage <- "Mod_Viz_Server_TabData$RenderContent() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  theOutputIDs <- output_MVSTD_RC
  
  theOutputIDs <- shiny::callModule(
      module = RenderContent_InvestorInfo,
      id = "ID_Mod_Viz_Server_TabData_RenderContent_InvestorInfo",
      data_MVSRV_RC_II = data_MVSTD_RC,
      funcs_MVSTD_RC_II = funcs_MVSTD_RC,
      outputIDs_MVSRV_RC_II = theOutputIDs)
  
  theOutputIDs$outputID_TabData_SampleInputInvestorCashFlows <- rhandsontable::renderRHandsontable({
    theOutput <- shiny::callModule(
      module = Mod_UI_TDa$Mod_Viz_UI_TabData$DisplaySampleInvestorCashFlows,
      id = "ID_Mod_Viz_UI_TabData_DisplaySampleInvestorCashFlows",
      data_MVUITD_DSICF = data_MVSTD_RC,
      funcs_MVUITD_DSICF = funcs_MVSTD_RC,
      reactiveInputs_MVUITD_DSICF = reactiveInputs_MVSTD_RC) 
  })  
  
  return(theOutputIDs)
}


RenderContent_InvestorInfo <- function(
## the first three arguments of the function have to be input, output and session
    input, output, session,  
## the regular function arguments
    data_MVSRV_RC_II,
    funcs_MVSTD_RC_II,
    outputIDs_MVSRV_RC_II)
{
  nameFunctionForMessage <- "Mod_Viz_Svr_ReactiveVars$RenderContent_InvestorInfo() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  theOutputIDs <- outputIDs_MVSRV_RC_II
  theOutputIDs$outputID_inputInvestorName <- shiny::renderUI({
    theOutput <- shiny::callModule(
      module = Mod_UI_TDa$Mod_Viz_UI_TabData$SetInvestorName,
      id = "ID_Mod_Viz_UI_TabData_SetInvestorName",
      initialValue_MVUITD_SIN = 
        data_MVSRV_RC_II[["DefaultInputs"]][["Investor"]][["Name"]])
  })
  
  theOutputIDs$outputID_inputInvestorDateOfBirth <- shiny::renderUI({
    theOutput <- shiny::callModule(
      module = Mod_UI_TDa$Mod_Viz_UI_TabData$SetInvestorDateOfBirth,
      id = "ID_Mod_Viz_UI_TabData_SetInvestorDateOfBirth",
      dateOfBirth_MVUITD_SIDOB = 
        data_MVSRV_RC_II[["DefaultInputs"]][["Investor"]][["DateOfBirth"]])
  })
  
  theOutputIDs$outputID_inputInvestorLifeExpectancy <- shiny::renderUI({
    theOutput <- shiny::callModule(
      module = Mod_UI_TDa$Mod_Viz_UI_TabData$SetInvestorLifeExpectancy,
      id = "ID_Mod_Viz_UI_TabData_SetInvestorLifeExpectancy",
      lifeExpectancy_MVUITD_SILE = 
        data_MVSRV_RC_II[["DefaultInputs"]][["Investor"]][["LifeExpectancy"]]) 
  })
  
  theOutputIDs$outputID_inputInvestorRetirementAge <- shiny::renderUI({
    theOutput <- shiny::callModule(
      module = Mod_UI_TDa$Mod_Viz_UI_TabData$SetInvestorRetirementAge,
      id = "ID_Mod_Viz_UI_TabData_SetInvestorRetirementAge",
      retirementAge_MVUITD_SIRA =
        data_MVSRV_RC_II[["DefaultInputs"]][["Investor"]][["RetirementAge"]])  
  })
  
  return(theOutputIDs)
}


RenderContent_TaxRates <- function(
## the first three arguments of the function have to be input, output and session
    input, output, session,  
## the regular function arguments
    data_MVSRV_RC_TR,
    outputIDs_MVSRV_RC_TR)
{
  nameFunctionForMessage <- "Mod_Viz_Svr_ReactiveVars$RenderContent_TaxRates() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  theOutputIDs <- outputIDs_MVSRV_RC_TR
  theOutputIDs$outputID_inputFederalTaxRate <- shiny::renderUI({
    theOutput <- shiny::callModule(
      module = Mod_UI_TDa$Mod_Viz_UI_TabData$SetFederalTaxRate,
      id = "ID_Mod_Viz_UI_TabData_SetFederalTaxRate",
      taxRate_MVUITD_SFTR = 
        data_MVSRV_RC_TR[["DefaultInputs"]][["TaxRates_Individual"]][["FederalTaxRate"]]) 
  })
  
  theOutputIDs$outputID_inputStateTaxRate <- shiny::renderUI({
    theOutput <- shiny::callModule(
      module = Mod_UI_TDa$Mod_Viz_UI_TabData$SetStateTaxRate,
      id = "ID_Mod_Viz_UI_TabData_SetStateTaxRate",
      taxRate_MVUITD_SSTR = 
        data_MVSRV_RC_TR[["DefaultInputs"]][["TaxRates_Individual"]][["StateTaxRate"]])
  })
  
  theOutputIDs$outputID_inputCapitalGainsTaxRate <- shiny::renderUI({
    theOutput <- shiny::callModule(
      module = Mod_UI_TDa$Mod_Viz_UI_TabData$SetCapitalGainsTaxRate,
      id = "ID_Mod_Viz_UI_TabData_SetCapitalGainsTaxRate",
      taxRate_MVUITD_SCGTR = 
        data_MVSRV_RC_TR[["DefaultInputs"]][["TaxRates_Individual"]][["CapitalGainsTaxRate"]])
  })
  
  theOutputIDs$outputID_inputDividendTaxRate <- shiny::renderUI({
    theOutput <- shiny::callModule(
      module = Mod_UI_TDa$Mod_Viz_UI_TabData$SetDividendTaxRate,
      id = "ID_Mod_Viz_UI_TabData_SetDividendTaxRate",
      taxRate_MVUITD_SDTR = 
        data_MVSRV_RC_TR[["DefaultInputs"]][["TaxRates_Individual"]][["DividendTaxRate"]])
  })
  
  return(theOutputIDs)
}


})
