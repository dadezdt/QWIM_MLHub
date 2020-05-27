


Mod_Viz_UI_TabAnalysisThree <- modules::module(
{

## packages that need to be explicitly imported within this module 
#    modules::import(from = "dplyr")  ## needed for %>%


## define local piping operator, to avoid loading dplyr package
    `%>%` <- dplyr::`%>%`


## local files or functions that have to be imported explicitly
#   nameForLocalUsage <- modules::use(module = "SomeName")  


## functions exported from this module
    modules::export("DisplayContent")


DisplayContent <- function(
    data_MVUITA3_DC,
    funcs_MVUITA3_DC)
{
  nameFunctionForMessage <- "Mod_Viz_UI_TabAnalysisThree$DisplayContent() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  theUI <-  shiny::fluidRow(
    
    semantic.dashboard::box(
      
      width = 16,
      title = "Graphics1 Tab3 AnalysisThree",
      color = "grey", 
      ribbon = TRUE, 
      title_side = "top right",
      
      shiny::h4(
        class = "ui horizontal divider header",
        style = 'margin: 15px 0 10px 0;',
        shiny.semantic::uiicon('bar chart'),
        'Investor CashFlows'),   
      
      shiny::div(
        class = 'ui stackable grid',
        
        shiny::div(
          class = 'containerContent',
          rhandsontable::rHandsontableOutput(outputId = "outputID_TabAnalysisThree_InvestorCashFlows"),
          style = base::paste0('padding: 0px;')))
    )
    
  )
  
  return(theUI)
}


})
