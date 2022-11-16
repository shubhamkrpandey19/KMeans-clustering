#libraries need to be call
library(cluster)
library(tibble)
library(tidyr)
library("factoextra")


#Import Dataset and remove Target varible from the dataset
Dataset<-read.csv(file.choose())
Dataset1<- Dataset[,6:ncol(Dataset)]

#To get the optimal number of clusters using Elbow method
#WCSS=within cluster sum of square
fviz_nbclust(Dataset1, kmeans, method = "wss")

#If you get optimal number of clusters e.g., 5
clusters <- kmeans(Dataset1, 5)

#Extract the datasets based on their smiliarities
for (i in 1:5) {
  write.csv(Dataset[clusters$cluster==i,], paste0('C:\\Users\\skpandey1\\OneDrive - The University of Alabama\\Machine Learning Project\\Melting Point Point Prediction\\Datasets\\Dataset_clusters\\Dataset',i,'.csv'))
}


#Thank you
