landscape_generate<-function(patches = 40, time_steps = 2000, env1Scale = 500, spatial_env = TRUE, temporal_env = TRUE, burn_in = 200) {
  library(ggplot2)
  library(som.nn)
  Tmax<-time_steps +burn_in

  repeat {
    landscape<-round(data.frame(x = runif(patches, min = 1, max = 100), y = runif(patches, min = 1, max = 100)))
    if(dim(unique(landscape))[1] == dim(landscape)[1]) {break}
  }

  dist_mat <- as.matrix(dist.torus(coors = landscape))

  disp_mat<-exp(-0.1*dist_mat)
  diag(disp_mat) <- 0
  disp_mat <- apply(disp_mat, 1, function(x) x/sum(x))


  #generate spatially autocorrelated environment####
  require(RandomFields)
  require(vegan)
  require(dplyr)
  repeat {
    model <- RMexp(var=0.5, scale=env1Scale) + # with variance 4 and scale 10
      RMnugget(var=0) + # nugget
      RMtrend(mean=0.05) # and mean

    RF<-RFsimulate(model = model,x = landscape$x*10, y = landscape$y*10, T = (1+burn_in):Tmax)
    env.df<-data.frame(env1 = decostand(RF$variable1,method = "range"), x= landscape$x, y = landscape$y, time = rep((1+burn_in):Tmax,each = patches))
    burn.env1<-env.df[env.df$time == burn_in+1,]
    if((max(burn.env1$env1)-min(burn.env1$env1)) > 0.6) {break}
  }
  burn.env1$time<-NULL
  burn.env<-left_join(data.frame(time = rep(1:burn_in,each = patches),x = landscape$x, y = landscape$y), burn.env1)
  env.df<-bind_rows(burn.env,env.df)

  model <- RMexp(var=0.5, scale=100) + # with variance 4 and scale 10
    RMnugget(var=0) + # nugget
    RMtrend(mean=0.05) # and mean
  RF<-RFsimulate(model = model,x = landscape$x, y = landscape$y, T = 1)
  env.df$env2<-c(decostand(RF$variable1,method = "range"))

  ecum <- ecdf(env.df$env1)
  env.cum <- ecum(env.df$env1)
  env.df$env1 <- env.cum

  ecum <- ecdf(env.df$env2)
  env.cum <- ecum(env.df$env2)
  env.df$env2 <- env.cum

  ggplot(env.df, aes(x = time, y = env1, group = interaction(x,y), color=interaction(x,y)))+
    geom_line()+
    scale_color_viridis_d(guide=F)

  #par(mfrow=c(1,2))
  #plot.igraph(graph,layout = data.matrix(landscape),vertex.color=viridis(100)[1+env.df$env1[env.df$time==1]*99], vertex.label=NA, main = "env1")
  #plot.igraph(graph,layout = data.matrix(landscape),vertex.color=viridis(100,option = "B")[1+env.df$env2[env.df$time==1]*99], vertex.label=NA, main = "env2")
  #par(mfrow = c(1,1))

  return(list(env.df=env.df,disp_mat =disp_mat,landscape = landscape, Tmax  = Tmax, burn_in = burn_in))
}
