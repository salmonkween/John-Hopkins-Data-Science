#Question 2: Diastoloc blood pressure in men is normally distributed. Mean 80, SD 10
#What is the probability that men has blood pressure <70
pnorm(70, mean=80, sd=10, lower.tail = TRUE)

#Question 3: Brain volume of women is normally distributed. Mean is 1100, sd= 75
#What is the 95% percentile
qnorm(0.95, mean = 1100, sd = 75)

#Question 4: Same info as question 3. Consider sample size N=100, what is the sample 
# mean?
# sample has similar mean. use sigma/ Vn  to calculate the standard error of sample mean to population mean
qnorm(0.95, mean = 1100, sd= 75/sqrt(100))

#Question 5
#Flip the coin 5 times, what is the probability of getting 4 or 5 heads?
#Binomial distribution p =0.5. 4 5 head mean getting the percentile where x=3
pbinom(3, size = 5, prob = 0.5, lower.tail = FALSE)

#Question 6: RDI measuere sleep disturbance. Population Mean is 15, sd 10
# NOT normally distributed
# probability of sample mean between 14 and 16. Sample size 100
# >>>> standard error 10/sqrt(100) = 1

# the vatiable which is within 1sd from mean is 68%

#Question 7: standard uniform density. Mean 0.5, sd is 1/12
#sample size 1000. Where is the sample mean
# >>> standard error (1/12)/sqrt(1000) = 0.00083
# would be near the population mean

#Question 8 bus top 5 people per hour t = 3 hour. What is the prob of 
#seeing <=10 people
ppois(10, lambda = 3*5)


