# Now let’s look at an example with a spatial data set in R.
library(raster)
library(rgdal)
f <- system.file("external/lux.shp", package="raster")
p <- shapefile(f)
p
# We can inspect the coordinate reference system like this.
crs(p)

    ## Assigning CRS
    pp <- p
    crs(pp) <- NA
    crs(pp)
    crs(pp) <- CRS("+proj=longlat +datum=WGS84")
    crs(pp)