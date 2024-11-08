# R code to create leaflet map for Chip Patterson's site visit to Empire State Trail in Fishkill, NY
# Using RStudio, the code creates a map in the Viewer window.
# the map should be saved as a html document in a folder with the subfolder of shapefiles
# 

# load libraries
library(tidyverse)      #collection of data science packages for handling data
library(sf)             #Simple Feature - library for storing and accessing spatial geometries
library(leaflet)
library(htmltools)
library(dplyr)
library(mapview)
library(leaflet.extras) #includes GPS control
library(leaflegend)     #AwesomeIcon legend

# hard coded working directory
setwd("E:/Documents/NY_RailTrails/Leaflet_Map")

# read project spatial data from shapefiles
# all shapefiles must be in EPSG:4326 coordinate system
DC_parcel <- st_read("shapefiles/Parcel_Dutchess_WGS84.shp")      #plaintiff parcels in Dutchess county
PN_parcel <- st_read("shapefiles/Parcel_Putnam_WGS84.shp")        #plaintiff parcels in Putnam county
RT_proposed <- st_read("shapefiles/RT_Proposed_WGS84.shp")        #proposed rail trail
H_Fishkill <- st_read("shapefiles/Hotel_Fishkill_WGS84.shp")      #hotel location
RT_visit <- st_read("shapefiles/RT_Visit_WGS84.shp")              #comparable rail trails
RT_Xing <- st_read("shapefiles/RT_Proposed_Xing_WGS84.shp")       #proposed rail trail at-grade crossings
RT_EST_park <- st_read("shapefiles/RT_EST_parking_WGS84.shp")     #parking for Empire State Trail
RT_Comp_park <- st_read("shapefiles/RT_Comp_parking_WGS84.shp")   #parking for comparable trails

# icons see https://fontawesome.com/search?o=r&m=free
i_Hotel <- awesomeIcons(
  icon = 'bed',
  iconColor = 'purple',
  library = 'fa', 
  markerColor = 'pink'
)

i_Park <- awesomeIcons(
  icon = 'car',
  iconColor = 'black',
  library = 'fa', 
  markerColor = 'green'
)

i_Xing <- awesomeIcons(
  icon = 'train',
  iconColor = 'black',
  library = 'fa', 
  markerColor = 'blue'
)

# create list of icons for legend
iconSet <- awesomeIconList(
  hotel = makeAwesomeIcon(
    icon = 'bed',
    library = 'fa',
    iconColor = 'purple',
    markerColor = 'pink'
  ),  
  park = makeAwesomeIcon(
    icon = 'car',
    library = 'fa',
    iconColor = 'black',
    markerColor = 'green'
  ),
  xing = makeAwesomeIcon(
    icon = 'train',
    library = 'fa',
    iconColor = 'black',
    markerColor = 'blue'
  )
)  

leaflet() %>% 
  setView(lng = -73.89, lat = 41.53, zoom = 14 ) %>%              # focus map
  addProviderTiles("OpenStreetMap.Mapnik") %>%                    # basemap see https://leaflet-extras.github.io/leaflet-providers/preview/
  addPolygons(data = PN_parcel,                                   # Putnam County parcels
              color = "navy",
              weight = 1,
              fillColor = "blue",
              fillOpacity = 0.5,
              popup = ~paste0("<p style='font-size:300%;'>",      # increase font size for mobile viewing
                              PARCEL_ADD,
                              "</p>")) %>% 
  addPolylines(data = RT_proposed, color = "black",               # proposed rail trail
               label = ~IEc_trail) %>%                            
  addPolylines(data = RT_visit,                                   # existing rail trails to visit
               color = "blue",
               fillOpacity = 0.5,
               label = ~Name) %>%
  addCircleMarkers(data = DC_parcel,                              # Dutchess County parcels
                   color = '#ff0000',
                   fillColor = "red",
                   opacity = 100,
                   weight = 1,
                   radius = 12,
                   popup = ~paste0("<p style='font-size:300%;'>",
                                   PARCEL_ADD,
                                   "</p>")) %>%
  addAwesomeMarkers(data = H_Fishkill,                            # hotel
                    icon = i_Hotel,
                    popup = "<p style='font-size:300%;'>Hyatt House Fishkill</p>") %>%
  addAwesomeMarkers(data = RT_EST_park,                            # Empire State Trail parking
                    icon = i_Park,
                    popup = ~paste0("<p style='font-size:300%;'>Trail parking at:<br>",
                                    ADDR,
                                    "</p>")) %>%
  addAwesomeMarkers(data = RT_Comp_park,                            # comparable trail parking
                    icon = i_Park,
                    popup = ~paste0("<p style='font-size:300%;'>Trail parking at:<br>",
                                    ADDR,
                                    "</p>")) %>%
  addAwesomeMarkers(data = RT_Xing,                                 # proposed trail at grade X-ings
                    icon = i_Xing,
                    popup = ~paste0("<p style='font-size:300%;'>At-grade rail crossing:<br>",
                             ADDR,
                             "</p>")) %>%
  addLegendAwesomeIcon(iconSet = iconSet,
                       orientation = 'horizontal',
                       position = 'bottomright',
                       title = "Markers"
                       )


# export map as html using "Save as Web Page" in Viewer window
