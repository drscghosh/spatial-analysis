 # Data entry
source("final/helpers/sample_data.r")
 # Now create a spLines object
library(raster)
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