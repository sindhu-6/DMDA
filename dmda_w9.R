
---9a-------

x<-c(1,2,3,4,5)
y<-c(1.2,1.8,2.6,3.2,3.8)
result<-lm(y~x)
print(summary(result))
png(file="LinearRegressiongraph.png")
plot(x,y,col="red",main="weekly sales report",abline(lm(y~x)),cex=1.3,pch=16,xlab="weeks",ylab="sales")
dev.off()

--------b--------

input<-mtcars[,c("mpg","wt","disp","hp")]
result<-lm(mpg~wt+disp*hp,data=input)
print(summary(result))
png(file="Multilinearregression.png")
plot(result)

#residualPlots(result)
dev.off()

-------logistic--------

claimants<-read.csv("C:/Users/student/Desktop/5cr/claimants.csv")
sum(is.na(claimants))
claimants<-na.omit(claimants)
logit<-glm(ATTORNEY~factor(CLMSEX)+factor(CLMINSUR)+factor(SEATBELT)+CLMAGE+LOSS,family="binomial",data=claimants)
summary(logit)
prob=predict(logit,type=c("response"),claimants)
prob
confusion<-table(prob>0.5,claimants$ATTORNEY)
confusion
Accuracy<-sum(diag(confusion))/sum(confusion)
Accuracy
install.packages("ROCR")
install.packages("pROC")
library(ROCR)
library(pROC)
rocrpred<-prediction(prob,claimants$ATTORNEY)
rocrperf<-performance(rocrpred,'tpr','fpr')
plot(rocrperf,colorize=T,text.adj=c(-0.2,1.7))
auc<-auc(claimants$ATTORNEY~prob)
auc

----------poisson------

input<- warpbreaks
print(head(input))
plot(input)
output<-glm(formula = breaks~wool+tension,data =input,family = poisson)
print(summary(output))
plot(output)



input<- warpbreaks
print(head(input))
plot(input)
output<-glm(formula = breaks~wool+tension,data =warpbreaks,family = poisson)
print(summary(output))
plot(output)
