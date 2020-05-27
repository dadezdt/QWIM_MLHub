

## the working directory is WorkingDir_RProject


Mod_Viz_SaveInfo <- modules::module(
{

## packages that need to be explicitly imported within this module 
#    modules::import(from = "dplyr")  ## needed for %>%


## define local piping operator, to avoid loading dplyr package
    `%>%` <- dplyr::`%>%`


## local files or functions that have to be imported explicitly
#   nameForLocalUsage <- modules::use(module = "SomeName")  
##    pathFile <- base::file.path("Visualization","SemanticDashboardTemplate",
##                                "Viz_Shiny_Modules", 'Utils','DefaultValues.R')
##    Mod_DV <- modules::use(module = pathFile) 


## functions exported from this module
    modules::export("SaveDataAndFunctions")


SaveDataAndFunctions <- function(
    pathShinyFolder_MVSI_SDaF,
    nameFuncs_MVSI_SDaF)
{
  nameFunctionForMessage <- "Mod_Viz_SaveInfo$SaveDataAndFunctions() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  pathFolder_Inputs <- base::file.path(pathShinyFolder_MVSI_SDaF, "Inputs")
  if (!(base::dir.exists(pathFolder_Inputs))) {
    base::dir.create(pathFolder_Inputs)
  }
  
  nameFileSavedData <- "SavedDataForShiny.qs"
  file_SavedData = base::file.path(pathShinyFolder_MVSI_SDaF,"Inputs", nameFileSavedData)
  nameFileSavedFuncs <- "SavedFunctionsForShiny.qs"
  file_SavedFunctions = base::file.path(pathShinyFolder_MVSI_SDaF,"Inputs",nameFileSavedFuncs)
  
  SaveData(
      pathFile_MVSI_SD = file_SavedData,
      nameFuncs_MVSI_SD = nameFuncs_MVSI_SDaF)
  
  SaveFunctions(pathFile_MVSI_SF = file_SavedFunctions)
  ## this function has no return  
}


SaveData <- function(
    pathFile_MVSI_SD,
    nameFuncs_MVSI_SD)
{
  nameFunctionForMessage <- "Mod_Viz_SaveDataFuncs$SaveData() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  objDataToSave <- list()
  
## get data fromm various data files (sources)
  
  pathFile <- base::file.path("Data","Temp","CarData.qs")
  theCarData <- qs::qread(file = pathFile)
  objDataToSave[["DataCars"]] <- theCarData
  
  pathFile <- base::file.path("Data","Temp","TimeSeriesData.qs")
  theTimeSeriesData <- qs::qread(file = pathFile)
  objDataToSave[["DataTimeSeries"]] <- theTimeSeriesData
  theNamesTimeSeries <- names(theTimeSeriesData)
  theNamesTimeSeries <- theNamesTimeSeries[-1]
  objDataToSave[["NamesTimeSeries"]] <- theNamesTimeSeries
  
## Set colors for Plots  
  colors_PlotTimeSeries <- SetColors_PlotsTimeSeries(namesTimeSeries_MVSI_SC_PTS = theNamesTimeSeries)
  objDataToSave[["Colors_PlotTimeSeries"]] <- colors_PlotTimeSeries  
  
## Set default values to inputs and inner variables of Shiny visualizer
  dataForDefaultInputs <- NULL
## The next two lines were replaced by the folloing line, to avoid sourcing 
## the 'DefaultValues.R' file )see lines 19-20 above) within this module
## Instead, we pass the name of the relevant functions through 
## an argument nameFuncs_MVSI_SD to this function 
#  defaultUserInputs <- Mod_DV$Mod_Viz_DefaultValues$SetValues_UserInputs(
#      data_MVDV_SV_UI = dataForDefaultInputs)
  defaultUserInputs <- nameFuncs_MVSI_SD[["SetValuesUserInputs"]](
    data_MVDV_SV_UI = dataForDefaultInputs)
  objDataToSave[["DefaultInputs"]] <- defaultUserInputs
  
  dataForDefaultInnerVariables <- NULL
## The next two lines were replaced by the folloing line, to avoid sourcing 
## the 'DefaultValues.R' file )see lines 19-20 above) within this module
## Instead, we pass the name of the relevant functions through 
## an argument nameFuncs_MVSI_SD to this function 
#  defaultInnerVariables <- Mod_DV$Mod_Viz_DefaultValues$SetValues_InnerVariables(
#    data_MVDV_SV_IV = dataForDefaultInnerVariables)
  defaultInnerVariables <- nameFuncs_MVSI_SD[["SetValuesInnerVariables"]](
    data_MVDV_SV_IV = dataForDefaultInnerVariables)
  objDataToSave[["DefaultInnerVariables"]] <- defaultInnerVariables
  
  qs::qsave(
    x = objDataToSave,
    file = pathFile_MVSI_SD)
  
  ## this function has no return   
}


SaveFunctions <- function(pathFile_MVSI_SF)
{
  
  nameFunctionForMessage <- "Mod_Viz_SaveDataFuncs$SaveFunctions() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  objFuncsToSave <- list()
  
  objFuncsToSave[["TempFunc"]] <- NULL
  objFuncsToSave[["Func_ggplot_ylab"]] <- ggplot2::ylab
  
  qs::qsave(
    x = objFuncsToSave,
    file = pathFile_MVSI_SF)
  
  ## this function has no return   
}


SetColors_PlotsTimeSeries <- function(namesTimeSeries_MVSI_SC_PTS)
{
  
  nameFunctionForMessage <- "Mod_Viz_SaveDataFuncs$SetColors_PlotsTimeSeries() "    
  reportr::setOutputLevel(reportr::OL$Error)  
  
  numTimeSeries <- base::length(namesTimeSeries_MVSI_SC_PTS)
  ##  theColors <- grDevices::rainbow(n = numTimeSeries)
  theColors <- c("red","blue","green","gray",
                 "magenta","slateblue","chocolate","blueviolet",
                 "seagreen","indianred","turquoise","navy",
                 "cyan","pink","purple","yellow")
  theColorsAsHex <- gplots::col2hex(theColors)
  
  colorsPlot <- tibble::tibble(
    NameTimeSeries = namesTimeSeries_MVSI_SC_PTS,
    Color = theColors)
  
  return(colorsPlot)
}


})
