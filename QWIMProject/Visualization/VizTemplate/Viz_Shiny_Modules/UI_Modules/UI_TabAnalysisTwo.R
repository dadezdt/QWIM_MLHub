


Mod_Viz_UI_TabAnalysisTwo <- modules::module(
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
    data_MVUITA2_DC,
    funcs_MVUITA2_DC)
{
  nameFunctionForMessage <- "Mod_Viz_UI_TabAnalysisTwo$DisplayContent() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  theUI <- shiny::fluidRow(
    
    semantic.dashboard::box(
      
      width = 9,
      title = "Graphics1 Tab2 AnalysisTwo",
      color = "violet", 
      ribbon = TRUE, 
      title_side = "top right",
      
      DT::dataTableOutput(outputId = "outputID_TabAnalysisTwo_DT")),
    
    semantic.dashboard::box(
      
      width = 7,
      title = "Graphics2 Tab2 AnalysisTwo",
      color = "red", 
      ribbon = TRUE,
      title_side = "top right",
      
      semantic.dashboard::column(
        width = 7,
        plotly::plotlyOutput(outputId = "outputID_TabAnalysisTwo_dotplotOne")))
  )
  
  return(theUI)
}


})
