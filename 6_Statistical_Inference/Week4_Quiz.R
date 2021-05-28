#Question 1: baseline vs treatment mean. Ho: there is mean reduction between 2 treatments
#Two sided test p value, paired
baseline <- c(140,138,150,148,135)
week2 <- c(132,135,151,146,130)
subject<-c(1,2,3,4,5)
question1<-data.frame(subject, baseline, week2)
library(UsingR)
t.test(x= question1$baseline, y=question1$week2, alt ="two.sided", paired = TRUE)

#Question 2: A sample of 9 men yield has brain volume mean 1100, sd= 30
#What is a value of uo so that Ho woud fail to reject in a two sided 5% t tets
# since this is two sided -> find the 97.5 interval
meanbrain<- 1100
sdbrain<-30
meanbrain+c(-1,1)*qt(0.975, 8)*sdbrain/sqrt(9)


# Question 3: total of 4 people. 3/4 chose coke over pepsi. Caclulate p value
#for Ho that people prefer coke over pepsi, one sided test >-2
#since there is only two option cokr or pepsi -> pbinom
pbinom(2,4,0.5, lower.tail = FALSE
       )

#Question 4: Infection rate benchmark is 1/100. 
#Recently the hospital saw 10/1787 ifection cases.What is the one sided p value 
#whether or not the hospital below the benchmark
ppois(10, lambda = 1/100 * 1787)

#Question 5:  9 patients to diet pill and 9 to placebo.
# Diet pill group: mean -3, sd 1.5
#placebo group mean 1, sd= 1.8
#Does the mean seem to be different between 2 groups
# p value for two sided test
ntreat <- nplacebo <- 9
mean_treat <- -3 ##treated
mean_placebo <- 1 ##placebo
sdtreat <- 1.5 ##treated
vartreat<- 1.5^2
sdplacebo<- 1.8 ##placebo
varplacebo <- 1.8^2

#Find pooled variance
pool_variance<- sqrt(((nplacebo - 1) * varplacebo + (ntreat- 1) * vartreat)/(nplacebo+ ntreat - 2))

# Find p value for the two sided test
ts<- ((mean_treat- mean_placebo))/(pool_variance*sqrt(1/ntreat+1/nplacebo)^0.5)
pt(ts, df=9+9-2)

#Question 6 Brain volume of 9 men yield 90th confidence interval 1077-1123 
# would you reject 1078 in two sided 5% test
# no becuase 90 is narrower than 95 ->> if it is 90, it will be in 95 interval


# Question 7 n= 100 healthy men. to detect volume loss 0.01. Sd between four year 
# is 0.04. What is power of the study for a 5% one sided test 
#versus a null hypothesis of no volume loss?

power.t.test(100,delta = 0.01, sd= 0.04, type = "one.sample", alt="one.sided")$power

#QUestion 8 Researcher wantto detect volume loss 0.01. Sd between four year 
# is 0.04. What is the value of n needed for 90% power of type one error rate of 
# %5% one sided test versus a null hypothesis of no volume loss

#So power is 0.9
power.t.test(power = 0.9, delta = 0.01, sd= 0.04, type="one.sample", alt="one.sided")$n
