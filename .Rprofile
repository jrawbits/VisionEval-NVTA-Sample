# Run the development environment.
# Could alter to set VE.home to any runtime installation
# Then source VisionEval.R straight from that folder

this.R <- paste(R.version[c("major","minor")],collapse=".")

# Set VE_HOME in your .Renviron (not versioned)
# Should be either
#   a) the Github root (developer) - also set VE_DEVELOPER=yes; or
#   b) the directory containing VisionEval.R (end user)
# .Renviron might look like this (remove the # at the beginning):
#   VE_HOME=N:/Git-Repos/VisionEval-dev
#   VE_DEVELOPER=yes

VE.home <- Sys.getenv("VE_HOME",unset=getwd()) # Where to look for runnable VisionEval
VE.developer <- Sys.getenv("VE_DEVELOPER",unset="no")!="no"

# VisionEval will run in VE_RUNTIME - generally leaving the default is preferred
ve.runtime <- Sys.getenv("VE_RUNTIME",unset=getwd()) # can also set VE_RUNTIME somewhere else
Sys.setenv(VE_RUNTIME=ve.runtime)

setwd(VE.home) # get ready to run the startup file
if ( VE.developer ) {
  dev.lib <- file.path(VE.home,"/dev/lib",this.R)
  ve.lib  <- file.path(VE.home,"built/visioneval",this.R,"ve-lib")
  source("build/VisionEval-dev.R")
  if ( ! dir.exists(dev.lib) || ! dir.exists(ve.lib) ) {
    message("VisionEval in ",VE.home," has not been built yet")
    message("Start R from within ",VE.home," and run ve.build()")
  } else {
    .libPaths( c(dev.lib, ve.lib) )
    ve.run()
  }
} else ( source("VisionEval.R") )


