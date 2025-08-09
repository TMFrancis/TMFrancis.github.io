# create leaflet map of Katahdin Hike w Owen
# Tom Francis, June 2025
# over commented for sharing

# load libraries
library(tidyverse)      # collection of data science packages for handling data
library(sf)             # Simple Feature - library for storing and accessing spatial geometries
library(leaflet)        # open-source JavaScript library for interactive maps
library(leaflegend)     # AwesomeIcon legend
library(leafem)         # used to place elevation profile

# hard coded working directory
setwd("C:/Users/bosto/Documents/Katahdin_project")

# read project spatial data from shapefiles
# all shapefiles must be in EPSG:4326 coordinate system
KH_route <- st_read("shpfiles/Katahdin_hike.shp")                               # hike route from Strava
KH_trails <- st_read("shpfiles/BSP_trails_WGS84.shp")                           # trails around Katahdin
KH_photos <- st_read("shpfiles/Katahdin_photos.shp")                            # geolocated photos

# create photo subsets for separate icons
KH_photos_hike <- KH_photos %>%
  filter(TYPE == 'Hike')

KH_photos_summit <- KH_photos %>%
  filter(TYPE == 'Summit')

KH_photos_park <- KH_photos %>%
  filter(TYPE == 'Park')

# create icons for geo-located photos
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

leaflet(options = leafletOptions(attributionControl=FALSE)) %>%                 # turn off attributions
  setView(lng = -68.889, lat = 45.911, zoom = 14 ) %>%                            # set focus and extent
  addProviderTiles("Esri.WorldTopoMap") %>%                                     # basemap see https://leaflet-extras.github.io/leaflet-providers/preview/
  addPolylines(data = KH_trails,                                                # trails
               color = "darkgreen",                                             # line color
               label = ~TName,                                                  # label for hover
               weight = 1.5) %>%                                                # line weight
  addPolylines(data = KH_route, color = "black",                                # hike route
               label = ~descriptio,
               weight = 2) %>% 
  addAwesomeMarkers(data = KH_photos_hike,                                      # photos
                    icon = i_Photo,                                             # icon for marker; ADDR is photo location
                    popup = ~paste0("<img src= ", ADDR ," width = 300 />        
                                    <p style='font-size:100%;'>",
                                    DESC,                                       # text in popup
                                    "</p>")) %>%
  addAwesomeMarkers(data = KH_photos_summit,                                    # photos @ summit
                    icon = i_Peak,
                    popup = ~paste0("<img src= ", ADDR ," width = 300 />
                                    <p style='font-size:100%;'>",
                                    DESC,
                                    "</p>")) %>%
  addAwesomeMarkers(data = KH_photos_park,                                      # photos @ car
                    icon = i_Car,
                    popup = ~paste0("<img src= ", ADDR ," width = 300 />
                                    <p style='font-size:100%;'>",
                                    DESC,
                                    "</p>")) %>%
  addLegendAwesomeIcon(iconSet = iconSet,                                       # legend for icons
                       orientation = 'horizontal',
                       position = 'topright',
                       title = "Photo Location"
                      ) %>%
  addScaleBar(position = "bottomleft",                                          # add a scale bar
              options = scaleBarOptions(maxWidth = 250,                         # width of scale bar
                                        imperial = TRUE,                        # show imperial units
                                        metric = FALSE,                         # don't show metric units (but I prefer metric)
                                        updateWhenIdle = TRUE)) %>%                 # update scalebar @ moveend
  addLogo(img = "images/Katahdin_Hike_Elevation.jpg",
          position = "bottomright",
          width = 400,
          height = 180,
          offset.x = 11,
          offset.y = 2)

                       
  