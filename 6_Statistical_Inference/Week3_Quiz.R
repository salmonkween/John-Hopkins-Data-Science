# In a sample n=9 mean 1100, sd = 30. What is the 95 interval for mean
mean1<-1100
sd1<- 30
n1<-9
# use 0.975 for lower tail and upper tail 2.5 each
mean1 + c(-1,1)*qt(0.975, n1-1)*sd1/sqrt(9)


#Question 2 sample size 9. average Weight difference follow up-baseline = -2
#what would sd be for the upper end point of 95 interval to be 0
n2<-9
mean2<-(-2)
sd2<- mean2*sqrt(n2)/qt(0.975, n2-1)
sd2

#Question 4 select 20 nights, assign 10 nighs each to test the old and new system
# New system mean 3 hours, sd = 0.6 hour
#old system: mean = 5 hours sd =0.68 hour
# find the 95 interval of the difference between MEAN of new and old system

#check the formula in note. Find pooled variance first
quantile<- 0.975 
# is 95% with 2.5% on both sides of the range
n_y <- 10 # nights new system
n_x <- 10 # nights old system
var_y <- 0.60 # variance new (sqrt of ??)
var_x <- 0.68 # variance old (sqrt of ??)
mean_y <- 3# average hours new system
mean_x <- 5# average hours old system
# calculate pooled standard deviation
mean_p <- sqrt(((n_x - 1) * var_x + (n_y - 1) * var_y)/(n_x + n_y - 2))

#plug in to main equation, df= n2+n1-2 =18
confidenceInterval <- mean_y - mean_x + c(-1, 1) * (qt(0.975, df=18)) * mean_p * (1 / n_x + 1 / n_y)^0.5

#Question 7 Similar to Q4: 9 patients to diet pill and 9 to placebo.
# Diet pill group: mean -3, sd 1.5
#placebo group mean 1, sd= 1.8
# is their difference in mean foor placebo vs treatment group? 90th interval

n4t <- n4p <- 9
xt <- -3 ##treated
xp <- 1 ##placebo
st <- 1.5 ##treated
vart<- 1.5^2
sp<- 1.8 ##placebo
varp <- 1.8^2

#Caclulate pooled variance
pool_variance<- sqrt(((n4p - 1) * varp + (n4t - 1) * vart)/(n4p+ n4t - 2))

#plug in the main equation. 90 interval 1-0.1/2 => 95 interval
confidenceInterval <- xt - xp + c(-1, 1) * qt(0.95, df=n4t+n4p-2) *pool_variance * (1 / n4t + 1 / n4p)^0.5
confidenceInterval
