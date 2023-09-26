@echo off
rem R_HOME will determine what R Version you're using (run R and use R.home() to obtain)
rem If you start from RStudio, it will use the R configured there
rem You will need a Github installation that has been built for that R version
if "%R_HOME%" == "" set R_HOME=C:/PROGRA~1/R/R-43~1.1
start %R_HOME%\bin\x64\RGui.exe --no-save
