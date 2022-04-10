library(readxl)
library(tidyverse)
GDP_data <- read_excel("2022-student-research-case-study-economic-data.xlsx", 
                       sheet = "Rarita Economic", range = "B12:F22")
revenue_data <- read_excel("2022-student-research-case-study-football-soccer-data.xlsx", 
                           sheet = "Revenue", skip = 12)
Expense_data <- read_excel("2022-student-research-case-study-football-soccer-data.xlsx", 
                           sheet = "Expense", skip = 12)
#Change the colnames of the revenue data
colnames(revenue_data) <- c("Nation","2020_Total","2020_Matchday","2020_Broadcast","2020_Commercial",
                            "2019_Total","2019_Matchday","2019_Broadcast","2019_Commercial",
                            "2018_Total","2018_Matchday","2018_Broadcast","2018_Commercial",
                            "2017_Total","2017_Matchday","2017_Broadcast","2017_Commercial",
                            "2016_Total","2016_Matchday","2016_Broadcast","2016_Commercial")
colnames(Expense_data) <- c("Nation","2020_Total","2020_staff","2020_other",
                            "2019_Total","2019_staff","2019_other",
                            "2018_Total","2018_staff","2018_other",
                            "2017_Total","2017_staff","2017_other",
                            "2016_Total","2016_staff","2016_other")
Expense_data <- na.omit(Expense_data)
#Find the data of rarita 
rarita_revenue <- revenue_data %>% filter(Nation=="Rarita")
reve_new <- gather(rarita_revenue, key = "character",value = "value",-Nation)
reve_long <-reve_new %>% separate(character, c("year", "character"), "_")
reve_final<-spread(reve_long, character,value )
rarita_expense <- Expense_data %>% filter(Nation == "Rarita")
expense_new <- gather(rarita_expense, key = "character",value = "value",-Nation)
expense_long <-expense_new %>% separate(character, c("year", "character"), "_")
expense_final<-spread(expense_long, character,value )
#The relationship between GDP and football industry
GDP_data <- GDP_data[-c(1:5),-c(2:4)]
GDP_model1 <- lm(GDP_data$Rarita~expense_final$staff+expense_final$other)
summary(GDP_model1)
GDP_model2 <- lm(GDP_data$Rarita~reve_final$Total)
summary(GDP_model2)
#we remove the data of 2020 because of covid-19. This may cause some unpredictable change for result. 
reve_final <- reve_final[-5,]
attach(reve_final)
attach(expense_final)
matchday_rate <- Matchday[-1]/Matchday[-4]
mean_matchday <- mean(matchday_rate[-4])
sd_matchday <- sd(matchday_rate[-4])
Broadcast_rate <- Broadcast[-1]/Broadcast[-4]
mean_Broadcast <- mean(Broadcast_rate[-4])
sd_Broadcast <- sd(Broadcast_rate[-4])
Commercial_rate <- Commercial[-1]/Commercial[-4]
mean_Commercial <- mean(Commercial_rate[-4])
sd_Commercial <- sd(Commercial_rate[-4])
#expense
staff_rate <- staff[-1]/staff[-5]
mean_staff <- mean(staff_rate)
sd_staff <- sd(staff_rate)
other_rate <- other[-1]/other[-5]
mean_other <- mean(other_rate)
sd_other <- sd(other_rate)

#simulation of the revenue

set.seed(123)
n=1100
y1 <- rnorm(n,mean_matchday,sd_matchday);
y2 <- rnorm(n,mean_Broadcast,sd_Broadcast);
y3 <- rnorm(n,mean_Commercial,sd_Commercial);
y<- matrix(NA,nrow =11,ncol = 100)
i=1
j=1
for(j in 1:100){
  for(i in 1:11){
    y[i,j] <- 24.63*prod(y1[((j-1)*11+1):(11*(j-1)+i)])+63.44*prod(y2[((j-1)*11+1):(11*(j-1)+i)])+75.06*prod(y3[((j-1)*11+1):(11*(j-1)+i)])
  }}
y
y_mean <- apply(y,1,mean)
y_mean

y_sd <- apply(y,1,sd)
y_sd

y_95_up <- y_mean + 1.96*y_sd/10
y_95_low <- y_mean - 1.96*y_sd/10
#plot the revenue
plot(y_mean, type= "l",col= "Black",xaxt="n",xlab="Year")
axis(1,2:12,2022:2032)
lines(y_95_up,type="l",col="Red")
lines(y_95_low,type="l",col="Green")
title(main = "The CI of Future Revenue")
legend("bottomright",legend=c("95%Up","Mean","95%Low")
       ,col=c("red","black","green"),lty=1,lwd=2,cex=0.5)
points(x=1:11,y=y_mean, cex=0.5, pch = 20)
text(x= 1:11+0.3, y = y_mean,labels = round(y_mean,2),cex=0.8)


# Simulation of Expense
e1 <- rnorm(n,mean_staff,sd_staff)
e2 <- rnorm(n,mean_other,sd_other)

E<- matrix(NA,nrow =11,ncol = 100)
i=1
j=1
for(j in 1:100){
  for(i in 1:11){
    E[i,j] <- 98.25*prod(e1[((j-1)*11+1):(11*(j-1)+i)])+50.44*prod(e2[((j-1)*11+1):(11*(j-1)+i)])
  }}
E
E_mean <- apply(E,1,mean)
E_mean

E_sd <- apply(E,1,sd)
E_sd

E_95_up <- E_mean + 1.96*E_sd/10
E_95_low <- E_mean - 1.96*E_sd/10

# plot the expense 
plot(E_mean, type= "l",col= "Black",xaxt="n",xlab="year")
axis(1,2:12,2022:2032)
lines(E_95_up,type="l",col="Red")
lines(E_95_low,type="l",col="Green")
title(main = "The CI of Future Expense")
legend("bottomright",legend=c("95%Up","Mean","95%Low")
       ,col=c("red","black","green"),lty=1,lwd=2,cex=0.5)
points(x=1:11,y=E_mean, cex=0.5, pch = 20)
text(x= 1:11+0.3, y = E_mean,labels = round(E_mean,2),cex=0.8)
revenue_output <- cbind(y_mean,y_sd,y_95_low,y_95_up)
expense_output <- cbind(E_mean,E_sd,E_95_low,E_95_up)
