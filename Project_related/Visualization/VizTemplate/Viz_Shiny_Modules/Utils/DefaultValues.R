

Mod_Viz_DefaultValues <- modules::module(
{

## packages that need to be explicitly imported within this module 
#    modules::import(from = "dplyr")  ## needed for %>%


## define local piping operator, such that we do not need to import explicitly dplyr package
    `%>%` <- dplyr::`%>%`  


## local files or functions that have to be imported explicitly
#   nameForLocalUsage <- modules::use(module = "SomeName")  


## functions exported from this module
    modules::export("SetValues_UserInputs")
    modules::export("SetValues_InnerVariables")


SetValues_UserInputs <- function(data_MVDV_SV_UI)
{
  nameFunctionForMessage <- "Mod_Viz_DefaultValues$SetValues_UserInputs() "    
  reportr::setOutputLevel(reportr::OL$Error)  
  
  defaultValues <- list()
  
  defaultInvestor <- list(
    Name = "Anne Smith",
    DateOfBirth = lubridate::as_date('1974-05-05'),
    LifeExpectancy = 90,
    RetirementAge = 64)
  
  defaultValues[["Investor"]] <- defaultInvestor
  
  defaultTaxRates <- list(
    FederalTaxRate = 0.35,
    StateTaxRate = 0.0,
    CapitalGainsTaxRate = 0.2,
    DividendTaxRate = 0.22)
  
  defaultValues[["TaxRates"]] <- defaultTaxRates
  
  defaultPortfolio <- list(
    StartDate = base::Sys.Date(),
    EndDate = lubridate::as_date('2044-05-05'),
    InitialValue = 120000)
  
  defaultValues[["Portfolio"]] <- defaultPortfolio
  
  default_investorCashFlows <- tibble::tibble(
    NameCashFlow = c("CashFlow_1","CashFlow_2","CashFlow_3","CashFlow_4","CashFlow_5","CashFlow_6"),
    Amount = c(10000,15000,-12000,7000,-9000,17000),
    StartDate = c(lubridate::as_date('2021-01-01'), lubridate::as_date('2023-01-01'), 
                  lubridate::as_date('2026-01-01'), lubridate::as_date('2029-01-01'),
                  lubridate::as_date('2033-01-01'), lubridate::as_date('2036-01-01')),
    EndDate = c(lubridate::as_date('2022-01-01'), lubridate::as_date('2024-01-01'), 
                lubridate::as_date('2027-01-01'), lubridate::as_date('2030-01-01'),
                lubridate::as_date('2034-01-01'), lubridate::as_date('2037-01-01')))
  
  defaultValues[["InvestorCashFlows"]] <- default_investorCashFlows
  
  default_investorGoals <- tibble::tibble(
    NameGoal = c("Goal_1","Goal_2","Goal_3","Goal_4"),
    Amount = c(100000,75000,40000,30000),
    StartDate = c(lubridate::as_date('2021-01-01'), lubridate::as_date('2023-01-01'), 
                  lubridate::as_date('2021-01-01'), lubridate::as_date('2027-01-01')),
    EndDate = c(lubridate::as_date('2024-01-01'), lubridate::as_date('2033-01-01'), 
                lubridate::as_date('2031-01-01'), lubridate::as_date('2047-01-01')))
  
  defaultValues[["InvestorGoals"]] <- default_investorGoals
  
  return(defaultValues)
}


SetValues_InnerVariables <- function(data_MVDV_SV_IV)
{
  nameFunctionForMessage <- "Mod_Viz_DefaultValues$SetValues_InnerVariables() "    
  reportr::setOutputLevel(reportr::OL$Error)  
  
  defaultValues <- list()

  defaultValues[["PortfolioValue"]] <- 254070
  defaultValues[["TotalValue"]] <- 387070
  defaultValues[["DateLastUpdate"]] <- lubridate::as_date('2020-02-02')
  defaultValues[["DateLastReport"]] <- lubridate::as_date('2021-02-10')
  
  return(defaultValues)
}


})
