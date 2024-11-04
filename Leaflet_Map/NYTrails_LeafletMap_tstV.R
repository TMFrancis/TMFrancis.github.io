# load libraries
library(tidyverse)      #collection of data science packages for handling data
library(sf)             #Simple Feature - library for storing and accessing spatial geometries
library(leaflet)
library(htmltools)
library(dplyr)
library(mapview)


DC_parcel <- st_read("shapefiles/Parcel_Dutchess_WGS84.shp")
PN_parcel <- st_read("shapefiles/Parcel_Putnam_WGS84.shp")
RT_proposed <- st_read("shapefiles/RT_Proposed_WGS84.shp")
H_Fishkill <- st_read("shapefiles/Hotel_Fishkill_WGS84.shp")
RT_visit <- st_read("shapefiles/RT_Visit_WGS84.shp")
RT_Xing <- st_read("shapefiles/RT_Proposed_Xing_WGS84.shp")
RT_EST_park <- st_read("shapefiles/RT_EST_parking_WGS84.shp")
RT_Comp_park <- st_read("shapefiles/RT_Comp_parking_WGS84.shp")

# icons
i_Hotel <- awesomeIcons(
  icon = 'ios-close',
  iconColor = 'black',
  library = 'ion', 
  markerColor = 'red'
)

i_Park <- awesomeIcons(
  icon = 'ios-close',
  iconColor = 'black',
  library = 'ion', 
  markerColor = 'green'
)

leaflet() %>% 
  setView(lng = -73.89, lat = 41.53, zoom = 14 ) %>%              # focus map
  addPolygons(data = PN_parcel,                                   # Putnam County parcels
              color = "navy",
              weight = 1,
              fillColor = "blue",
              fillOpacity = 0.5,
              popup = ~paste0(PARCEL_ADD)) %>% 
  addPolylines(data = RT_proposed, color = "black") %>%           # proposed rail trail
  addPolylines(data = RT_visit,                                   # existing rail trails to visit
               color = "blue",
               fillOpacity = 0.5,
               label = ~Name) %>%
  addProviderTiles("OpenStreetMap.Mapnik") %>%                    # basemap
  addCircleMarkers(data = DC_parcel,                              # Dutchess County parcels
                   color = '#ff0000',
                   fillColor = "red",
                   opacity = 100,
                   weight = 1,
                   radius = 4,
                   popup = ~paste0(PARCEL_ADD)) %>%
  addAwesomeMarkers(data = H_Fishkill,                            # hotel
                    icon = i_Hotel,
                   popup = "Hyatt House Fishkill") %>%
  addAwesomeMarkers(data = RT_EST_park,                            # hotel
                    icon = i_Park,
                    popup = ~paste0(ADDR)) %>%
  addAwesomeMarkers(data = RT_Comp_park,                            # hotel
                    icon = i_Park,
                    popup = ~paste0(ADDR)) %>%
  addMarkers(data = RT_Xing,
             popup = ~paste0(ADDR))


