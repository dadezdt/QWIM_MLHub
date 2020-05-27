

## as soon as we run the code for the Shiny app, the working directory becomes 
## WorkingDir_RProject/.../Viz_Shiny_Modules
## instead of 
## WorkingDir_RProject
## this is reflected in the relative path of the files sourced below


## get the object containing the saved data structures
pathFileSavedData <- base::file.path("Inputs","SavedDataForShiny.qs")
objSavedData <- qs::qread(file = pathFileSavedData)

## get the object containing saved functions
pathFileSavedFunctions <- base::file.path("Inputs","SavedFunctionsForShiny.qs")
objSavedFuncs <- qs::qread(file = pathFileSavedFunctions)


## and now for everything else

## first the setup info
pathFile <- base::file.path('Utils','ShinySetup.R')
base::source(file = pathFile,
             local = TRUE)


## then the UI abd Server Main modules
pathFile <- base::file.path('UI_Modules','UI_Main.R')
base::source(file = pathFile,
             local = TRUE)
pathFile <- base::file.path('Server_Modules','Server_Main.R')
base::source(file = pathFile,
             local = TRUE)
pathFile <- base::file.path('Server_Modules','Server_TabSettings.R')
base::source(file = pathFile,
             local = TRUE)
pathFile <- base::file.path('Server_Modules','Server_TabData.R')
base::source(file = pathFile,
             local = TRUE)
pathFile <- base::file.path('Server_Modules','Server_TabAnalysisOne.R')
base::source(file = pathFile,
             local = TRUE)
pathFile <- base::file.path('Server_Modules','Server_TabAnalysisTwo.R')
base::source(file = pathFile,
             local = TRUE)
pathFile <- base::file.path('Server_Modules','Server_TabAnalysisThree.R')
base::source(file = pathFile,
             local = TRUE)
pathFile <- base::file.path('Server_Modules','Server_TabResultsOne.R')
base::source(file = pathFile,
             local = TRUE)
pathFile <- base::file.path('Server_Modules','Server_TabResultsTwo.R')
base::source(file = pathFile,
             local = TRUE)
pathFile <- base::file.path('Server_Modules','Server_TabSummary.R')
base::source(file = pathFile,
             local = TRUE)

pathFile <- base::file.path('UI_Modules','UI_ReactiveVars.R')
base::source(file = pathFile,
             local = TRUE)
pathFile <- base::file.path('Server_Modules','Server_ReactiveVars.R')
base::source(file = pathFile,
             local = TRUE)

