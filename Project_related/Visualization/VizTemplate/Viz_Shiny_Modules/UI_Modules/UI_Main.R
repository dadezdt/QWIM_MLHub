

Mod_Viz_UI_Main <- modules::module(
{

## packages that need to be explicitly imported within this module 
#    modules::import(from = "dplyr")  ## needed for %>%


## define local piping operator, to avoid loading dplyr package
    `%>%` <- dplyr::`%>%`


## local files or functions that have to be imported explicitly
#   nameForLocalUsage <- modules::use(module = "SomeName")  
    pathFile <- base::file.path('UI_Modules','UI_TabSettings.R')
    Mod_UI_TSt <- modules::use(module = pathFile)  
    pathFile <- base::file.path('UI_Modules','UI_TabData.R')
    Mod_UI_TDa <- modules::use(module = pathFile)
    pathFile <- base::file.path('UI_Modules','UI_TabAnalysisOne.R')
    Mod_UI_TA1 <- modules::use(module = pathFile)
    pathFile <- base::file.path('UI_Modules','UI_TabAnalysisTwo.R')
    Mod_UI_TA2 <- modules::use(module = pathFile)  
    pathFile <- base::file.path('UI_Modules','UI_TabAnalysisThree.R')
    Mod_UI_TA3 <- modules::use(module = pathFile)
    pathFile <- base::file.path('UI_Modules','UI_TabResultsOne.R')
    Mod_UI_TR1 <- modules::use(module = pathFile)
    pathFile <- base::file.path('UI_Modules','UI_TabResultsTwo.R')
    Mod_UI_TR2 <- modules::use(module = pathFile)
    pathFile <- base::file.path('UI_Modules','UI_TabSummary.R')
    Mod_UI_TSm <- modules::use(module = pathFile)


## functions exported from this module
    modules::export("DisplayDashboardHeader")
    modules::export("DisplayDashboardSidebar")
    modules::export("DisplayDashboardBody")
    modules::export("SetTabIDs_SidebarMenu")


DisplayDashboardHeader <- function(
    data_MVUIM_DDH,
    funcs_MVUIM_DDH)
{
  nameFunctionForMessage <- "Mod_Viz_UI_Main$DisplayDashboardHeader() "    
  reportr::setOutputLevel(reportr::OL$Error)

  
  theUI <- semantic.dashboard::dashboardHeader(
    
    color = "blue",
    inverted = TRUE,
    
    DisplayDashboardHeader_Content(
      data_MVUIM_DDH_C = data_MVUIM_DDH,
      funcs_MVUIM_DDH_C = funcs_MVUIM_DDH)
  )
  
  return(theUI)
}  


DisplayDashboardHeader_Content <- function(
    data_MVUIM_DDH_C,
    funcs_MVUIM_DDH_C)
{
  nameFunctionForMessage <- "Mod_Viz_UI_Main$DisplayDashboardHeader() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  theUI <- shiny::titlePanel(
    
          title = shiny::div(
              "Viz Template",
              shiny::img(
                src = "LogoGraphite.png",
                style = "float:right;")
          )
        
    )
  
  return(theUI)
}  


DisplayDashboardSidebar <- function(
    data_MVUIM_DDS,
    funcs_MVUIM_DDS,
    tabIDs_MVUIM_DDS)
{
  nameFunctionForMessage <- "Mod_Viz_UI_Main$DisplayDashboardSidebar() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  theUI <- semantic.dashboard::dashboardSidebar(
    
    size = "thin", 
    color = "teal",
    
    DisplayDashboardSidebar_Content(
      data_MVUIM_DDS = data_MVUIM_DDS,
      funcs_MVUIM_DDS = funcs_MVUIM_DDS,
      tabIDs_MVUIM_DDS = tabIDs_MVUIM_DDS)
  )
  
  return(theUI)
}


DisplayDashboardSidebar_Content <- function(
    data_MVUIM_DDS_C,
    funcs_MVUIM_DDS_C,
    tabIDs_MVUIM_DDS_C)
{
  nameFunctionForMessage <- "Mod_Viz_UI_Main$DisplayDashboardSidebar_Content() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  theUI <- semantic.dashboard::sidebarMenu(
    
    DisplayDashboardSidebar_TabCategorySetup(
      data_MVUIM_DDS_TCS = data_MVUIM_DDS_C,
      funcs_MVUIM_DDS_TCS = funcs_MVUIM_DDS_C,
      tabIDs_MVUIM_DDS_TCS = tabIDs_MVUIM_DDS_C),
    
    DisplayDashboardSidebar_TabCategoryAnalysis(
      data_MVUIM_DDS_TCA = data_MVUIM_DDS_C,
      funcs_MVUIM_DDS_TCA = funcs_MVUIM_DDS_C,
      tabIDs_MVUIM_DDS_TCA = tabIDs_MVUIM_DDS_C),
    
    DisplayDashboardSidebar_TabCategoryResults(
      data_MVUIM_DDS_TCR = data_MVUIM_DDS_C,
      funcs_MVUIM_DDS_TCR = funcs_MVUIM_DDS_C,
      tabIDs_MVUIM_DDS_TCR = tabIDs_MVUIM_DDS_C)
    
  )
  
  return(theUI)
} 


DisplayDashboardSidebar_TabCategorySetup <- function(
    data_MVUIM_DDS_TCS,
    funcs_MVUIM_DDS_TCS,
    tabIDs_MVUIM_DDS_TCS)
{
  nameFunctionForMessage <- "Mod_Viz_UI_Main$DisplayDashboardSidebar_TabCategorySetup() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  thetabIDs <- tabIDs_MVUIM_DDS_TCS
  
  theUI <- semantic.dashboard::menuItem(
    
      tabName = thetabIDs[["ID_TabCategorySetup"]],
      text = "TheSetup", ## "Setup",
      icon = semantic.dashboard::icon(type = "sitemap"),
      
      semantic.dashboard::menuItem(
        tabName = thetabIDs[["ID_TabSettings"]],
        text = "Settings",
        icon = semantic.dashboard::icon(type = "sitemap")),
      
      semantic.dashboard::menuItem(
        tabName = thetabIDs[["ID_TabData"]], 
        text = "Data",
        icon = semantic.dashboard::icon(type = "tasks"))
  )
  
  return(theUI)
} 


DisplayDashboardSidebar_TabCategoryAnalysis <- function(
    data_MVUIM_DDS_TCA,
    funcs_MVUIM_DDS_TCA,
    tabIDs_MVUIM_DDS_TCA)
{
  nameFunctionForMessage <- "Mod_Viz_UI_Main$DisplayDashboardSidebar_TabCategoryAnalysis() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  thetabIDs <- tabIDs_MVUIM_DDS_TCA
  
  theUI <- semantic.dashboard::menuItem(
    
    tabName = thetabIDs[["ID_TabCategoryAnalysis"]],
    text = "Analysis",
    icon = semantic.dashboard::icon(type = "sitemap"),
    
    semantic.dashboard::menuItem(
      tabName = thetabIDs[["ID_TabAnalysisOne"]], 
      text = "AnalysisOne",
      icon = semantic.dashboard::icon(type = "object group outline")),
    
    semantic.dashboard::menuItem(
      tabName = thetabIDs[["ID_TabAnalysisTwo"]], 
      text = "AnalysisTwo",
      icon = semantic.dashboard::icon(type = "signal")),
    
    semantic.dashboard::menuItem(
      tabName = thetabIDs[["ID_TabAnalysisThree"]], 
      text = "AnalysisThree",
      icon = semantic.dashboard::icon(type = "database"))
  )
  
  return(theUI)
} 


DisplayDashboardSidebar_TabCategoryResults <- function(
    data_MVUIM_DDS_TCR,
    funcs_MVUIM_DDS_TCR,
    tabIDs_MVUIM_DDS_TCR)
{
  nameFunctionForMessage <- "Mod_Viz_UI_Main$DisplayDashboardSidebar_TabCategoryResults() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  thetabIDs <- tabIDs_MVUIM_DDS_TCR
  
  theUI <- semantic.dashboard::menuItem(
    
    tabName = thetabIDs[["ID_TabCategoryResults"]],
    text = "Results",
    icon = semantic.dashboard::icon(type = "sitemap"),
    
    semantic.dashboard::menuItem(
      tabName = thetabIDs[["ID_TabResultsOne"]], 
      text = "ResultsOne",
      icon = semantic.dashboard::icon(type = "object group outline")),
    
    semantic.dashboard::menuItem(
      tabName = thetabIDs[["ID_TabResultsTwo"]], 
      text = "ResultsTwo",
      icon = semantic.dashboard::icon(type = "signal")),
    
    semantic.dashboard::menuItem(
      tabName = thetabIDs[["ID_TabSummary"]], 
      text = "Summary",
      icon = semantic.dashboard::icon(type = "balance scale"))
  )

  return(theUI)
} 


DisplayDashboardBody <- function(
    data_MVUIM_DDB,
    funcs_MVUIM_DDB,
    tabIDs_MVUIM_DDB)
{
  nameFunctionForMessage <- "Mod_Viz_UI_Main$DisplayDashboardBody() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  theUI <- semantic.dashboard::dashboardBody(
    
## https://stackoverflow.com/questions/55871981/how-to-fix-the-layout-of-semantic-dashboard        
    shiny::tags$style(".pusher.container .ui.segment .ui.stackable.container.grid {margin:0px!important;}"),
    
    DisplayDashboardBody_Content(
      data_MVUIM_DDB_C = data_MVUIM_DDB,
      funcs_MVUIM_DDB_C = funcs_MVUIM_DDB,
      tabIDs_MVUIM_DDB_C = tabIDs_MVUIM_DDB)
    
  )
  return(theUI)
}


DisplayDashboardBody_Content <- function(
    data_MVUIM_DDB_C,
    funcs_MVUIM_DDB_C,
    tabIDs_MVUIM_DDB_C)
{
  nameFunctionForMessage <- "Mod_Viz_UI_Main$DisplayDashboardBody_Content() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  theUI <- semantic.dashboard::tabItems(

    selected = 2,

    semantic.dashboard::tabItem(

      tabName = tabIDs_MVUIM_DDB_C[["ID_TabSettings"]],  ## needs to be consistent with tabID defined in DisplayDashboardSidebar

      Mod_UI_TSt$Mod_Viz_UI_TabSettings$DisplayContent(
        data_MVUITS_DC = data_MVUIM_DDB_C,
        funcs_MVUITS_DC = funcs_MVUIM_DDB_C)),

    semantic.dashboard::tabItem(

      tabName = tabIDs_MVUIM_DDB_C[["ID_TabData"]], ## needs to be consistent with tabID defined in DisplayDashboardSidebar

      Mod_UI_TDa$Mod_Viz_UI_TabData$DisplayContent(
        data_MVUITD_DC = data_MVUIM_DDB_C,
        funcs_MVUITD_DC = funcs_MVUIM_DDB_C)),

    semantic.dashboard::tabItem(

      tabName = tabIDs_MVUIM_DDB_C[["ID_TabAnalysisOne"]],  ## needs to be consistent with tabID defined in DisplayDashboardSidebar

      Mod_UI_TA1$Mod_Viz_UI_TabAnalysisOne$DisplayContent(
        data_MVUITA1_DC = data_MVUIM_DDB_C,
        funcs_MVUITA1_DC = funcs_MVUIM_DDB_C)),

    semantic.dashboard::tabItem(

      tabName = tabIDs_MVUIM_DDB_C[["ID_TabAnalysisTwo"]],  ## needs to be consistent with tabID defined in DisplayDashboardSidebar

      Mod_UI_TA2$Mod_Viz_UI_TabAnalysisTwo$DisplayContent(
        data_MVUITA2_DC = data_MVUIM_DDB_C,
        funcs_MVUITA2_DC = funcs_MVUIM_DDB_C)),

    semantic.dashboard::tabItem(

      tabName = tabIDs_MVUIM_DDB_C[["ID_TabAnalysisThree"]],  ## needs to be consistent with tabID defined in DisplayDashboardSidebar

      Mod_UI_TA3$Mod_Viz_UI_TabAnalysisThree$DisplayContent(
        data_MVUITA3_DC = data_MVUIM_DDB_C,
        funcs_MVUITA3_DC = funcs_MVUIM_DDB_C)),

    semantic.dashboard::tabItem(

      tabName = tabIDs_MVUIM_DDB_C[["ID_TabResultsOne"]],  ## needs to be consistent with tabID defined in DisplayDashboardSidebar

      Mod_UI_TR1$Mod_Viz_UI_TabResultsOne$DisplayContent(
        data_MVUITR1_DC = data_MVUIM_DDB_C,
        funcs_MVUITR1_DC = funcs_MVUIM_DDB_C)),

    semantic.dashboard::tabItem(

      tabName = tabIDs_MVUIM_DDB_C[["ID_TabResultsTwo"]],  ## needs to be consistent with tabID defined in DisplayDashboardSidebar

      Mod_UI_TR2$Mod_Viz_UI_TabResultsTwo$DisplayContent(
        data_MVUITR2_DC = data_MVUIM_DDB_C,
        funcs_MVUITR2_DC = funcs_MVUIM_DDB_C)),

    Mod_UI_TSm$Mod_Viz_UI_TabSummary$DisplayContent(
      data_MVUITS_DC = data_MVUIM_DDB_C,
      funcs_MVUITS_DC = funcs_MVUIM_DDB_C,
      tabIDs_MVUITS_DC = tabIDs_MVUIM_DDB_C)
  )
  
  return(theUI)
} 


SetTabIDs_SidebarMenu <- function()
{
  nameFunctionForMessage <- "Mod_Viz_UI_Main$SetTabIDs_SidebarMenu() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  tabIDs <- tibble::tibble(
    ID_TabCategorySetup    = "ID_UI_sidebarMenu_CategorySetup", ## for Setup
    ID_TabCategoryAnalysis = "ID_UI_sidebarMenu_CategoryAnalysis", ## for Analysis
    ID_TabCategoryResults  = "ID_UI_sidebarMenu_CategoryResults", ## for Results
    ID_TabSettings         = "ID_UI_sidebarMenu_Settings", ## for Settings tab
    ID_TabData             = "ID_UI_sidebarMenu_Data",     ## for Data tab
    ID_TabAnalysisOne      = "ID_UI_sidebarMenu_AnalysisOne",   ## for first analysis tab
    ID_TabAnalysisTwo      = "ID_UI_sidebarMenu_AnalysisTwo",   ## for second analysis tab
    ID_TabAnalysisThree    = "ID_UI_sidebarMenu_AnalysisThree",   ## for third analysis tab
    ID_TabResultsOne       = "ID_UI_sidebarMenu_TabResultsOne",   ## for first Results tab
    ID_TabResultsTwo       = "ID_UI_sidebarMenu_TabResultsTwo",   ## for second Results tab
    ID_TabSummary          = "ID_UI_sidebarMenu_TabSummary"   ## for Summary Results tab
  )
  
  return(tabIDs)
}


})   ## end of mod_Viz_UI_Main
