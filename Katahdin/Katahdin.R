# create leaflet map of Katahdin Hike w Owen

# load libraries
library(tidyverse)      #collection of data science packages for handling data
library(sf)             #Simple Feature - library for storing and accessing spatial geometries
library(leaflet)
library(htmltools)
library(dplyr)
library(mapview)
library(leaflegend)     #AwesomeIcon legend

# hard coded working directory
setwd("C:/Users/bosto/Documents/Katahdin_project")

# read project spatial data from shapefiles
# all shapefiles must be in EPSG:4326 coordinate system
KH_route <- st_read("shpfiles/Katahdin_hike.shp")                      # hike route from Strava
KH_trails <- st_read("shpfiles/Katahdin_trails.shp")                   # trails around Katahdin
KH_photos <- st_read("shpfiles/Katahdin_photos.shp")                   # geolocated photos

# create photo subsets for separate icons
KH_photos_hike <- KH_photos %>%
  filter(TYPE == 'Hike')

KH_photos_summit <- KH_photos %>%
  filter(TYPE == 'Summit')

KH_photos_park <- KH_photos %>%
  filter(TYPE == 'Park')

# icons see https://fontawesome.com/search?o=r&m=free
i_Photo <- awesomeIcons(
  icon = 'camera',
  iconColor = 'black',
  library = 'fa', 
  markerColor = 'green'
)

i_Peak <- awesomeIcons(
  icon = 'flag',
  iconColor = 'black',
  library = 'fa', 
  markerColor = 'pink'
)

i_Car <- awesomeIcons(
  icon = 'car',
  iconColor = 'black',
  library = 'fa', 
  markerColor = 'orange'
)

# create list of icons for legend
iconSet <- awesomeIconList(
  Trail = makeAwesomeIcon(
    icon = 'camera',
    iconColor = 'black',
    library = 'fa', 
    markerColor = 'green'
  ),
  Peak = makeAwesomeIcon(
    icon = 'flag',
    iconColor = 'black',
    library = 'fa', 
    markerColor = 'pink'
  ),
  Car = makeAwesomeIcon(
    icon = 'car',
    iconColor = 'black',
    library = 'fa', 
    markerColor = 'orange'
  )
)

########### remember that photos don't visualize in RStudio Viewer #############
# set photo location to relative path 

leaflet() %>% 
  setView(lng = -68.89, lat = 45.91, zoom = 13 ) %>% 
  addProviderTiles("Esri.WorldTopoMap") %>%    
  addPolylines(data = KH_route, color = "black",                  # hike route
               label = ~descriptio) %>% 
  addAwesomeMarkers(data = KH_photos_hike,                            # photos
                    icon = i_Photo,
                    popup = ~paste0("<img src= ", ADDR ," width = 300 />
                                    <p style='font-size:100%;'>",
                                    DESC,
                                    "</p>")) %>%
  addAwesomeMarkers(data = KH_photos_summit,                            # photos
                    icon = i_Peak,
                    popup = ~paste0("<img src= ", ADDR ," width = 300 />
                                    <p style='font-size:100%;'>",
                                    DESC,
                                    "</p>")) %>%
  addAwesomeMarkers(data = KH_photos_park,                            # photos
                    icon = i_Car,
                    popup = ~paste0("<img src= ", ADDR ," width = 300 />
                                    <p style='font-size:100%;'>",
                                    DESC,
                                    "</p>")) %>%
  addLegendAwesomeIcon(iconSet = iconSet,
                       orientation = 'horizontal',
                       position = 'bottomright',
                       title = "Photo Location"
                      )
                       
addPolylines(data = KH_trails, color = "darkgreen",                  # trails
             label = ~TName) %>%      