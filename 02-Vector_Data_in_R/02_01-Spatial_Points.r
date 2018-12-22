# Data entry
source("final/helpers/sample_data.r")
# Now create a SpatialPoints object
 library(sp)
 pts <- SpatialPoints(lonlat)
 # Let’s check what kind of object pts is.
 class (pts)
# And what is inside of it
 showDefault(pts)
 # "bbox" is bounding box or spatial extent and there is no defined coordinate reference system (CRS)
 # let provide a CRS
 crdref <- CRS('+proj=longlat +datum=WGS84')
 pts <- SpatialPoints(lonlat, proj4string=crdref)
 # load raster package to see how spatial objects are printed
 library(raster)
 pts
 # Generate random precipitation values, same quantity as points and need a data.frame to store the data in rows 
 precipvalue <- runif(nrow(lonlat), min=0, max=100)
 df <- data.frame(ID=1:nrow(lonlat), precip=precipvalue)
# Combine the SpatialPoints with the data.frame.
 ptsdf <- SpatialPointsDataFrame(pts, data=df)
 ptsdf
 # to see what is inside
 str(ptsdf)
 # or
 showDefault(ptsdf)
 plot(ptsdf)