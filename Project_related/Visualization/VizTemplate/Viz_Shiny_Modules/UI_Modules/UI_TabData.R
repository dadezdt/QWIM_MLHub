


Mod_Viz_UI_TabData <- modules::module(
{

## packages that need to be explicitly imported within this module 
#    modules::import(from = "dplyr")  ## needed for %>%


## define local piping operator, to avoid loading dplyr package
    `%>%` <- dplyr::`%>%`


## local files or functions that have to be imported explicitly
#   nameForLocalUsage <- modules::use(module = "SomeName")  


## functions exported from this module
    modules::export("DisplayContent")
    modules::export("DisplaySampleInvestorInfo")
    modules::export("DisplaySampleInvestorCashFlows")
    
    modules::export("SetInvestorName")
    modules::export("SetInvestorRiskTolerance")
    modules::export("SetInvestorDateOfBirth")
    modules::export("SetInvestorLifeExpectancy")
    modules::export("SetInvestorRetirementAge")
    modules::export("SetFederalTaxRate")
    modules::export("SetStateTaxRate")
    modules::export("SetCapitalGainsTaxRate")
    modules::export("SetDividendTaxRate")
    

DisplayContent <- function(
    data_MVUITD_DC,
    funcs_MVUITD_DC)
{
  nameFunctionForMessage <- "Mod_Viz_UI_TabData$DisplayContent() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  theUI <- shiny::fluidRow(
    
    semantic.dashboard::box(
      
      width = 5,
      title = "Investor Info",
      color = "green", 
      ribbon = TRUE,
      title_side = "top right",
      
      semantic.dashboard::column(
        width = 4,
        shiny::uiOutput(outputId = "outputID_inputInvestorName"),
        shiny::uiOutput(outputId = "outputID_inputInvestorDateOfBirth"),
        shiny::uiOutput(outputId = "outputID_inputInvestorLifeExpectancy"),
        shiny::uiOutput(outputId = "outputID_inputInvestorRetirementAge")
      )),
    
    semantic.dashboard::box(
      
      width = 10,
      title = "Investor CashFlows",
      color = "green", 
      ribbon = TRUE,
      title_side = "top right",
      semantic.dashboard::column(
        width = 10,
        rhandsontable::rHandsontableOutput(outputId = "outputID_TabData_SampleInputInvestorCashFlows"))),
    
    semantic.dashboard::box(
      
      width = 10,
      title = "Investor Goals",
      color = "green", 
      ribbon = TRUE,
      title_side = "top right")
    
  )
  
  return(theUI)
}


SetInvestorName <- function(
## the first three arguments of the function have to be input, output and session
    input, output, session,  
## the regular function arguments
    initialValue_MVUITD_SIN)
{
  nameFunctionForMessage <- "Mod_Viz_UI_TabData$SetInvestorName() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  theOutput <-  shiny::div(
    style = "white-space: nowrap;",
    shiny::textInput(
      inputId = "inputID_investorName", 
      label = shiny::h5("Name"),
      value = initialValue_MVUITD_SIN))
  
  return(theOutput)
}


SetInvestorRiskTolerance <- function(
## the first three arguments of the function have to be input, output and session
    input, output, session,  
## the regular function arguments
    initialSelection_MVUITD_SIRT)
{
  nameFunctionForMessage <- "Mod_Viz_UI_TabData$SetInvestorRiskTolerance() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  theOutput <-  shiny::div(
    style = "white-space: nowrap;",
    shiny::selectInput(
      inputId = "inputID_investorRiskTolerance", 
      label = shiny::h5("Risk Tolerance"),
      choices = c("Conservative","Moderate","Aggressive"),
      selected = initialSelection_MVUITD_SIRT,
      width = "100px"))
  
  return(theOutput)
}


SetInvestorDateOfBirth <- function(
## the first three arguments of the function have to be input, output and session
    input, output, session,  
## the regular function arguments
    dateOfBirth_MVUITD_SIDOB)
{
  nameFunctionForMessage <- "Mod_Viz_UI_TabData$SetInvestorDateOfBirth() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  theOutput <-  shiny::div(
    style = "white-space: nowrap;",
    shiny::dateInput(
      inputId = "inputID_investorDateOfBirth", 
      label = shiny::h5("Date of Birth"),
      value = dateOfBirth_MVUITD_SIDOB))
  
  return(theOutput)
}


SetInvestorLifeExpectancy <- function(
## the first three arguments of the function have to be input, output and session
    input, output, session,  
## the regular function arguments
    lifeExpectancy_MVUITD_SILE)
{
  nameFunctionForMessage <- "Mod_Viz_UI_TabData$SetInvestorLifeExpectancy() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  theOutput <-  shiny::div(
    style = "white-space: nowrap;",
    shiny::numericInput(
      inputId = "inputID_investorLifeExpectancy", 
      label = shiny::h5("Life Expectancy"),
      value = lifeExpectancy_MVUITD_SILE,
      width = "40px"))
  
  return(theOutput)
}


SetInvestorRetirementAge <- function(
## the first three arguments of the function have to be input, output and session
    input, output, session,  
## the regular function arguments
    retirementAge_MVUITD_SIRA)
{
  nameFunctionForMessage <- "Mod_Viz_UI_TabData$SetInvestorLifeExpectancy() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  theOutput <-  shiny::div(
    style = "white-space: nowrap;",
    shiny::numericInput(
      inputId = "inputID_investorRetirementAge", 
      label = shiny::h5("Retirement Age"),
      value = retirementAge_MVUITD_SIRA,
      width = "40px"))
  
  return(theOutput)
}


SetFederalTaxRate <- function(
## the first three arguments of the function have to be input, output and session
    input, output, session,  
## the regular function arguments
    taxRate_MVUITD_SFTR)
{
  nameFunctionForMessage <- "Mod_Viz_UI_TabData$SetFederalTaxRate() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  theOutput <-  shiny::div(
    style = "white-space: nowrap;",
    shiny::numericInput(
      inputId = "inputID_federalTaxRate", 
      label = shiny::h5("Federal Tax Rate"),
      value = taxRate_MVUITD_SFTR,
      width = "40px"))
  
  return(theOutput)
}


SetStateTaxRate <- function(
## the first three arguments of the function have to be input, output and session
    input, output, session,  
## the regular function arguments
    taxRate_MVUITD_SSTR)
{
  nameFunctionForMessage <- "Mod_Viz_UI_TabData$SetStateTaxRate() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  theOutput <-  shiny::div(
    style = "white-space: nowrap;",
    shiny::numericInput(
      inputId = "inputID_stateTaxRate", 
      label = shiny::h5("State Tax Rate"),
      value = taxRate_MVUITD_SSTR,
      width = "40px"))
  
  return(theOutput)
}


SetCapitalGainsTaxRate <- function(
## the first three arguments of the function have to be input, output and session
    input, output, session,  
## the regular function arguments
    taxRate_MVUITD_SCGTR)
{
  nameFunctionForMessage <- "Mod_Viz_UI_TabData$SetCapitalGainsTaxRate() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  theOutput <-  shiny::div(
    style = "white-space: nowrap;",
    shiny::numericInput(
      inputId = "inputID_capitalGainsTaxRate", 
      label = shiny::h5("Capital Gains Tax Rate"), 
      value = taxRate_MVUITD_SCGTR,
      width = "40px"))
  
  return(theOutput)
}


SetDividendTaxRate <- function(
## the first three arguments of the function have to be input, output and session
    input, output, session,  
## the regular function arguments
    taxRate_MVUITD_SDTR)
{
  nameFunctionForMessage <- "Mod_Viz_UI_TabData$SetDividendTaxRate() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  theOutput <-  shiny::div(
    style = "white-space: nowrap;",
    shiny::numericInput(
      inputId = "inputID_dividendTaxRate", 
      label = shiny::h5("Dividend Tax Rate"), 
      value = taxRate_MVUITD_SDTR,
      width = "40px"))
  
  return(theOutput)
}


DisplayUserInputs_InvestorProfile <- function(
## the first three arguments of the function have to be input, output and session
    input, output, session,  
## the regular function arguments
    data_MVUITD_DUI_IP)
{
  nameFunctionForMessage <- "Mod_Viz_Server_TabData$DisplayUserInputs_InvestorProfile() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  theOutput <- shiny::fluidRow(
    
    shiny::h4(
      "Investor Profile", 
      style = 'margin-left: 15px')
    
    # shiny::uiOutput(outputId = "outputID_inputInvestorName"),
    # shiny::uiOutput(outputId = "outputID_inputInvestorDateOfBirth"),
    # shiny::uiOutput(outputId = "outputID_inputInvestorLifeExpectancy"),
    # shiny::uiOutput(outputId = "outputID_inputInvestorRetirementAge")
  )
  
  return(theOutput)
}


DisplayUserInputs_TaxRates <- function(
## the first three arguments of the function have to be input, output and session
    input, output, session,  
## the regular function arguments
    data_MVUITD_DUI_TR)
{
  nameFunctionForMessage <- "Mod_Viz_Server_TabData$DisplayUserInputs_TaxRates() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  theOutput <- shiny::fluidRow(
    
    shiny::h4(
      "Tax Rates", 
      style = 'margin-left: 15px'),
    
    shiny::uiOutput(outputId = "outputID_inputFederalTaxRate"),
    shiny::uiOutput(outputId = "outputID_inputStateTaxRate"),
    shiny::uiOutput(outputId = "outputID_inputCapitalGainsTaxRate"),
    shiny::uiOutput(outputId = "outputID_inputDividendTaxRate"))
  
  return(theOutput)
}


DisplayInvestorInfo <- function(
## the first three arguments of the function have to be input, output and session
    input, output, session,
## the regular function arguments
    data_MVUITD_DII,
    funcs_MVUITD_DII)
{
  nameFunctionForMessage <- "Mod_Viz_Server_TabData$DisplayInvestorInfo() "
  reportr::setOutputLevel(reportr::OL$Error)
  
  theOutput <- shiny::tagList(
    
    shiny::h3(
      'Investor Type',
      style = 'color: white; font-weight: normal;padding: 15px 15px 10px 15px; margin: 0;'),
    
    DisplayUserInputs_InvestorType(
      input, output, session,
      data_MVUITD_DUI_IT = data_MVUITD_DII),
    
    shiny::br(style = 'border-top:4px solid #000000; line-height: 20px'),
    
    DisplayUserInputs_InvestorProfile(
      input, output, session,
      data_MVUITD_DUI_IP = data_MVUITD_DII),
    
    shiny::br(style = 'line-height: 20px'),
    
    DisplayUserInputs_TaxRates(
      input, output, session,
      data_MVUITD_DUI_TR = data_MVUITD_DII),
    
    shiny::br(style = 'line-height: 20px'))  
  
  return(theOutput)
}


DisplayInvestorCashFlows <- function(
## the first three arguments of the function have to be input, output and session
    input, output, session,
## the regular function arguments
    data_MVUITD_DICF,
    funcs_MVUITD_DICF,
    reactiveInputs_MVUITD_DICF)
{
  nameFunctionForMessage <- "Mod_Viz_Server_TabData$DisplayInvestorCashFlows() "
  reportr::setOutputLevel(reportr::OL$Error)
  
  theOutput <- rhandsontable::rhandsontable(
    data = shiny::isolate(expr = reactiveInputs_MVUITD_DICF[["InvestorCashFlows"]]), 
    width = 800) 
  #      height = 300) 
  
  return(theOutput)
}


DisplaySampleInvestorInfo <- function(
## the first three arguments of the function have to be input, output and session
    input, output, session,
## the regular function arguments
    data_MVUITD_DSII,
    funcs_MVUITD_DSII)
{
  nameFunctionForMessage <- "Mod_Viz_Server_TabData$DisplaySampleInvestorInfo() "
  reportr::setOutputLevel(reportr::OL$Error)
  
  theOutput <- shiny::tagList(
    
    shiny::br(style = 'border-top:4px solid #000000; line-height: 20px'),
    
    DisplayUserInputs_InvestorProfile(
      input, output, session,
      data_MVUITD_DUI_IP = data_MVUITD_DSII),
    
    shiny::br(style = 'line-height: 20px'))  
  
  return(theOutput)
}


DisplaySampleInvestorCashFlows <- function(
## the first three arguments of the function have to be input, output and session
    input, output, session,
## the regular function arguments
    data_MVUITD_DSICF,
    funcs_MVUITD_DSICF,
    reactiveInputs_MVUITD_DSICF)
{
  nameFunctionForMessage <- "Mod_Viz_Server_TabData$DisplaySampleInvestorCashFlows() "
  reportr::setOutputLevel(reportr::OL$Error)
  
  theCashFlows <- shiny::isolate(expr = reactiveInputs_MVUITD_DSICF[["InvestorCashFlows"]])
  theSampleData <- theCashFlows[1:3,]
  theOutput <- rhandsontable::rhandsontable(
    data = theSampleData, 
    width = 800) 
  #      height = 300) 
  
  return(theOutput)
}


DisplayUserInputs_InvestorType <- function(
## the first three arguments of the function have to be input, output and session
    input, output, session,  
## the regular function arguments
    data_MVUITD_DUI_IT)
{
  nameFunctionForMessage <- "Mod_Viz_UI_TabData$DisplayUserInputs_InvestorType() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  theOutput <- shiny::fluidRow(
    
    shiny::radioButtons(
      inputId = "inputID_investorType", 
      label = NULL,
      choices = list('Individual', 'Foundation/Endowment'), 
      selected = 'Individual'))
  
  return(theOutput)
}


})
