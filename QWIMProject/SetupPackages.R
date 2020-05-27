
base::cat("Display the current library path \n \n")
thePaths <- base::normalizePath(path = .libPaths(), 
                                winslash = "/")
base::print(thePaths)
base::cat("\n")

snapshotDateForPackages <- "2020-05-25" 

options(install.packages.compile.from.source = "always")

pathFile <- base::file.path("CheckpointUtils.R")
base::source(file = pathFile,
             local = TRUE)

packagesThatAreNeededFirst <- c("checkpoint")
InstallPackages_Overlay(
  packagesToCheck_IP_O = packagesThatAreNeededFirst,
  snapshotDate_IP_O = snapshotDateForPackages)

SetupSnapshot(
  snapshotDate_S = snapshotDateForPackages,
  useLocalRepo_S = FALSE)  ## if TRUE, install from local repo


packagesNotScannedByCheckpoint <- c(
    "shinythemes","highcharter","DT","fastmatch","feather","kableExtra","plotrix","factoextra","tidyverse",
    "rio","highr","shinyjs","shiny.semantic","semantic.dashboard","svglite","gplots","randomcoloR","dendextend",
    "shinydashboard","RQuantLib","narray","processx","rhandsontable", "knitr","rmarkdown","rsconnect")

InstallPackages_Overlay(
  packagesToCheck_IP_O = packagesNotScannedByCheckpoint,
  snapshotDate_IP_O = snapshotDateForPackages)

InstallPackagesLocal()

InspectResultsCheckpoint()

## just to ensure that tidyverse (and dependencies) is installed
checkTidyverseDependencies <- TRUE
if (checkTidyverseDependencies) {
  tidyverse::tidyverse_deps()
  tidyverse::tidyverse_packages()
}

base::cat("Display the current library path \n \n")
thePaths <- base::normalizePath(path = .libPaths(), 
                                winslash = "/")
base::print(thePaths)

