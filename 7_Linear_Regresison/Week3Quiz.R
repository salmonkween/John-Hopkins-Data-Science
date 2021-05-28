#Question 1: mpg as outcome, number of cylinder: factor variable, wt: explanatory variable
# fit lm
# give expect change mpg comparing 8 to 4 cylinder
data("mtcars")
library(dplyr)
mtcars2<- mutate(mtcars, cylfactor = factor(mtcars$cyl))
summary(lm(mpg ~ cylfactor + wt, data=mtcars2))

# reference level is 4 =>> estimate cylfactior 8 is how different mpg in 8 compared ot 4

#Questuon 2:  mpg as outcome, number of cylinder: factor variable, wt: CONFOUNDING variable
# fit lm
# give expect change mpg comparing 8 to 4 cylinder and unadjust by wt
# What is the effect comparing 8 to 4 cylinder with and without wt

# adjusted: including wt
coef(lm(mpg ~ cylfactor+ wt, data=mtcars2))
coef(lm(mpg~cylfactor, data= mtcars2))       #unadjusted
# =>> cylinder has less effect on mpg when add in wt


#Question 3: mpg as outcome, number of cylinder: factor variable, wt: CONFOUNDING variable
#second model : mpg as outcome, and consider interaction between wt and cylinder factor
# give the p value test comparing the two model

model1<- lm(mpg ~ cylfactor+wt, data=mtcars2)       # wt confounding variable
model2<- lm(mpg ~ cylfactor*wt, data=mtcars2)       #interaction variable between wt and cyl
anova(model1, model2)
### OR
install.packages("lmtest")
library(lmtest)
lrtest(model1, model2)

#Both p value from ANOVA and lrtest is smaller than 0.05

#Question 4:  How to interpret tw coefficient
# wt now is 1000 lbs -> wt now = new wt *0,5 => 2000 = 1 tons

summary(lm(mpg ~ I(wt * 0.5) + factor(cyl), data = mtcars))
#Question 5: give the hat diagonal -> influential

x <- c(0.586, 0.166, -0.042, -0.614, 11.72)
y <- c(0.549, -0.026, -0.127, -0.751, 1.344)
fit<- lm(y~x)
hatvalues(fit)

#Question 6: dfbeta value
x6 <- c(0.586, 0.166, -0.042, -0.614, 11.72)
y6 <- c(0.549, -0.026, -0.127, -0.751, 1.344)
fit2<- lm(y6~x6)
dfbetas(fit2)
