

## as soon as we run the code for the Shiny app, the working directory becomes 
## WorkingDir_RProject/.../Viz_Shiny_Modules
## instead of 
## WorkingDir_RProject
## this is reflected in the relative path of the files sourced below
pathFile <- base::file.path("Utils","GetSavedInfo.R")
base::source(file = pathFile,
             local = TRUE)


## define local piping operator
`%>%` <- dplyr::`%>%`


theUI <- function(request) 
{
  
  tabIDs_SidebarMenu <- Mod_Viz_UI_Main$SetTabIDs_SidebarMenu()
  
  contentUI <- semantic.dashboard::dashboardPage(
    
    title = "Viz Template",
    
    header = Mod_Viz_UI_Main$DisplayDashboardHeader(
      data_MVUIM_DDH = objSavedData,
      funcs_MVUIM_DDH = objSavedFuncs),
    
    sidebar = Mod_Viz_UI_Main$DisplayDashboardSidebar(
      data_MVUIM_DDS = objSavedData,
      funcs_MVUIM_DDS = objSavedFuncs,
      tabIDs_MVUIM_DDS = tabIDs_SidebarMenu),
    
    body = Mod_Viz_UI_Main$DisplayDashboardBody(
      data_MVUIM_DDB = objSavedData,
      funcs_MVUIM_DDB = objSavedFuncs,
      tabIDs_MVUIM_DDB = tabIDs_SidebarMenu)

  )
  
  return(contentUI)
} ## corresponds to theUI <- function(request) 


theServer <- function(input, output, session) 
{
  
  theMessage <- base::paste0("The working directory for this Shiny visualizer is ", base::getwd())
  base::message(theMessage)  
  
## create structures contained reactive values 
  reactiveUserInputs <- shiny::callModule(
    module = Mod_Viz_Svr_ReactiveVars$SetInitialValues_ReactiveUserInputs,
    id = "ID_Mod_Viz_Svr_ReactiveVars_SetInitialValues_ReactiveUserInputs",
    data_MVSRV_SIV_RUI = objSavedData)
  
  reactiveInnerVariables <- shiny::callModule(
    module = Mod_Viz_Svr_ReactiveVars$SetInitialValues_ReactiveInnerVariables,
    id = "ID_Mod_Viz_Svr_ReactiveVars_SetInitialValues_ReactiveInnerVariables",
    data_MVSRV_SIV_RIV = objSavedData)
  
  reactiveTriggers <- shiny::callModule(
    module = Mod_Viz_Svr_ReactiveVars$SetInitialValues_ReactiveTriggers,
    id = "ID_Mod_Viz_Svr_ReactiveVars_SetInitialValues_ReactiveTriggers",
    data_MVSRV_SIV_RT = objSavedData)
  
## observe events to update reactive values 
  reactiveUserInputs <- shiny::callModule(
    module = Mod_Viz_Svr_ReactiveVars$ObserveEvents_ReactiveUserInputs,
    id = "ID_Mod_Viz_Svr_ReactiveVars_ObserveEvents_ReactiveUserInputs",
    inputs_MVSRV_OE_RUI = input,
    reactiveInputs_MVSRV_OE_RUI = reactiveUserInputs)
  
  reactiveInnerVariables <- shiny::callModule(
    module = Mod_Viz_Svr_ReactiveVars$ObserveEvents_ReactiveInnerVariables,
    id = "ID_Mod_Viz_Svr_ReactiveVars_ObserveEvents_ReactiveInnerVariables",
    inputs_MVSRV_OE_RIV = input,
    reactiveVars_MVSRV_OE_RIV = reactiveInnerVariables)
  
  reactiveTriggers <- shiny::callModule(
    module = Mod_Viz_Svr_ReactiveVars$ObserveEvents_ReactiveTriggers,
    id = "ID_Mod_Viz_Svr_ReactiveVars_ObserveEvents_ReactiveTriggers",
    inputs_MVSRV_OE_RT = input,
    reactiveTriggers_MVSRV_OE_RT = reactiveTriggers)
  
## render content for every tab
  output <- shiny::callModule(
    module = Mod_Viz_Svr_ReactiveVars$RenderContent,
    id = "ID_Mod_Viz_Svr_ReactiveVars_RenderContent",
    data_MVSRV_RC = objSavedData,
    output_MVSRV_RC = output)
  
  output <- shiny::callModule(
    
    module = Mod_Viz_Server_TabData$RenderContent,
    id = "ID_Mod_Viz_Svr_TabData_RenderContent",
    data_MVSTD_RC = objSavedData,
    funcs_MVSTD_RC = objSavedFuncs,
    reactiveInputs_MVSTD_RC = reactiveUserInputs, 
    reactiveVars_MVSTD_RC = reactiveInnerVariables,
    reactiveTriggers_MVSTD_RC = reactiveTriggers,
    output_MVSTD_RC = output)
  
  output <- shiny::callModule(
    module = Mod_Viz_Server_TabAnalysisOne$RenderContent,
    id = "ID_Mod_Viz_Svr_TabAnalysis1_RenderContent",
    data_MVSTA1_RC = objSavedData,
    funcs_MVSTA1_RC = objSavedFuncs,
    reactiveInputs_MVSTA1_RC = reactiveUserInputs,
    reactiveVars_MVSTA1_RC = reactiveInnerVariables,
    reactiveTriggers_MVSTA1_RC = reactiveTriggers,
    output_MVSTA1_RC = output)

  output <- shiny::callModule(
    module = Mod_Viz_Server_TabAnalysisTwo$RenderContent,
    id = "ID_Mod_Viz_Svr_TabAnalysis2_RenderContent",
    data_MVSTA2_RC = objSavedData,
    funcs_MVSTA2_RC = objSavedFuncs,
    reactiveInputs_MVSTA2_RC = reactiveUserInputs,
    reactiveVars_MVSTA2_RC = reactiveInnerVariables,
    reactiveTriggers_MVSTA2_RC = reactiveTriggers,
    output_MVSTA2_RC = output)

  output <- shiny::callModule(
    module = Mod_Viz_Server_TabAnalysisThree$RenderContent,
    id = "ID_Mod_Viz_Svr_TabAnalysis3_RenderContent",
    data_MVSTA3_RC = objSavedData,
    funcs_MVSTA3_RC = objSavedFuncs,
    reactiveInputs_MVSTA3_RC = reactiveUserInputs,
    reactiveVars_MVSTA3_RC = reactiveInnerVariables,
    reactiveTriggers_MVSTA3_RC = reactiveTriggers,
    output_MVSTA3_RC = output)

  output <- shiny::callModule(
    module = Mod_Viz_Server_TabResultsOne$RenderContent,
    id = "ID_Mod_Viz_Svr_TabResults1_RenderContent",
    data_MVSTR1_RC = objSavedData,
    funcs_MVSTR1_RC = objSavedFuncs,
    reactiveInputs_MVSTR1_RC = reactiveUserInputs,
    reactiveVars_MVSTR1_RC = reactiveInnerVariables,
    reactiveTriggers_MVSTR1_RC = reactiveTriggers,
    output_MVSTR1_RC = output)

  output <- shiny::callModule(
    module = Mod_Viz_Server_TabResultsTwo$RenderContent,
    id = "ID_Mod_Viz_Svr_TabResults2_RenderContent",
    data_MVSTR2_RC = objSavedData,
    funcs_MVSTR2_RC = objSavedFuncs,
    reactiveInputs_MVSTR2_RC = reactiveUserInputs,
    reactiveVars_MVSTR2_RC = reactiveInnerVariables,
    reactiveTriggers_MVSTR2_RC = reactiveTriggers,
    output_MVSTR2_RC = output)
  
  output <- shiny::callModule(
    module = Mod_Viz_Server_TabSummary$RenderContent,
    id = "ID_Mod_Viz_Svr_TabSummary_RenderContent",
    data_MVSTS_RC = objSavedData,
    funcs_MVSTS_RC = objSavedFuncs,
    reactiveInputs_MVSTS_RC = reactiveUserInputs,
    reactiveVars_MVSTS_RC = reactiveInnerVariables,
    reactiveTriggers_MVSTS_RC = reactiveTriggers,
    output_MVSTS_RC = output)  
  
}  ## corresponds to theServer <- function(input, output, session) 


## define the options for Shiny
optionsShiny <- list(
  browser = base::paste0(Sys.getenv('PROGRAMFILES(x86)'),
                         '\\Google\\Chrome\\Application\\chrome.exe'),
  port = 2001,
  host = '0.0.0.0',
  launch.browser = TRUE)


## and finally run the Shiny app
shiny::shinyApp(
  ui = theUI, 
  server = theServer,
  options = optionsShiny)
