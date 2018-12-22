 # you can make a RasterStack from multiple layers.
library(raster)
r <- raster(ncol=10, nrow=10, xmx=-80, xmn=-150, ymn=20, ymx=60)
r
# assign a vector of random numbers with a length that is equal to the number of cells of the RasterLayer.
values(r) <- runif(ncell(r))
r
#create more layer for rasterstack
 r2 = r*r
 r3  = sqrt(r)
 s = stack(r, r2, r3)
 s
#see the graph
plot(s)
