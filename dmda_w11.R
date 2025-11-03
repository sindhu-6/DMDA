-------11a---------

x<-seq(-10,10,by=.1)
y<-dnorm(x,mean=2.5,sd=0.5)
png(file="dnorm.png")
plot(x,y)
dev.off()

x<-seq(-10,10,by=.2)
y<-pnorm(x,mean=2.5,sd=0.5)
png(file="pnormm.png")
plot(x,y)
dev.off()

x<-seq(0,1,by=0.02)
y<-qnorm(x,mean=2,sd=1)
png(file="qnorm.png")
plot(x,y)
dev.off()

y<-rnorm(50)
png(file="rnorm.png")
hist(y,main="Normal Distribution")
dev.off()

----------11b----------

x<-seq(0,50,by=1)
y<-dbinom(x,50,0.5)
png(file="dbinom.png")
plot(x,y)
dev.off()

x<-pbinom(26,51,0.35)
plot(x)
print(x)

x<-qbinom(0.25,51,1/2)
print(x)
plot(x)

x<-rbinom(8,150,.4)
print(x)
plot(x)
