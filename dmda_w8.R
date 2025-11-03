a)
------mean: --------------

x <-c(12,7,3,4.2,18,2,54,-21,8,-5)
result=mean(x)
print(result)

-------trim:------------------

x <-c(12,7,3,4.2,18,2,54,-21,8,-5)
result=mean(x,trim=0.3)
print(result)

--------NA option--------------

x <-c(12,7,3,4.2,18,2,54,-21,8,-5)
result=mean(x,na.rm=TRUE)
print(result)

------median----------------

x <-c(12,7,3,4.2,18,2,54,-21,8,-5)
result=median(x)
print(result)

--------------mode-------------------

getmode <- function(v){
  uniquev <- unique(v)
  uniquev[which.max(tabulate(match(v,uniquev)))]
}
v<-c(1,33,5,6,44,7,73,55,33,54)
result=getmode(v)
print(result)
v<-c("it","CSE","CSE","aiml","it","CSE")
result=getmode(v)
print(result)

-----------------------b)--------------------------

input <- mtcars[,c("am","mpg","hp")]
print(head(input))
result1 <- aov(mpg~hp*am,dat=input)
result2 <- aov(mpg~hp+am,data=input)
print(anova(result1,result2))
boxplot(anova(result1,result2))
