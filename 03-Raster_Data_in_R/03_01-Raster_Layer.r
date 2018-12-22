# create a RasterLayer from scratch.
 library(raster)
 r <- raster(ncol=10, nrow=10, xmx=-80, xmn=-150, ymn=20, ymx=60)
 r
 # assign a vector of random numbers with a length that is equal to the number of cells of the RasterLayer
 values(r) <- runif(ncell(r))
 r
 # can also assign cell numbers (in this case overwriting the previous values)
 values(r) <- 1:ncell(r)
 r
#see the image
plot(r)
# add polygon and points
lon <- c(-116.8, -114.2, -112.9, -111.9, -114.2, -115.4, -117.7)
lat <- c(41.3, 42.9, 42.4, 39.8, 37.6, 38.3, 37.6)
lonlat <- cbind(lon, lat)
pols <- spPolygons(lonlat, crs='+proj=longlat +datum=WGS84')
points(lonlat, col='red', pch=20, cex=3)
# dev.off()
# plot(pols, border='blue', lwd=2, add=TRUE)
plot(pols, border='blue', lwd=2)

# Line and polygon
  x1 <- rbind(c(-180,-20), c(-140,55), c(10, 0), c(-140,-60))
  x2 <- rbind(c(-10,0), c(140,60), c(160,0), c(140,-55))
  x3 <- rbind(c(-125,0), c(0,60), c(40,5), c(15,-45))
  x4 <- rbind(c(41,-41.5), c(51,-35), c(62,-41), c(51,-50))
     
   a <- spLines(x1, x2, x3, x5)
  plot(a)   
   b <- spLines(x1, list(x2, x3), attr=data.frame(id=1:2), crs='+proj=longlat +datum=WGS84')
   b
hole <- rbind(c(-150,-20), c(-100,-10), c(-110,20))
d <- spPolygons(list(x1,hole), x2, list(x3, x4))
     
att <- data.frame(ID=1:3, name=c('a', 'b', 'c'))
 e <- spPolygons(list(x1,hole), x2, list(x3, x4), attr=att, crs='+proj=longlat +datum=WGS84')
e
plot(e)