# Run the development environment.
# Could alter to set VE.home to any runtime installation
# Then source VisionEval.R straight from that folder

this.R <- paste(R.version[c("major","minor")],collapse=".")
VE.home <- Sys.getenv("VE_HOME",unset=getwd())
Sys.setenv(VE_RUNTIME=getwd())

# Set VE_HOME in your .Renviron (not versioned)
setwd(VE.home)
dev.lib <- file.path(VE.home,"/dev/lib",this.R)
ve.lib  <- file.path(VE.home,"built/visioneval",this.R,"ve-lib")
source("build/VisionEval-dev.R")
if ( ! dir.exists(dev.lib) || ! dir.exists(ve.lib) ) {
  message("VisionEval in ",getwd()," has not been built yet")
  message("Set VE_HOME and run ve.build()")
} else {
  .libPaths( c(dev.lib, ve.lib) )
  ve.run()
}

