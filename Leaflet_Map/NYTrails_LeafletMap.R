# load libraries
library(tidyverse)      #collection of data science packages for handling data
library(sf)             #Simple Feature - library for storing and accessing spatial geometries
library(leaflet)
library(htmltools)
library(dplyr)
library(mapview)


DC_parcel <- st_read("E:/Documents/NY_RailTrails/Leaflet_Map/shapefiles/Parcel_Dutchess_WGS84.shp")
PN_parcel <- st_read("E:/Documents/NY_RailTrails/Leaflet_Map/shapefiles/Parcel_Putnam_WGS84.shp")
RT_proposed <- st_read("E:/Documents/NY_RailTrails/Leaflet_Map/shapefiles/RT_Proposed_WGS84.shp")
H_Fishkill <- st_read("E:/Documents/NY_RailTrails/Leaflet_Map/shapefiles/Hotel_Fishkill_WGS84.shp")
RT_visit <- st_read("E:/Documents/NY_RailTrails/Leaflet_Map/shapefiles/RT_Visit_WGS84.shp")



leaflet() %>% 
  setView(lng = -73.89, lat = 41.53, zoom = 14 ) %>%                       #focus map
  addPolygons(data = PN_parcel,
              color = "navy",
              weight = 1,
              fillColor = "blue",
              fillOpacity = 0.5,
              popup = ~paste0(PARCEL_ADD)) %>% 
  addPolylines(data = RT_proposed, color = "black") %>%
  addPolylines(data = RT_visit, 
               color = "blue",
               label = ~Name) %>%
  #addProviderTiles("Esri.NatGeoWorldMap") %>%
  addProviderTiles("OpenStreetMap.Mapnik") %>%                          #basemap
  addMarkers(data = DC_parcel,
            popup = ~paste0(PARCEL_ADD)) %>%
  addCircleMarkers(data = H_Fishkill,
             color = '#ff0000',
             fillColor = "red",
             opacity = 100,
             weight = 5,
             radius = 10,
             popup = " Hyatt House Fishkill")

  


