getwd()

loyalty<-read.csv("Loyalty data.csv")
# Installing the package
install.packages("caTools")    # For Logistic regression
install.packages("ROCR")       # For ROC curve to evaluate model

library(caTools)
library(ROCR)

attach(loyalty)
loyaltym1<-glm(Loyalty ~ Brand+ Shopping + Product,family="binomial")
summary(loyaltym1)

loyalty$predict1<-predict(loyaltym1,loyalty,type = "response")
str(loyalty)
summary(loyalty$predict1)
loyalty$predict1<-ifelse(loyalty$predict1>0.5,1,0)

# Evaluating model accuracy
# using confusion matrix
table(loyalty$predict1, Loyalty)
