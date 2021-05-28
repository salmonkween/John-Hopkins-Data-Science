#Question 1: P-value for the two sided hypothesis test of whether B1 
# from a linear regression model is 0 or not

x <- c(0.61, 0.93, 0.83, 0.35, 0.54, 0.16, 0.91, 0.62, 0.62)
y <- c(0.67, 0.84, 0.6, 0.18, 0.85, 0.47, 1.1, 0.65, 0.36)
summary(lm(y~x))

#Question 2: use result from question 1

#Question 3: fit the linear regression of weight (predictor) on mpg (outcome).
# Get a 95% confidence interval for the expected mpg (INTERCEPT) at the average weight
# IMPORTANT: AT THE AVERAGE WEIGHT ->> CENTRALIZE WEIGHT(x axis)
data(mtcars)
Q2<- summary(lm(mtcars$mpg ~ I(mtcars$wt- mean(mtcars$wt)), data=mtcars))
Q2
#95% confidence interval
CI3<- Q2$coefficients[1,1] + c(1,-1)*qt(0.975, df = 30)*Q2$coefficients[1,2]
CI3

#Question 5: a car weight 3000 lb, Construct 95% interval for mpg(y axis)
Q5<-  lm(mpg ~ wt, data = mtcars)
Q5

# use predict ( ) to estimate the corresponding y interval

predict(Q5, newdata = data.frame(wt = 3), interval ="prediction")

#Question 6 the 95% confidence interval FOR THE EXPECT CHANGEC(slope) per 2000lb increase
# originally it was per 1000lb increase    mew x = old X x 2

#change the unit from 1000lb to 2000lb
Q6<-lm(mpg ~ I(wt*0.5), data = mtcars)
Q6_2<- summary(Q6)
CI6<- Q6_2$coefficients[2,1] + c(1,-1)*qt(0.975, df = 30)*Q6_2$coefficients[2,2]


#Question 9: same mtcars dataset
#basically find R square. COmpare model with just an intercept (numerator) Y-Ybar
#vs the model with slope and intercept (regression model)

summary(lm(mpg~wt, data= mtcars))
1-0.7528
