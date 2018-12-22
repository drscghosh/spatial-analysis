# Data entry
source("final/helpers/sample_data.r")
 # Now create a SpatialPolygons object
 pols <- spPolygons(lonlat, crs=crdref)
 pols
 # Let’s check what kind of object pols is.
 class(pols)
# And what is inside of it
 showDefault(pols)
 # load raster package to see how spatial objects are printed
 library(raster)
 pols
 # Generate random area values, same quantity as points and need a data.frame to store the data in rows 
 Area <- runif(nrow(lonlat), min=0, max=100)
 df <- data.frame(ID=1:nrow(lonlat), area=Area)
 # Combine the SpatialLines with the data.frame.
 polsdf <- SpatialPolygonsDataFrame(pols, data=df)
 # to see what is inside
 str(pols)
# See the graph
h=pols
plot(h)