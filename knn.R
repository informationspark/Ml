loan<-read.csv("credit_data.csv")
str(loan)
library(caret)
library(ggplot2)
loan.subset<-loan[c('Creditability','Account.Balance','Purpose','Credit.Amount','Length.of.current.employment','Age..years.','Sex...Marital.Status','Occupation')]
normalize<-function(x)
{
  return((x-min(x))/(max(x)-min(x)))
}

loan.subset.n<-as.data.frame(lapply(loan.subset[,2:8],normalize))

set.seed(123)
dat.d<-sample(1:nrow(loan.subset.n),size = nrow(loan.subset.n)*0.7,replace = FALSE)
train.loan<-loan.subset[dat.d,]
test.loan<-loan.subset[-dat.d,]
train.loan_labels<-loan.subset[dat.d,1]
test.loan_labels<-loan.subset[-dat.d,1]

library(class)
knn.26<-knn(train=train.loan,test = test.loan,cl=train.loan_labels,k=26)

ACC.26<-100*sum(test.loan_labels==knn.26)/nrow(test.loan_labels)

i=1
k.optm=1
for(i in 1:28){
  knn.mod<-knn(train = train.loan,test = test.loan,cl=train.loan_labels,k=i)
  k.optm[i]<-100*sum(test.loan_labels==knn.mod)/NROW(test.loan_labels)
  k=i
  cat(k,'=',k.optm[i],'
       ')
}
plot(k.optm,type='b',xlab='k feature',ylab='accuracy')
