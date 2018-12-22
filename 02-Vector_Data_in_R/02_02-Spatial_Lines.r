 # Data entry
lon <- c(-116.8, -114.2, -112.9, -111.9, -114.2, -115.4, -117.7)
lat <- c(41.3, 42.9, 42.4, 39.8, 37.6, 38.3, 37.6)
lonlat <- cbind(lon, lat)
 # Now create a spLines object
crdref <- CRS('+proj=longlat +datum=WGS84')
lns <- spLines(lonlat, crs=crdref)
lns
 # Let’s check what kind of object lns is.
 class(lns)
# And what is inside of it
 showDefault(lns)
 # load raster package to see how spatial objects are printed
 library(raster)
 lns
  # Generate random line values, same quantity as lines and need a data.frame to store the data in rows 
 Road <- runif(nrow(lonlat), min=0, max=100)
 df <- data.frame(ID=1:nrow(lonlat), road=Road)
 # Combine the SpatialLines with the data.frame.
 lnsdf <- SpatialLinesDataFrame(lns, data=df)
 lnsdf
 # to see what is inside
 str(lnsdf)
 # or
 showDefault(lnsdf)
# see the graph 
plot(lnsdf)