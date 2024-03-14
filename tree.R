library(rpart,quietly = TRUE)
library(caret,quietly = TRUE)
library(rpart.plot,quietly = TRUE)
library(rattle)
library(tibble)
library(rpart)
library(bitops)
mushrooms <- read.csv("mushrooms.csv")
# structure of the data
str(mushrooms)
mushrooms
install.packages("readxl")
library(readxl)
# number of rows with missing values
nrow(mushrooms) - sum(complete.cases(mushrooms))
mushrooms$veil.class<- NULL
mushrooms$veil.class
table(mushrooms$class,mushrooms$odor)
number.perfect.splits<- apply(X=mushrooms[-1], MARGIN = 2, FUN = function(col){
  t <- table(mushrooms$class,col)
  sum(t == 0)
})
par(mar=c(10,2,2,2))
barplot(number.perfect.splits,
        main="Number of perfect splits vs feature",
        xlab="",ylab="Feature",las=2,col="wheat")
set.seed(12345)
train <- sample(1:nrow(mushrooms),size = ceiling(0.80*nrow(mushrooms)),replace = FALSE)
# training set
mushrooms_train<- mushrooms[train,]
# test set
mushrooms_test<- mushrooms[-train,]
# penalty matrix
penalty.matrix<- matrix(c(0,1,10,0), byrow=TRUE, nrow=2)
tree <- rpart(class~.,
              data=mushrooms_train,
              parms = list(loss = penalty.matrix),
              method = "class")
rpart.plot(tree, nn=TRUE)
#Testing the model
pred <- predict(object=tree,mushrooms_test[-1],type="class")
#Calculating accuracy
t <- table(mushrooms_test$class,pred)
t
