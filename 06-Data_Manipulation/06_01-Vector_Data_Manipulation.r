# Example

f <- system.file("external/lux.shp", package="raster")
library(raster)
p <- shapefile(f)
p
par(mai=c(0,0,0,0))
plot(p)

# Basics

## Attributes
### To extract the attributes (data.frame) from a Spatial object, use:
d <- data.frame(p)
head(d)

## Variables
### Extracting a variable.
p$NAME_2

### Sub-setting by variable
p[, 'NAME_2']
### Adding a new variable.
set.seed(0)
p$new <- sample(letters, length(p))
p

### Assigning a new value to an existing variable
p$new <- sample(LETTERS, length(p))
p

### To get rid of a variable.
p$new <- NULL

# Merge
## You can join a table (data.frame) with a Spatial* object with merge
dfr <- data.frame(District=p$NAME_1, Canton=p$NAME_2, Value=round(runif(length(p), 100, 1000)))
dfr <- dfr[order(dfr$Canton), ]
pm <- merge(p, dfr, by.x=c('NAME_1', 'NAME_2'), by.y=c('District', 'Canton'))
pm

# Records
## Selecting rows (records).
i <- which(p$NAME_1 == 'Grevenmacher')
g <- p[i,]
g
plot(g)

# Append and aggregate

## Append
### Object z, consisting of four, and z2 which is one of these four polygons.
z <- raster(p, nrow=2, ncol=2, vals=1:4)
names(z) <- 'Zone'
### coerce RasterLayer to SpatialPolygonsDataFrame
z <- as(z, 'SpatialPolygonsDataFrame')
z
plot(z)

z2 <- z[2,]
plot(p)
plot(z, add=TRUE, border='blue', lwd=5)
plot(z2, add=TRUE, border='red', lwd=2, density=3, col='red')

# To append Spatial* objects of the same (vector) type you can use bind
b <- bind(p, z)
head(b)
tail(b)

## Aggregate
library(rgeos)
pa <- aggregate(p, by='NAME_1')
za <- aggregate(z)
plot(za, col='light gray', border='light gray', lwd=5)
plot(pa, add=TRUE, col=rainbow(3), lwd=3, border='white')

### Aggregate without dissolve
zag <- aggregate(z, dissolve=FALSE)
zag
plot(zag, col="light gray")

### Use disaggregate to split these up into their parts.
zd <- disaggregate(zag)
zd
plot(zd)

# Overlay

## Erase
### Erase a part of a SpatialPolygons object
e <- erase(p, z2)
### This is equivalent to
e <- p - z2
plot(e)

## Intersect
### Intersect SpatialPolygons
i <- intersect(p, z2)
plot(p)
plot(z2)
plot(i)

### This is equivalent to
i <- p * z2
### You can also intersect with an Extent (rectangle).
e <- extent(6, 6.4, 49.7, 50)
pe <- crop(p, e)
plot(p)
plot(pe, col='light blue', add=TRUE)
plot(e, add=TRUE, lwd=3, col='red')

# Union
## Get the union of two SpatialPolygon* objects.
u <- union(p, z)
## This is equivalent to
u <- p + z
u
set.seed(5)
plot(u, col=sample(rainbow(length(u))))

# Cover
## Cover is a combination of intersect and union
cov <- cover(p, z)
cov
plot(cov)

# Difference
## The symmetrical difference of two SpatialPolygons* objects
dif <- symdif(z,p)
dif
plot(dif, col=rainbow(length(dif)))


#Spatial queries
## Query polygons with points.
pts <- matrix(c(6, 6.1, 5.9, 5.7, 6.4, 50, 49.9, 49.8, 49.7, 49.5), ncol=2)
spts <- SpatialPoints(pts, proj4string=crs(p))
plot(z, col='light blue', lwd=2)
points(spts, col='light gray', pch=20, cex=6)
text(spts, 1:nrow(pts), col='red', font=2, cex=1.5)
lines(p, col='blue', lwd=2)

## Use over for queries between Spatial* objects
over(spts, p)
over(spts, z)

## extract is generally used for queries between Spatial* and Raster* objects, but it can also be used here
extract(z, pts)