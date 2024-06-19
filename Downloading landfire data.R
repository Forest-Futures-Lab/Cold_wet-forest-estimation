###Note this works well except the writing the file. I'm not sure why

library(rlandfire)
library(terra)
library(sf)
library(tidyverse)

data.directory = "D:/workspace/Winslow/landfire_supression_area_analysis/data/"
pixel.size=30
domain="whole" #Alternative is whole or State
State= "all" #If domain set to whole then not needed.

boundary <- st_read("D:/workspace/Winslow/western_veg_fire_model/shape_files/western_states.shp")
boundary = boundary %>% st_transform(crs = st_crs("ESRI:102039"))
if(domain=="State"){
  boundary = boundary %>% filter(STATE == State)
}else{
  boundary=boundary
}

aoi = getAOI(boundary, extend=1000)
products = c("230VCC","200BPS","230EVT")
projection=102039
resolution=pixel.size
path= tempfile(fileext = ".zip")

  resp <- landfireAPI(products = products,
                      aoi = aoi, 
                      projection = projection, 
                      resolution = resolution,
                      path = path,
                      verbose = TRUE)
  lf_dir <- file.path(tempdir(), "lf")
  utils::unzip(path, exdir = lf_dir)
  
  lf <- terra::rast(list.files(lf_dir, pattern = ".tif$", 
                               full.names = TRUE, 
                               recursive = TRUE))
  
writeCDF(lf$US_230EVT , paste0(data.directory,"domain-",domain,"_State-",State,"_Pixel.size-",pixel.size,"_EVT.nc"),overwrite=T)
writeCDF(lf$US_200BPS , paste0(data.directory,"domain-",domain,"_State-",State,"_Pixel.size-",pixel.size,"_BPS.nc"),overwrite=T)
writeCDF(lf$US_230VCC , paste0(data.directory,"domain-",domain,"_State-",State,"_Pixel.size-",pixel.size,"_VCC.nc"),overwrite=T)


