name <- LETTERS[1:10]
longitude <- c(-116.7, -120.4, -116.7, -113.5, -115.5, -120.8, -119.5, -113.7, -113.7, -110.7)
latitude <- c(45.3, 42.6, 38.9, 42.1, 35.7, 38.9, 36.2, 39, 41.6, 36.9)
stations <- cbind(longitude, latitude)

# Simulated rainfall data
set.seed(0)
precip <- (runif(length(latitude))*10)^3
psize <- 1 + precip/500
plot(stations, cex=psize, pch=20, col='red', main='Precipitation')

# add names to plot
text(stations, name, pos=4)

# add a legend
breaks <- c(100, 500, 1000, 2000)
legend("topright", legend=breaks, pch=20, pt.cex=psize, col='red', bg='gray')
lon <- c(-116.8, -114.2, -112.9, -111.9, -114.2, -115.4, -117.7)
lat <- c(41.3, 42.9, 42.4, 39.8, 37.6, 38.3, 37.6)
x <- cbind(lon, lat)

plot(stations, main='Precipitation')

polygon(x, col='blue', border='light blue')
lines(stations, lwd=3, col='red')
points(x, cex=2, pch=20)
points(stations, cex=psize, pch=20, col='red', main='Precipitation')

 wst <- data.frame(longitude, latitude, name, precip)
 wst
