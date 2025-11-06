-----10a---------

snowfall<-c(630.4,911.5,683.5,790,1170.8,860.1,1330.6,996.6,783.2,982,881.8,1021)
snowfall_timeseries<-ts(snowfall,start=c(2023,1),frequency=8)
print(snowfall_timeseries)
png(file="snowfall.png")
plot(snowfall_timeseries)
dev.off()

-------b---------

xvalues<-c(-1.6,2.1,2,2.23,3.71,3.25,3.4,3.86,-1.19,2.21)
yvalues<-c(5.19,7.43,6.94,8.11,18.75,14.88,16.06,19.12,3.21,7.58)
png(file="nls.png")
plot(xvalues,yvalues)
model<-nls(yvalues~b1*xvalues^2+b2,start=list(b1=1,b2=3))
model
new.data<-data.frame(xvalues=seq(min(xvalues),max(xvalues),len=100))
lines(new.data$xvalues,predict(model,newdata=new.data))
dev.off()
print(sum(resid(model)^2))
print(confint(model))

---------c-------------

data("iris")
install.packages("caret")
install.packages("C50")
library(caret)
library(C50)
set.seed(7)
inTraininglocal<-createDataPartition(iris$Species,p=.70,list = F)
training<-iris[inTraininglocal,]
testing<-iris[-inTraininglocal,]
model<-C5.0(Species~.,data = training)
summary(model)
pred<-predict.C5.0(model,testing[,-5]) #type ="prob"
a<-table(testing$Species,pred)
sum(diag(a))/sum(a)
plot(model)


--------c(detail)---------

#Data Load
data("iris")
#Install the required packages
install.packages("caret")
install.packages("C50")
#Library invoke
library(caret)
library(C50)
#To make the results consistent across the runs
set.seed(7)
#Data Partition
inTraininglocal<-createDataPartition(iris$Species,p=.70,list = F)
inTraininglocal
training<-iris[inTraininglocal,]
testing<-iris[-inTraininglocal,]

#Model Building
model<-C5.0(Species~.,data = training) 
#Generate the model summary
summary(model)
#Predict for test data set
pred<-predict.C5.0(model,testing[,-5]) #type ="prob"
pred
#Accuracy of the algorithm
a<-table(testing$Species,pred)
sum(diag(a))/sum(a)
#Visualize the decision tree
plot(model)
