


Mod_Viz_UI_TabResultsOne <- modules::module(
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
    data_MVUITR1_DC,
    funcs_MVUITR1_DC)
{
  nameFunctionForMessage <- "Mod_Viz_UI_TabResultsOne$DisplayContent() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  theUI <- semantic.dashboard::tabBox(
    title = " ", 
    color = "blue", 
    width = 16,
    collapsible = FALSE, 
    ribbon = FALSE,
    title_side = "top",
    shiny::h4(""),
    
    tabs = list(
      list(menu = "First SubTab ResultsOne", 
           content = DisplayContent_FirstSubTab(
             data_MVUITR1_DC_ST1 = data_MVUITR1_DC,
             funcs_MVUITR1_DC_ST1 = funcs_MVUITR1_DC)),
      
      list(menu = "Second SubTab ResultsOne", 
           content = DisplayContent_SecondSubTab(
             data_MVUITR1_DC_ST2 = data_MVUITR1_DC,
             funcs_MVUITR1_DC_ST2 = funcs_MVUITR1_DC)),
      
      list(menu = "Third SubTab ResultsOne", 
           content = DisplayContent_ThirdSubTab(
             data_MVUITR1_DC_ST3 = data_MVUITR1_DC,
             funcs_MVUITR1_DC_ST3 = funcs_MVUITR1_DC)),
      
      list(menu = "Fourth SubTab ResultsOne", 
           content = DisplayContent_FourthSubTab(
             data_MVUITR1_DC_ST4 = data_MVUITR1_DC,
             funcs_MVUITR1_DC_ST4 = funcs_MVUITR1_DC))
    )
  )
  
  return(theUI)
}


DisplayContent_FirstSubTab <- function(
    data_MVUITR1_DC_ST1,
    funcs_MVUITR1_DC_ST1)
{
  nameFunctionForMessage <- "Mod_Viz_UI_TabResultsOne$DisplayContent_FirstSubTab() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  theUI <- shiny::tabPanel(
    
    shiny::br(),
    
    semantic.dashboard::box(
      
      width = 8,
      title = "Graphics1 TabResults1",
      color = "green", 
      ribbon = TRUE, 
      title_side = "top right",
      
#      shiny::plotOutput(outputId = "outputID_TabResultsOne_boxplotOne")
    ),
    
    semantic.dashboard::box(
      
      width = 8,
      title = "Graphics2 TabResults1",
      color = "blue", 
      ribbon = TRUE, 
      title_side = "top right")
  )
  
  return(theUI)
}


DisplayContent_SecondSubTab <- function(
    data_MVUITR1_DC_ST2,
    funcs_MVUITR1_DC_ST2)
{
  nameFunctionForMessage <- "Mod_Viz_UI_TabResultsOne$DisplayContent_SecondSubTab() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  theUI <- shiny::div(
    
    shiny::div(
      
      class = 'ui large steps', 
      style = 'width: calc(100%); margin: 0px;',
      
      shiny::a(
        class = 'step', 
        id = "ID_TabResultsOne_SecondSubTab",
        
        shiny.semantic::uiicon('pie chart'),
        
        shiny::div(
          class = 'content',
          
          shiny::div(
            class = 'title', 
            'Inputs for second subtab Results One'),
          
          shiny::div(
            class = 'description',
            'Description of the inputs for second subtab ResultsOne'))),
      
      shiny::br()),
    
    shiny::div(
      semantic.dashboard::box(
        
        width = 8,
        title = "Graphics Time Series",
        color = "green", 
        ribbon = TRUE, 
        title_side = "top right",
        
#        plotly::plotlyOutput(outputId = "outputID_TabResultsOne_PlotTimeSeries")
      )
    )
  )
  
  return(theUI)
}


DisplayContent_ThirdSubTab <- function(
    data_MVUITR1_DC_ST3,
    funcs_MVUITR1_DC_ST3)
{
  nameFunctionForMessage <- "Mod_Viz_UI_TabResultsOne$DisplayContent_ThirdSubTab() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  theUI <- shiny::div(
    
    class = 'ui large steps', 
    style = 'width: calc(100%); margin: 0px;',
    
    shiny::a(
      class = 'step', 
      id = "ID_TabResultsOne_ThirdSubTab",
      
      shiny.semantic::uiicon('bar chart'),
      
      shiny::div(
        class = 'content',
        
        shiny::div(
          class = 'title', 
          'Inputs for third subtab ResultsOne'),
        
        shiny::div(
          class = 'description',
          'Description of the inputs for third subtab ResultsOne')))
  )
  
  return(theUI)
}


DisplayContent_FourthSubTab <- function(
    data_MVUITR1_DC_ST4,
    funcs_MVUITR1_DC_ST4)
{
  nameFunctionForMessage <- "Mod_Viz_UI_TabResultsOne$DisplayContent_FourthSubTab() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  theUI <- shiny::div(
    
    class = 'ui large steps', 
    style = 'width: calc(100%); margin: 0px;',
    
    shiny::a(
      class = 'step', 
      id = "ID_TabResultsOne_FourthSubTab",
      
      shiny.semantic::uiicon('edit'),
      
      shiny::div(
        class = 'content',
        
        shiny::div(
          class = 'title', 
          'Inputs for fourth subtab ResultsOne'),
        
        shiny::div(
          class = 'description',
          'Description of the inputs for fourth subtab ResultsOne')))
  )
  
  return(theUI)
}




})
