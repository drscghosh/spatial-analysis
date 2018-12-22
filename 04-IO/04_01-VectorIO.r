# Reading

library(raster)
filename <- system.file("external/lux.shp", package="raster")
filename
s <- shapefile(filename)
s
plot(s)

# Writing

getwd()
outfile <- 'test.shp'
shapefile(s, outfile, overwrite=TRUE)