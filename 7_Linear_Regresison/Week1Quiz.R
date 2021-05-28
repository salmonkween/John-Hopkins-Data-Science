#Question 1: what is mu value to minimize the fucntion
x <- c(0.18, -1.54, 0.42, 0.95)
w <- c(2, 1, 3, 1)
mu <- sum(x*w)/ sum(w)

#Question 2: Fit the regression through the origin and get the slope treating y
# as the outcome and x as the regressor
x2 <- c(0.8, 0.47, 0.51, 0.73, 0.36, 0.58, 0.57, 0.85, 0.44, 0.42)
y2 <- c(1.39, 0.72, 1.55, 0.48, 1.19, -1.59, 1.23, -0.65, 1.49, 0.05)
coef(lm(y2 ~ x2 - 1))       # snce we want the fitted line to go through the origin
                                # -1 AND bybass the intercept


#Question 3:  mpg as the outcome and weight as the predictor
data("mtcars")
lm(mtcars$mpg ~ mtcars$wt, data=mtcars)

#Question 4: Y outcome X predictor. SDx = 1/2 SDy. Cor(Y,X) =0.5 what is the slope
# b1 = cor (Y,X) SD Y/X
B1<- 0.5*2

#Question 5: Student test score is normalizec(x-Xbar /n). Cor(test 1, test 2 )=0.4
#what is the expected score on test 2 if they have 1.5 normalized score on test 1

testscore2Bo<- 0+0.4*1.5

#Question 6: day care data. 
#Consider the data given by the following
#What is the value of the first measurement if x were normalized
x6 <- c(8.58, 10.46, 9.01, 9.64, 8.86)
# first normalize
((x6-mean(x6))/sd(x6))    # x- xbar/ sd(x)

#Question 7:  x as the predictor and y as the outcome?
x7 <- c(0.8, 0.47, 0.51, 0.73, 0.36, 0.58, 0.57, 0.85, 0.44, 0.42)
y7 <- c(1.39, 0.72, 1.55, 0.48, 1.19, -1.59, 1.23, -0.65, 1.49, 0.05)
coef(lm(y7~x7))

#Question 9: what value minimize the sum of square between these points and 
#itself

x9 <- c(0.8, 0.47, 0.51, 0.73, 0.36, 0.58, 0.57, 0.85, 0.44, 0.42)

# the least square estimate is the mean



