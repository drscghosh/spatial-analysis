# Vector

newcrs <- CRS("+proj=robin +datum=WGS84")
rob <- spTransform(p, newcrs)
plot(rob)

    ## Backtransform
    p2 <- spTransform(rob, CRS("+proj=longlat +datum=WGS84"))
    plot(p2)


# Raster

r <- raster(xmn=-110, xmx=-90, ymn=40, ymx=60, ncols=40, nrows=40)
r <- setValues(r, 1:ncell(r))
r
    ## Giving projection
    newproj <- "+proj=lcc +lat_1=48 +lat_2=33 +lon_0=-100 +ellps=WGS84"
    pr1 <- projectRaster(r, crs=newproj)
    crs(pr1)
    ## Giving resolution
    pr2 <- projectRaster(r, crs=newproj, res=20000)
    pr2
    ## Giving extent as per the existing file
    pr3 <- projectExtent(r, newproj)
    ## Set the cell size
    res(pr3) <- 200000
    ## Now project, and note the change in the coordinates.
    pr3 <- projectRaster(r, pr3)
    pr3
    plot(pr3)
