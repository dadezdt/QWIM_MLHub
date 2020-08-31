

## the function is defined first, and executed at end of the file
RunShinyViz <- function(
    saveDataAndFunctions_RSV = TRUE,
    shinyWorkingDir_RSV = base::file.path("Visualization","VizTemplate"), 
    version_RSV = 'prod')
{
  nameFunctionForMessage <- "RunShinyViz() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  fileNames <- list(prod = 'app.R',
                   dev = 'app.R')
  pathShinyFolder <- base::file.path(shinyWorkingDir_RSV, "Viz_Shiny_Modules")
  pathFileSavedInfo <- base::file.path(shinyWorkingDir_RSV, 
                                      "Viz_Shiny_Modules","Utils", "SaveInfo.R")
  pathFileDefaultValues <- base::file.path(shinyWorkingDir_RSV,
                              "Viz_Shiny_Modules", 'Utils','DefaultValues.R')
  if (saveDataAndFunctions_RSV) {
      base::source(
        file = pathFileSavedInfo,
        local = TRUE)
      base::source(
        file = pathFileDefaultValues,
        local = TRUE)
    
      nameFuncs <- list()
      nameFuncs[["SetValuesUserInputs"]] <- Mod_Viz_DefaultValues$SetValues_UserInputs
      nameFuncs[["SetValuesInnerVariables"]] <- Mod_Viz_DefaultValues$SetValues_InnerVariables
      
      Mod_Viz_SaveInfo$SaveDataAndFunctions(
          pathShinyFolder_MVSI_SDaF = pathShinyFolder,
          nameFuncs_MVSI_SDaF = nameFuncs)
  }
  
  theMessage <- base::paste0("The working directory for this R project is ", base::getwd())
  base::message(theMessage)
  
  fileToRun <- fileNames[[version_RSV]]
  
  base::options(browser = base::paste0(Sys.getenv('PROGRAMFILES(x86)'),
                                 '\\Google\\Chrome\\Application\\chrome.exe'))
  
  shiny::runApp(
      appDir = base::file.path(pathShinyFolder, fileToRun),
      host = '0.0.0.0', 
      port = 3001, 
      launch.browser = TRUE)
}


## and now execute
RunShinyViz(saveDataAndFunctions_RSV = TRUE)
# RunShinyViz(saveDataAndFunctions_RSV = FALSE)
