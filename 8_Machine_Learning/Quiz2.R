# Question 2

library(AppliedPredictiveModeling)
data(concrete)
library(caret)
set.seed(1000)
inTrain = createDataPartition(mixtures$CompressiveStrength, p = 3/4)[[1]]
training = mixtures[ inTrain,]
testing = mixtures[-inTrain,]

# plot of the outcome (CompressiveStrength) versus the index of the samples
library(ggplot2)
library(Hmisc)
training1<-training
#use seq_along to make index and plot compressivestrength
index<-seq_along(1:nrow(training))
ggplot(data = training1, aes(x = index, y = CompressiveStrength)) + geom_point()+ theme_bw()
#there is step like pattern for the plot -> explaining that there is missing variable

training1$CompressiveStrength<-cut2(training1$CompressiveStrength, g=4)   # cut the variable into 2 pairs
ggplot(data = training1, aes(y = index, x = CompressiveStrength)) + geom_boxplot()+
        geom_point()+ theme_bw()

#Question 3: 
library(AppliedPredictiveModeling)
data(concrete)
library(caret)
set.seed(1000)
inTrain = createDataPartition(mixtures$CompressiveStrength, p = 3/4)[[1]]
training = mixtures[ inTrain,]
testing = mixtures[-inTrain,]

# Question 3: Make a histogram and confirm the SuperPlasticizer variable is skewed.

par(mfrow=c(1,2))
hist(training$Superplasticizer)
hist(log(training$Superplasticizer + 1))
# still skewed after taking log

# Question 4: 
library(caret)
library(AppliedPredictiveModeling)
set.seed(3433)
data(AlzheimerDisease)
adData = data.frame(diagnosis,predictors)
inTrain = createDataPartition(adData$diagnosis, p = 3/4)[[1]]
training = adData[ inTrain,]
testing = adData[-inTrain,]

#Find all the predictor variables in the training set that begin with IL. 
#Perform principal components on these variables with the preProcess() function 
#Calculate the number of principal components needed to capture 80% of the variance.


trainingIL<-training[ ,grep("IL",names(training))]    #grab IL variable
trainingILprocess<-preProcess(trainingIL, method = "pca", thresh = 0.8)
trainingILprocess


# Question 5: 
library(AppliedPredictiveModeling)
set.seed(3433)
data(AlzheimerDisease)
adData = data.frame(diagnosis,predictors)
inTrain = createDataPartition(adData$diagnosis, p = 3/4)[[1]]
training = adData[ inTrain,]
testing = adData[-inTrain,]

#  Build two predictive models, one using the predictors as they are and
# one using PCA with principal components explaining 80% of the variance in the predictors. 
#Use method="glm" in the train function.

#What is the accuracy of each method in the test set? Which is more accurate?
#grab the data set with variable start with IL
trainingIL<-training[ ,grep("^IL|diagnosis",names(training))]    #grab IL variable
testingIL<-testing[ ,grep("^IL|diagnosis",names(testing))]

#PCA copy from question 4
trainingILprocess<-preProcess(trainingIL, method = "pca", thresh = 0.8)
trainingILpredict<-predict(trainingILprocess, trainingIL)
modelfitPCA<-train(diagnosis~ ., method ="glm",data=trainingILpredict)        

testPCpredict<-predict(trainingILprocess, testingIL)
confusionMatrix(testingIL$diagnosis, predict(modelfitPCA, testPCpredict))

#NON PCA

trainingILNonPC<-preProcess(trainingIL,method = "glm", thresh = 0.8)
trainingILnonPCpred<-predict(trainingILNonPC, trainingIL)
modelfitnonPCA<-train(diagnosis~ ., method ="glm",data=trainingILnonPCpred)        

testnonPCpredict<-predict(trainingILNonPC, testingIL)
confusionMatrix(testingIL$diagnosis, predict(modelfitnonPCA, testnonPCpredict))

#FASTER WAY
model <- train(diagnosis ~ ., data = trainingIL, method = "glm")
predict_model <- predict(model, newdata= testingIL)
matrix_model <- confusionMatrix(predict_model, testingIL$diagnosis)
matrix_model
