

PublishViz_QWIMProject <- function()
{
  theAppDir <- base::file.path(base::getwd(),"Visualization","VizTemplate","Viz_Shiny_Modules")
  
  rsconnect::deployApp(
    appDir = theAppDir,
    appName = "SampleViz_QWIM_Project")

}


SetShinyAppAccount <- function()
{
 
  rsconnect::setAccountInfo(name = 'TheUserName_shinyapps.io',
                            token = 'TheToken_shinyapps.io',
                            secret = 'TheSecret_shinyapps.io')
}


PublishViz <- function(nameViz_PV)
{
  
  SetShinyAppAccount()
  
  if (nameViz_PV == "QWIMProject_SampleViz") {
    PublishViz_QWIMProject()
  } else if (nameViz_PV == "SomeOtherViz") {
    theMessage <- base::paste0("Name of visualizer = ", nameViz_PV, " is not an acceptable selection")
    base::stop(theMessage)
  } else {
    theMessage <- base::paste0("Name of visualizer = ", nameViz_PV, " was not found")
    base::stop(theMessage)
  } 
  
}


## usage  PublishViz(nameViz_PV = "NameOfVisualizer")
## examples:
## for publishing the visualizer within the folder VizTemplate:   PublishViz(nameViz_PV = "QWIMProject_SampleViz")

PublishViz(nameViz_PV = "QWIMProject_SampleViz")
