#Question 1: Influenza. P(p) = 0.17%, P(f)= 0.12  P(FM) = 0.06%. What is the 
#probability that mother P(M) has influenza
PAuB<- 0.17
PA<- 0.12
PAnB<- 0.06
PB<-PAuB - PA +PAnB
PB

#Question 2 0-1 density. ask: what is 75th percentile

#Question 3: head X, tail Y dollars. What has to be true so that the X-Y =0
P_H <- p
# you expect earning px - (1-p)Y =0 ->px = (1-p)Y => Y/X = p/1-p

#Question 4: normal distribution symmetric around 0-> median will be 0
# median divide 50% of uper and lower data points

#Question 5: probability mass function
x <- 1:4
p <- x/sum(x)
temp <- rbind(x, p)
rownames(temp) <- c("X", "Prob")
temp

#what is the mean????? 
mean5<- sum(x*p)

#Question 6 Women collect their urine and test on their own, sensitivity 75% P(+/preg)
# specifility 52% P(-|not_preg)   -
# assume positive test, and P(preg( =0.3) -> p not preg 0.7
#What is P(preg|+) ????

Ppos_preg <- 0.75
Pneg_not_preg<-0.52
Ppos_not_preg <- 1-0.52
# Use bayer rule P(preg|+) = P(+|preg)P(preg)/ P(+|preg)P(preg) + P(+|notpreg)P(notpreg)

