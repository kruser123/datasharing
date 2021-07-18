# Assignment #3
# Hierarchical Clustering

# install.packages("klaR")
# load and display the data
library(klaR)
Sport_Team_Data <- Assignment_3_4_data

#Select only the numeric metrics and scale data for clustering
team_metrics <- Sport_Team_Data
team_metrics<-team_metrics[,2:9]
team_metrics <-scale(team_metrics)

#Perform Hierarchical clustering
hc <- hclust(dist(team_metrics),method = "complete")

#Confirm the linkage method and distance measure
hc$method

hc$dist.method

#Visualize dendrogram and see the heights where clusters were joined
plot(as.dendrogram(hc))

hc$height

#Identify two most similar athletes
cutree(hc,h=.03)

plot(as.dendrogram(hc),ylim=c(0,1))

#identify a potential cutpoint 
plot(as.dendrogram(hc))
abline(h=1,lty=2,col="dodgerblue")

#Perform cut and save groups
(my.cut <- cutree(hc,h=3))

athlete.groups <- vector("list",max(my.cut))
for(i in 1:length(athlete.groups)){
  athlete.groups[[i]] <- names(my.cut)[which(my.cut==i)]
}
athlete.groups
