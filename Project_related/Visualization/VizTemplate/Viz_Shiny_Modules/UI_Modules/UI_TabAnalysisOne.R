


Mod_Viz_UI_TabAnalysisOne <- modules::module(
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
    data_MVUITA1_DC,
    funcs_MVUITA1_DC)
{
  nameFunctionForMessage <- "Mod_Viz_UI_TabAnalysisOne$DisplayContent() "    
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
      list(menu = "First SubTab AnalysisOne", 
           content = DisplayContent_FirstSubTab(
             data_MVUITA1_DC_ST1 = data_MVUITA1_DC,
             funcs_MVUITA1_DC_ST1 = funcs_MVUITA1_DC)),
      
      list(menu = "Second SubTab AnalysisOne", 
           content = DisplayContent_SecondSubTab(
             data_MVUITA1_DC_ST2 = data_MVUITA1_DC,
             funcs_MVUITA1_DC_ST2 = funcs_MVUITA1_DC)),
      
      list(menu = "Third SubTab AnalysisOne", 
           content = DisplayContent_ThirdSubTab(
             data_MVUITA1_DC_ST3 = data_MVUITA1_DC,
             funcs_MVUITA1_DC_ST3 = funcs_MVUITA1_DC)),
      
      list(menu = "Fourth SubTab AnalysisOne", 
           content = DisplayContent_FourthSubTab(
             data_MVUITA1_DC_ST4 = data_MVUITA1_DC,
             funcs_MVUITA1_DC_ST4 = funcs_MVUITA1_DC))
    )
  )
  
  return(theUI)
}


DisplayContent_FirstSubTab <- function(
    data_MVUITA1_DC_ST1,
    funcs_MVUITA1_DC_ST1)
{
  nameFunctionForMessage <- "Mod_Viz_UI_TabAnalysisOne$DisplayContent_FirstSubTab() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  theUI <- shiny::tabPanel(
    
    FirstSubTab_SelectInput_TypeCar(
      data_MVUITA1_ST1_SI_TC = data_MVUITA1_DC_ST1,
      funcs_MVUITA1_ST1_SI_TC = funcs_MVUITA1_DC_ST1),
    
    shiny::br(),
    
    semantic.dashboard::box(
      
      width = 8,
      title = "Graphics1 Tab1 AnalysisOne",
      color = "green", 
      ribbon = TRUE, 
      title_side = "top right",
      
      shiny::plotOutput(outputId = "outputID_TabAnalysisOne_boxplotOne")),
    
    semantic.dashboard::box(
      
      width = 8,
      title = "Graphics2 Tab1 AnalysisOne",
      color = "blue", 
      ribbon = TRUE, 
      title_side = "top right")
  )
  
  return(theUI)
}


DisplayContent_SecondSubTab <- function(
    data_MVUITA1_DC_ST2,
    funcs_MVUITA1_DC_ST2)
{
  nameFunctionForMessage <- "Mod_Viz_UI_TabAnalysisOne$DisplayContent_SecondSubTab() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  theUI <- shiny::div(
    
    shiny::div(
      
      class = 'ui large steps', 
      style = 'width: calc(100%); margin: 0px;',
      
      shiny::a(
        class = 'step', 
        id = "ID_TabAnalysisOne_SecondSubTab",
        
        shiny.semantic::uiicon('pie chart'),
        
        shiny::div(
          class = 'content',
          
          shiny::div(
            class = 'title', 
            'Inputs for second subtab AnalysisOne'),
          
          shiny::div(
            class = 'description',
            'Description of the inputs for second subtab AnalysisOne'))),
      
      SecondSubTab_SelectInput_TimeSeries(
        data_MVUITA1_ST2_SI_TS = data_MVUITA1_DC_ST2,
        funcs_MVUITA1_ST2_SI_TS = funcs_MVUITA1_DC_ST2),
      
      shiny::br()),
    
    shiny::div(
      semantic.dashboard::box(
        
        width = 8,
        title = "Graphics Time Series",
        color = "green", 
        ribbon = TRUE, 
        title_side = "top right",
        
        plotly::plotlyOutput(outputId = "outputID_TabAnalysisOne_PlotTimeSeries"))
    )
  )
  
  return(theUI)
}


DisplayContent_ThirdSubTab <- function(
    data_MVUITA1_DC_ST3,
    funcs_MVUITA1_DC_ST3)
{
  nameFunctionForMessage <- "Mod_Viz_UI_TabAnalysisOne$DisplayContent_ThirdSubTab() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  theUI <- shiny::div(
    
    class = 'ui large steps', 
    style = 'width: calc(100%); margin: 0px;',
    
    shiny::a(
      class = 'step', 
      id = "ID_TabAnalysisOne_ThirdSubTab",
      
      shiny.semantic::uiicon('bar chart'),
      
      shiny::div(
        class = 'content',
        
        shiny::div(
          class = 'title', 
          'Inputs for third subtab AnalysisOne'),
        
        shiny::div(
          class = 'description',
          'Description of the inputs for third subtab AnalysisOne')))
  )
  
  return(theUI)
}


DisplayContent_FourthSubTab <- function(
    data_MVUITA1_DC_ST4,
    funcs_MVUITA1_DC_ST4)
{
  nameFunctionForMessage <- "Mod_Viz_UI_TabAnalysisOne$DisplayContent_FourthSubTab() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  theUI <- shiny::div(
    
    class = 'ui large steps', 
    style = 'width: calc(100%); margin: 0px;',
    
    shiny::a(
      class = 'step', 
      id = "ID_TabAnalysisOne_FourthSubTab",
      
      shiny.semantic::uiicon('edit'),
      
      shiny::div(
        class = 'content',
        
        shiny::div(
          class = 'title', 
          'Inputs for fourth subtab AnalysisOne'),
        
        shiny::div(
          class = 'description',
          'Description of the inputs for fourth subtab')))
  )
  
  return(theUI)
}


FirstSubTab_SelectInput_TypeCar <- function(
    data_MVUITA1_ST1_SI_TC,
    funcs_MVUITA1_ST1_SI_TC)
{
  nameFunctionForMessage <- "Mod_Viz_UI_TabAnalysisOne$FirstSubTab_SelectInput_TypeCar() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  theUI <- shiny::selectInput(
    inputId = 'inputID_TabAnalysisOne_FirstSubTab_SelectTypeCar', 
    label = 'Select type of car',
    multiple = TRUE,
    choices = c("Ford", "Toyota", "Maserati", "BMW"),
    selected = c('Ford', 'Maserati'))  
  
  return(theUI)
}


SecondSubTab_SelectInput_TimeSeries <- function(
    data_MVUITA1_ST2_SI_TS,
    funcs_MVUITA1_ST2_SI_TS)
{
  nameFunctionForMessage <- "Mod_Viz_UI_TabAnalysisOne$SecondSubTab_SelectInput_TimeSeries() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  theUI <- shiny::selectInput(
    inputId = 'inputID_TabAnalysisOne_SecondSubTab_SelectTimeSeries', 
    label = 'Select time series',
    multiple = FALSE,
    choices = data_MVUITA1_ST2_SI_TS[["NamesTimeSeries"]],
    selected = c("Series_2"))  
  
  return(theUI)
}


})
