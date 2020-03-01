landscape_generate <- function(patches = 100, xy, plot = TRUE) {
  if (missing(xy)){
    repeat {
      landscape<-round(data.frame(x = runif(patches, min = 1, max = 100), y = runif(patches, min = 1, max = 100)))
      if (dim(unique(landscape))[1] == dim(landscape)[1]) {break}
    }
    clusters <- hclust(dist(landscape),method = "ward.D2")

    landscape <- landscape[clusters$order, ]
    rownames(landscape) <- 1:patches

  } else {
    landscape <- xy
  }
  if (plot == TRUE){
    plot(landscape, pch = 19)
  }
  return (landscape)
}

dispersal_matrix <- function(landscape, torus = TRUE, disp_mat, kernel_exp = 0.1, plot = TRUE){
  if (missing(disp_mat)){
    if(torus == TRUE){
      dist_mat <- as.matrix(som.nn::dist.torus(coors = landscape))
    } else {
      dist_mat <- as.matrix(dist(landscape))
    }

    disp_mat <- exp(-kernel_exp * dist_mat)
    diag(disp_mat) <- 0
    disp_mat <- apply(disp_mat, 1, function(x) x / sum(x))
  } else {
    disp_mat <- disp_mat
    rownames(disp_mat) <- 1:nrow(disp_mat)
    colnames(disp_mat) <- 1:ncol(disp_mat)
    if (is.matrix(disp_mat) == FALSE) stop ("disp_mat is not a matrix")
    if (nrow(disp_mat) != nrow(landscape) | ncol(disp_mat) != nrow(landscape)) stop ("disp_mat does not have a row and column for each patch in landscape")
  }

  if (sum(colSums(disp_mat) > 1.001) > 0) warning ("dispersal from a patch to all others exceeds 100%. Make sure the rowSums(disp_mat) <= 1")
  if (sum(colSums(disp_mat) < 0.999) > 0) warning ("dispersal from a patch to all others is less than 100%. Some dispersing individuals will be lost from the metacommunity")

  if (plot == TRUE){
    g <- as.data.frame(disp_mat) %>%
      dplyr::mutate(to.patch = rownames(disp_mat)) %>%
      tidyr::gather(key = from.patch, value = dispersal, -to.patch) %>%
      dplyr::mutate(from.patch = as.numeric(as.character(from.patch)),
                    to.patch = as.numeric(as.character(to.patch))) %>%
    ggplot2::ggplot(ggplot2::aes(x = from.patch, y = to.patch, fill = dispersal))+
      ggplot2::geom_tile()

    print(g)
  }

  return (disp_mat)
}

