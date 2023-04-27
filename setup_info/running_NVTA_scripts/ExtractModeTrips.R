
library(tidyverse)
library(plotly) #install.packages('plotly')
library(DT) # install.packages('DT')
library(stringr)

# welp the mode trips are the same
mode_trips = data.frame(matrix(ncol = 7, nrow = 0))

colnames(mode_trips) <- c("short_name", "WalkTrips",	"BikeTrips",	"TransitTrips", "VehicleTrips", "Vehicles", "OwnCost")

hhfile <- readr::read_csv(file.path(ve.runtime, 'models', 'Scenario_Metrics_Hh_Check.csv'))

scenarios <-readr::read_csv(file.path(ve.runtime, 'models', 'Scenario_Status.csv'))

for(i in 1:nrow(scenarios)){

  location <- scenarios[i,"location"]
  model_level_name <-  str_extract(location,"[^/]+$")
  print(model_level_name)
  WalkTrips <- with(hhfile, sum(WalkTrips[short_name == model_level_name]))
  BikeTrips<- with(hhfile, sum(BikeTrips[short_name == model_level_name]))
  TransitTrips <- with(hhfile, sum(TransitTrips[short_name == model_level_name]))
  VehicleTrips<- with(hhfile, sum(VehicleTrips[short_name == model_level_name]))
  OwnershipCost <- with(hhfile, sum(OwnCost[short_name == model_level_name],na.rm = TRUE))
  Vehicles <- with(hhfile, sum(Vehicles[short_name == model_level_name]))
  mode_trips_level <- data.frame(model_level_name,WalkTrips,BikeTrips,TransitTrips,VehicleTrips,Vehicles,OwnershipCost)
  
  mode_trips <- rbind(mode_trips,mode_trips_level)
}

write.csv(mode_trips,file.path(ve.runtime, 'models','ModeTrips.csv'), row.names = FALSE)


View(mode_trips)
