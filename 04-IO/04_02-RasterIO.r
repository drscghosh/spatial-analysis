# Reading

f <- system.file("external/rlogo.grd", package="raster")
f
## You can create  bands of a layer
 r1 <- raster(f)
 r1
 r2 <- raster(f, band=2)
 r2
## If you would want all layers in a single object. For that you can use the brick function.
 b <- brick(f)
 b
## Or you can use stack, but that is less efficient in most cases.
##  s <- stack(f)
##  s

# Writing

x <- writeRaster(b, 'output.tif', overwrite=TRUE)
x
h=raster("output.tif")
plot(h)
