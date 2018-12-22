# Creating Raster* objects
## Example of creating and changing a RasterLayer object ‘r’ from scratch.

library(raster)
## RasterLayer with the default parameters
x <- raster()
x

## With some other parameters
x <- raster(ncol=36, nrow=18, xmn=-1000, xmx=1000, ymn=-100, ymx=900)

# These parameters can be changed. Resolution:
res(x)
res(x) <- 100
res(x)
x

## Change the number of columns (this affects the resolution).
ncol(x)
ncol(x) <- 18
ncol(x)
res(x)
x

## Set the coordinate reference system (CRS) (i.e., define the projection).
projection(x) <- "+proj=utm +zone=48 +datum=WGS84"
x

## Another example empty raster geometry.
r <- raster(ncol=10, nrow=10)
ncell(r)
hasValues(r)

## Use the ‘values’ function.
values(r) <- 1:ncell(r)

# Another example.
set.seed(0)
values(r) <- runif(ncell(r))
hasValues(r)
inMemory(r)
values(r)[1:10]
plot(r, main='Raster with 100 cells')

## Values are not lost when changing the extent
hasValues(r)
res(r)
dim(r)
xmax(r)

## Now change the maximum x coordinate of the extent (bounding box) of the RasterLayer.
xmax(r) <- 0
hasValues(r)
res(r)
dim(r)

## And the number of columns (the values disappear)
ncol(r) <- 6
hasValues(r)
res(r)
dim(r)
xmax(r)

## Example file installed with the package. Do not use this system.file construction of your own files

filename <- system.file("external/test.grd", package="raster")
filename
r <- raster(filename)
filename(r)
hasValues(r)
inMemory(r)
plot(r, main='RasterLayer from file')

## Multi-layer objects can be created in memory (from RasterLayer objects) or from files.

## Create three identical RasterLayer objects
r1 <- r2 <- r3 <- raster(nrow=10, ncol=10)
## Assign random cell values
values(r1) <- runif(ncell(r1))
values(r2) <- runif(ncell(r2))
values(r3) <- runif(ncell(r3))

## Combine three RasterLayer objects into a RasterStack.
s <- stack(r1, r2, r3)
s
nlayers(s)
plot(s)

## Or combine the RasterLayer objects into a RasterBrick.
b1 <- brick(r1, r2, r3)
plot(b1)

## This is equivalent to:
b2 <- brick(s)
plot(b2)

## You can also create a RasterBrick from a file.
filename <- system.file("external/rlogo.grd", package="raster")
filename
b <- brick(filename)
b
nlayers(b)

## Extract a single RasterLayer from a RasterBrick (or RasterStack).
r <- raster(b, layer=2)
## In this case, that would be equivalent to creating it from disk with a band=2 argument.
r <- raster(filename, band=2)

# Raster algebra
# Many generic functions that allow for simple and elegant raster algebra.

# Create an empty RasterLayer and assign values to cells.
r <- raster(ncol=10, nrow=10)
values(r) <- 1:ncell(r)

# Now some algebra.
s <- r + 10
s <- sqrt(s)
s <- s * r + 5
r[] <- runif(ncell(r))
r <- round(r)
r <- r == 1
plot®

# You can also use replacement functions.
s[r] <- -0.5
s[!r] <- 5
s[s == 5] <- 15
plot(s)

# If you use multiple Raster objects, these must have the same resolution and origin.

r <- raster(ncol=5, nrow=5)
r[] <- 1
s <- stack(r, r+1)
q <- stack(r, r+2, r+4, r+6)
x <- r + s + q
x
plot(r)
plot(s)
plot(q)
plot(x)

# Summary functions always return a RasterLayer object.

a <- mean(r,s,10)
b <- sum(r,s)
st <- stack(r, s, a, b)
sst <- sum(st)
sst
plot(a)
plot(b)
plot(st)
plot(sst)

# Use cellStats if you want a single number summarizing the cell values of each layer.
cellStats(st, 'sum')
cellStats(sst, 'sum')