library(readxl)
library(tidyverse)
library(mice)
library(ggcorrplot)
# importing data
# Data cleaning and filtering
# brief
read_excel("2022-student-research-case-study-player-data.xlsx", sheet=2, skip=11) %>% summary
read_excel("2022-student-research-case-study-player-data.xlsx", sheet=3, skip=11) %>% summary
read_excel("2022-student-research-case-study-player-data.xlsx", sheet=4, skip=11) %>% summary
read_excel("2022-student-research-case-study-player-data.xlsx", sheet=5, skip=11) %>% summary

# 2020 inflation for Rarita is 1.32%, so all wages are using 2021 Rarita price level
wage <- merge(
  read_excel("2022-student-research-case-study-player-data.xlsx", sheet=11, skip=11) %>%
    group_by(`Player Name`) %>%
    summarise(`average_salary` = mean(`Annualized Salary`)) %>%
    mutate(`average_salary` = `average_salary` *1.0132),
  
  read_excel("2022-student-research-case-study-player-data.xlsx", sheet=12, skip=11) %>%
    group_by(`Player Name`) %>%
    summarise(`average_salary` = mean(`Annualized Salary`)),
  all=TRUE, "Player Name"
) %>% 
  mutate(average_wage = NA)

for(i in 1:nrow(wage)){
  if(is.na(wage[i,2])){
    wage[i,4] <- wage[i,3]
  } else if(is.na(wage[i,3])){
    wage[i,4] <- wage[i,2]
  } else {
    wage[i,4] <- (wage[i,2] + wage[i,3])/2
  }
}
wage <- wage %>% select("Player Name","average_wage")

# Find the position players
wage_2020 <- read_excel("2022-student-research-case-study-player-data.xlsx", sheet=11, skip=11)
wage_2021 <- read_excel("2022-student-research-case-study-player-data.xlsx", sheet=12, skip=11)

for(i in 1:nrow(wage_2020)){
  wage_2020[i,"FW"] <- grepl("FW", wage_2020[i,5], fix=TRUE)
  wage_2020[i,"MF"] <- grepl("MF", wage_2020[i,5], fix=TRUE)
  wage_2020[i,"DF"] <- grepl("DF", wage_2020[i,5], fix=TRUE)
  wage_2020[i,"GK"] <- grepl("GK", wage_2020[i,5], fix=TRUE)
}

for(i in 1:nrow(wage_2021)){
  wage_2021[i,"FW"] <- grepl("FW", wage_2021[i,5], fix=TRUE)
  wage_2021[i,"MF"] <- grepl("MF", wage_2021[i,5], fix=TRUE)
  wage_2021[i,"DF"] <- grepl("DF", wage_2021[i,5], fix=TRUE)
  wage_2021[i,"GK"] <- grepl("GK", wage_2021[i,5], fix=TRUE)
}

# WHO PLAYED in the following position in either 2020, 2021 or both
# FW
FW2020 <- wage_2020 %>%
  filter(FW) %>%
  select(1)
FW2021 <- wage_2021 %>%
  filter(FW) %>%
  select(1)
FW <- merge(FW2020, FW2021, all=TRUE) %>% unlist %>% unique
rm(FW2020, FW2021)

# MF
MF2020 <- wage_2020 %>%
  filter(MF) %>%
  select(1)
MF2021 <- wage_2021 %>%
  filter(MF) %>%
  select(1)
MF <- merge(MF2020, MF2021, all=TRUE) %>% unlist %>% unique
rm(MF2020, MF2021)

# DF
DF2020 <- wage_2020 %>%
  filter(DF) %>%
  select(1)
DF2021 <- wage_2021 %>%
  filter(DF) %>%
  select(1)
DF <- merge(DF2020, DF2021, all=TRUE) %>% unlist %>% unique
rm(DF2020, DF2021)

# GK
GK2020 <- wage_2020 %>%
  filter(GK) %>%
  select(1)
GK2021 <- wage_2021 %>%
  filter(GK) %>%
  select(1)
GK <- merge(GK2020, GK2021, all=TRUE) %>% unlist %>% unique
rm(GK2020, GK2021)

# check missing pattern in League Data
# we assume GK may have large missing data in the shooting data, but deleting GK from shooting still result in may NAs
#### REMOVE GK from the shooting data
read_excel("2022-student-research-case-study-player-data.xlsx", sheet=2, skip=11) %>% 
  filter(!(Player%in%GK)) %>%
  summary


#### FUNCTION: replace negative values with zero
remove_negative <- function(df,a,b){
  for(i in 1:nrow(df)){
    for(j in a:b){
      df[i,j] <- pmax(unlist(df[i,j]),0)
    }
  }
  return(df)
}

remove_for_ratio <- function(df,a){
  for(i in 1:nrow(df)){
    for(j in a){
      df[i,j] <- replace_na(unlist(df[i,j]),0)
      if(!(unlist(df[i,j])<1 & unlist(df[i,j])>0)){
        df[i,j] <- 0
      }
    }
  }
  return(df)
}

# Discuss within the group of which variables to choose (With explanation and reference from papers)
# Then reload data with selected variables

raw_shooting <- read_excel("2022-student-research-case-study-player-data.xlsx", sheet=2, skip=11) %>% 
  select(
    "Player","Nation","Squad","Born","League","Year",
    "90s","Gls","Standard Sh","Performance PK","Performance PKatt",
    "Expected G-xG"
  ) %>%
  mutate(`Performance%` = `Performance PK`/`Performance PKatt`) %>%
  select(-c("Performance PK","Performance PKatt"))
raw_shooting <- remove_negative(raw_shooting, 7, 9)
raw_shooting <- remove_for_ratio(raw_shooting, 11)

raw_passing <- read_excel("2022-student-research-case-study-player-data.xlsx", sheet=3, skip=11) %>% 
  select(
    "Player","Nation","Squad","Born","League","Year",
    "90s","Total Cmp","Total Att","Total TotDist","Short Cmp","Short Att","Medium Cmp",   
    "Medium Att","Long Cmp","Long Att","KP","1/3","PPA","CrsPA","A-xA"
  ) 
raw_passing <- remove_negative(raw_passing, 7, 20)
raw_passing <- raw_passing %>%
  mutate(
    `Total%` = `Total Cmp`/`Total Att`,
    `Short%` = `Short Cmp`/`Short Att`,
    `Medium%` = `Medium Cmp`/`Medium Att`,
    `Long%` = `Long Cmp`/`Long Att`,
  ) %>%
  select(-c("Total Cmp","Total Att",
            "Short Cmp","Short Att",
            "Medium Cmp","Medium Att",
            "Long Cmp","Long Att")) 
raw_passing <- remove_for_ratio(raw_passing,14:17)


raw_defense <- read_excel("2022-student-research-case-study-player-data.xlsx", sheet=4, skip=11) %>% 
  select(
    "Player","Nation","Squad","Born","League","Year",
    "90s","Tackles Tkl","Tackles TklW","Tackles Def 3rd","Tackles Mid 3rd","Tackles Att 3rd",
    "Vs Dribbles Tkl","Vs Dribbles Att","Pressures Press","Pressures Succ",
    "Pressures Def 3rd","Pressures Mid 3rd","Pressures Att 3rd","Blocks Blocks","Blocks Sh",        
    "Blocks ShSv","Blocks Pass","Int","Tkl+Int","Clr","Err","Vs Dribbles Past"
  )
raw_defense <- remove_negative(raw_defense, 7, 28)

raw_goalkeeping <- read_excel("2022-student-research-case-study-player-data.xlsx", sheet=5, skip=11) %>% 
  select(
    "Player","Nation","Squad","Born","League","Year",
    "Playing Time MP","Playing Time Starts","Playing Time 90s",
    "Performance GA90","Performance SoTA","Performance Saves","Performance CS",
    "Performance PKatt","Penalty Kicks PKsv"
  ) 
raw_goalkeeping <- remove_negative(raw_goalkeeping, 7, 15)
raw_goalkeeping <- raw_goalkeeping %>%
  mutate(
    `Start%` = `Playing Time Starts`/`Playing Time MP`,
    `PenaltySave%` = `Penalty Kicks PKsv`/`Performance PKatt`,
    `Save%` = `Performance Saves`/`Performance SoTA`
  ) %>%
  select(-c("Playing Time MP","Playing Time Starts",
            "Performance SoTA","Performance Saves",
            "Performance PKatt","Penalty Kicks PKsv"
  ))
raw_goalkeeping <- remove_for_ratio(raw_goalkeeping, 10:12)


## Squad Weights

# The performance of each player in different league should be weighted differently.
# Performance of a league is ASSUMED to be highly related to its average salary. Average over 2 years.
# However, simply multiplying performance of the players by the average league salary would make the difference too high
# All leagues is paying salary so ASSUMED to be professional leagues
# Therefore use log-wage as weight

# 2020 inflation for Rarita is 1.32%, so all wages are using 2021 Rarita price level

squad_weight2020 <- wage_2020[,c(3,6)] %>% 
  group_by(Squad) %>%
  summarise(
    average_wage = mean(`Annualized Salary`) * 1.0132
  ) %>%
  mutate(.,log_wage = log(average_wage))

squad_weight2021 <- wage_2021[,c(3,6)] %>% 
  group_by(Squad) %>%
  summarise(
    average_wage = mean(`Annualized Salary`)
  ) %>%
  mutate(.,log_wage = log(average_wage))

squad_weight <- rbind(squad_weight2020, squad_weight2021) %>%
  group_by(Squad) %>%
  summarise(
    average_log_wage = mean(log_wage)
  )

rm(squad_weight2020, squad_weight2021)

# replace the Squad variable with the squad average_wage

shooting1 <- merge(raw_shooting, squad_weight, by="Squad", all.x = TRUE) %>% select(-c("Squad","League","Born","Nation"))
passing1 <- merge(raw_passing, squad_weight, by="Squad", all.x = TRUE) %>% select(-c("Squad","League","Born","Nation"))
defense1 <- merge(raw_defense, squad_weight, by="Squad", all.x = TRUE) %>% select(-c("Squad","League","Born","Nation"))
goalkeeping1 <- merge(raw_goalkeeping, squad_weight, by="Squad", all.x = TRUE) %>% select(-c("Squad","League","Born","Nation"))
rm(squad_weight)

# Among duplicated data between 2020 and 2021, if 2021 is present, use 2021 data. 
# If multiple data within a year, use weighted average
# If a player has incomplete data from a league, 
# then it is ASSUMED to be that there is insufficient time for that player in that league.
# Among all duplicated data, whoever has 2021 data, their 2020 data will not be considered

#### FUNCTION: 
remove_duplicated <-function(df){
  names <- df %>%
    filter(duplicated(df[,1])) %>%
    select(Player) %>%
    unlist
  
  names2021 <- df %>%
    filter(Player%in%names & Year ==2021) %>%
    select(Player) %>%
    unlist
  
  df2 <- df[!(df$Player%>%unlist%in%names2021 & df$Year==2020),]
  
  df3 <- df2 %>%
    group_by(Player) %>%
    summarise_at(c(2:(ncol(df)-1)),mean,na.rm=TRUE)
  return(df3)
}

shooting2 <- remove_duplicated(shooting1)
passing2 <- remove_duplicated(passing1)
defense2 <- remove_duplicated(defense1)
goalkeeping2 <- remove_duplicated(goalkeeping1)

# some variables are allowed to be negative, so exponential before multiply by the squad weight, 
# these variables will then be logged back
data_shooting <- shooting2 %>%
  mutate(
    `Expected G-xG` = exp(`Expected G-xG`)
  ) %>%
  mutate_at(2:7, function(x){x*shooting2$average_log_wage}) %>%
  select(-average_log_wage) %>%
  mutate(
    `Expected G-xG` = log(`Expected G-xG`)
  )

data_passing <- passing2 %>%
  mutate(
    `A-xA` = exp(`A-xA`)
  ) %>%
  mutate_at(2:12, function(x){x*passing2$average_log_wage}) %>%
  select(-average_log_wage) %>%
  mutate(
    `A-xA` = log(`A-xA` )
  )

data_defense <- defense2 %>%
  mutate_at(2:23, function(x){x*defense2$average_log_wage}) %>%
  select(-average_log_wage)

data_GK <- goalkeeping2 %>%
  mutate_at(2:6, function(x){x*goalkeeping2$average_log_wage}) %>%
  select(-average_log_wage)

data_FWMFDF <- cbind(data_shooting, data_passing, data_defense)
for(i in 1:nrow(data_FWMFDF)){
  data_FWMFDF[i,2] <- (data_FWMFDF[i,2] + data_FWMFDF[i,8] + data_FWMFDF[i,20])/3
}
data_FWMFDF <- data_FWMFDF %>% select(-c(7,8,19,20))

# correlation graph to detect multicollinearity
ggcorrplot(cor(data_FWMFDF[,-1]))
ggcorrplot(cor(data_GK[,-1]))
data_FWMFDF <- data_FWMFDF %>%
  select(-c(
    "Blocks Pass","Vs Dribbles Past"
  ))

# Imputation

# reorder variables
colnames(data_FWMFDF)
diff_var <- c(5,12)
ratio_var <- c(6,13:16)
other_var <- (1:35)[-diff_var]
data_FWMFDF <- data_FWMFDF %>% select("Player", diff_var, ratio_var, other_var)

# log those variables that cannot be negative
data_FWMFDF[,4:35] <- data_FWMFDF[,4:35] %>% log
data_GK[2:7] <- data_GK[2:7] %>% log

# Method: Bayesian Linear Regression "norm"

data_FWMFDF <- na_if(data_FWMFDF, 0)
data_FWMFDF <- na_if(data_FWMFDF, -Inf)
data_GK <- na_if(data_GK, -Inf)

# FUNCTION
imputation <- function(df){
  player_names <- df$Player
  col_names <- colnames(df)
  df <- select(df, -"Player")
  colnames(df) <- paste("V",sep="",1:ncol(df))
  imp.df <- mice(df, method="norm", maxit=5, m=1, seed=123)
  df <- complete(imp.df, 1)
  df <- cbind(player_names, df)
  colnames(df) <- col_names
  return(df)
}

data_FWMFDF <- imputation(data_FWMFDF)
data_GK <- imputation(data_GK)

# exp back the variables
data_FWMFDF[,4:35] <- data_FWMFDF[,4:35] %>% exp
data_GK[2:7] <- data_GK[2:7] %>% exp

# Linear regression

colnames(wage)[1] <- "Player"
data_FWMFDF <- merge(data_FWMFDF, wage, "Player")
data_GK <- merge(data_GK, wage, "Player")

# split data further to each of the positions
data_FW <- data_FWMFDF %>%
  filter(Player %in% FW) 

data_MF <- data_FWMFDF %>%
  filter(Player %in% MF)

data_DF <- data_FWMFDF %>%
  filter(Player %in% DF)


lm_FW <- lm(average_wage~.,data_FW[,-1])
lm_MF <- lm(average_wage~.,data_MF[,-1])
lm_DF <- lm(average_wage~.,data_DF[,-1])
lm_GK <- lm(average_wage~.,data_GK[,-1])

summary(lm_FW)
summary(lm_MF)
summary(lm_DF)
summary(lm_GK)

# Reconstruct the model with significant variables in the previous model
data_FW2 <- data_FW[,c(1,2,5,9,10,24,26,28,36)]
data_MF2 <- data_MF[,c(1,2,6,9:11,14,22,24,26,27,34,36)]
data_DF2 <- data_DF[,c(1:3,6,9:11,16,19,24,26,33,36)]
data_GK2 <- data_GK[,c(1,3,5,6,8)]

lm_FW2 <- lm(average_wage~.,data_FW2[,-1])
lm_MF2 <- lm(average_wage~.,data_MF2[,-1])
lm_DF2 <- lm(average_wage~.,data_DF2[,-1])
lm_GK2 <- lm(average_wage~.,data_GK2[,-1])

summary(lm_FW2)
summary(lm_MF2)
summary(lm_DF2)
summary(lm_GK2)

data_FW2$predicted <- predict(lm_FW2, data_FW2)
data_MF2$predicted <- predict(lm_MF2, data_MF2)
data_DF2$predicted <- predict(lm_DF2, data_DF2)
data_GK2$predicted <- predict(lm_GK2, data_GK2)

# add nationalities, current age to the above data
names <- raw_shooting$Player %>% 
  duplicated

data_FW_final <- merge(data_FW2, raw_shooting[!names,c(1,2,4)], all.x=TRUE, "Player") %>% 
  mutate(Age = 2022-Born) %>%
  select("Player","Age","Nation","average_wage","predicted")
data_FW_final <- data_FW_final[c(431,815,49,581,372,1122,580,848),] %>%
  mutate(Pos="FW")

data_MF_final <- merge(data_MF2, raw_shooting[!names,c(1,2,4)], all.x=TRUE, "Player") %>% 
  mutate(Age = 2022-Born) %>%
  select("Player","Age","Nation","average_wage","predicted")
data_MF_final <- data_MF_final[c(286,77,127,1339,1464),] %>% 
  mutate(Pos="MF")

data_DF_final <- merge(data_DF2, raw_shooting[!names,c(1,2,4)], all.x=TRUE, "Player") %>% 
  mutate(Age = 2022-Born) %>%
  select("Player","Age","Nation","average_wage","predicted")
data_DF_final <- data_DF_final [c(425,1052,805,401,1019,245,1321,124),] %>% 
  mutate(Pos="DF")

data_GK_final <- merge(data_GK2, raw_shooting[!names,c(1,2,4)], all.x=TRUE, "Player") %>% 
  mutate(Age = 2022-Born) %>%
  select("Player","Age","Nation","average_wage","predicted")
data_GK_final <- data_GK_final[c(70,61,157),] %>% 
  mutate(Pos="GK")

final_team <- rbind(data_FW_final, data_MF_final, data_DF_final, data_GK_final)

rownames(final_team) <- 1:24


# data cleaning for tournament data, remove Squad variable

tournament_shooting <- read_excel("2022-student-research-case-study-player-data.xlsx", sheet=7, skip=11) %>% 
  select(
    "Player","Year",
    "90s","Gls","Standard Sh","Performance PK","Performance PKatt",
  ) %>%
  mutate(`Performance%` = `Performance PK`/`Performance PKatt`) %>%
  select(-c("Performance PK","Performance PKatt"))
tournament_shooting <- remove_negative(tournament_shooting, 3, 5)
tournament_shooting <- remove_duplicated(tournament_shooting)

tournament_passing <- read_excel("2022-student-research-case-study-player-data.xlsx", sheet=8, skip=11) %>% 
  select(
    "Player",
    "90s","Total Cmp","Total Att","Total TotDist","Short Cmp","Short Att","Medium Cmp",   
    "Medium Att","Long Cmp","Long Att","KP","1/3","PPA","CrsPA","A-xA"
  ) 
tournament_passing <- remove_negative(tournament_passing, 2, 15)
tournament_passing <- tournament_passing %>%
  mutate(
    `Total%` = `Total Cmp`/`Total Att`,
    `Short%` = `Short Cmp`/`Short Att`,
    `Medium%` = `Medium Cmp`/`Medium Att`,
    `Long%` = `Long Cmp`/`Long Att`,
  ) %>%
  select(-c("Total Cmp","Total Att",
            "Short Cmp","Short Att",
            "Medium Cmp","Medium Att",
            "Long Cmp","Long Att")) 
tournament_passing <- remove_for_ratio(tournament_passing,9:12)

tournament_defense <- read_excel("2022-student-research-case-study-player-data.xlsx", sheet=9, skip=11) %>% 
  select(
    "Player",
    "90s","Tackles Tkl","Tackles TklW","Tackles Def 3rd","Tackles Mid 3rd","Tackles Att 3rd",
    "Vs Dribbles Tkl","Vs Dribbles Att","Pressures Press","Pressures Succ",
    "Pressures Def 3rd","Pressures Mid 3rd","Pressures Att 3rd","Blocks Blocks","Blocks Sh",        
    "Blocks ShSv","Int","Tkl+Int","Clr","Err"
  )
tournament_defense <- remove_negative(tournament_defense, 2, 21)

tournament_goalkeeping <- read_excel("2022-student-research-case-study-player-data.xlsx", sheet=10, skip=11) %>% 
  select(
    "Player","Year",
    "Playing Time MP","Playing Time Starts","Playing Time 90s",
    "Performance GA90","Performance SoTA","Performance Saves","Performance CS",
    "Performance PKatt","Penalty Kicks PKsv"
  ) 
tournament_goalkeeping <- remove_negative(tournament_goalkeeping, 2, 10)
tournament_goalkeeping <- tournament_goalkeeping %>%
  mutate(
    `Start%` = `Playing Time Starts`/`Playing Time MP`,
    `PenaltySave%` = `Penalty Kicks PKsv`/`Performance PKatt`,
    `Save%` = `Performance Saves`/`Performance SoTA`
  ) %>%
  select(-c("Playing Time MP","Playing Time Starts",
            "Performance SoTA","Performance Saves",
            "Performance PKatt","Penalty Kicks PKsv"
  ))
tournament_goalkeeping <- remove_for_ratio(tournament_goalkeeping, 6:8)
tournament_goalkeeping <- remove_duplicated(tournament_goalkeeping)

# Function. To compare the ratio between our treated league data and given tournament data
# df1 tournament data, df2 league data
comparison <- function(df1, df2){
  df1 <- df1 %>% na_if(0)
  df2 <- df2 %>% na_if(0)
  df1 <- df1[which(df1$Player %in% df2$Player),]
  df2 <- df2[which(df2$Player %in% df1$Player),]
  df1 <- df1[order(df1$Player),]
  compare <- df1
  for(j in 2:ncol(df1)){
    for(i in 1:nrow(df1)){
      compare[i,j] <- unlist(df2[i,j]) / unlist(df1[i,j])
    }
  }
  return(compare %>% 
           select(-"Player") %>%
           apply(., 2, median, na.rm=TRUE))
}

tournament_ratio_FWMFDF <- c(
  comparison(tournament_shooting, data_shooting),
  comparison(tournament_passing, data_passing),
  comparison(tournament_defense, data_defense)
)

tournament_ratio_GK <- comparison(tournament_goalkeeping, data_GK)


final_team2 <- data_FWMFDF[data_FWMFDF$Player%in%final_team$Player,] %>% 
  select("Player",
         names(tournament_ratio_FWMFDF[tournament_ratio_FWMFDF<30 & tournament_ratio_FWMFDF >10]))


rank2021 <- read_excel("2022-student-research-case-study-player-data.xlsx", sheet=6, skip=10)[,4:5]
colnames(rank2021) <- c("rank","Nation")

# Find the probability of winning

tournament_shooting <- read_excel("2022-student-research-case-study-player-data.xlsx", sheet=7, skip=11) %>% 
  select(
    "Player","Year","Nation",
    "90s","Gls","Standard Sh","Performance PK","Performance PKatt"
  ) %>%
  mutate(`Performance%` = `Performance PK`/`Performance PKatt`) %>%
  select(-c("Performance PK","Performance PKatt"))
tournament_shooting <- tournament_shooting %>%
  filter(Year==2021)

t_FWMFDF<- tournament_shooting %>% 
  merge(tournament_passing, "Player", all=TRUE) %>% 
  merge(tournament_defense, "Player", all=TRUE) %>% 
  select(c("Player","Nation",
           names(tournament_ratio_FWMFDF[tournament_ratio_FWMFDF<30 & tournament_ratio_FWMFDF >10])
  ))

t_FWMFDF <- t_FWMFDF %>%
  remove_negative(4,29) %>%
  remove_for_ratio(10:13) %>%
  na_if(0)

t_FWMFDF <- merge(t_FWMFDF, rank2021, by="Nation") %>% 
  select(-c("Nation"))

a <- t_FWMFDF[,c(28,29)]
t_FWMFDF <- t_FWMFDF[,-c(28,29)]
t_FWMFDF[,-1] <- log(t_FWMFDF[,-1])
t_FWMFDF <- imputation(t_FWMFDF)
t_FWMFDF[,-1] <- exp(t_FWMFDF[,-1])
t_FWMFDF <- cbind(t_FWMFDF, a)

# Do the same for the goalkeeper data
t_GK <- read_excel("2022-student-research-case-study-player-data.xlsx", sheet=10, skip=11) %>%
  select("Player","Nation") %>%
  merge(tournament_goalkeeping, by="Player")
t_GK <- t_GK %>%
  select(c("Player","Nation",
           names(tournament_ratio_GK[tournament_ratio_GK<30 & tournament_ratio_GK >10])
  ))
t_GK <- t_GK %>%
  remove_negative(3,6) %>%
  remove_for_ratio(5:6) %>%
  na_if(0)
t_GK <- merge(t_GK, rank2021, by="Nation") %>% 
  select(-c("Nation"))
t_GK[,-1] <- log(t_GK[,-1])
t_GK <- imputation(t_GK)
t_GK[,-1] <- exp(t_GK[,-1])

rank_lm_fit <- glm(rank ~ .,
                   data=t_FWMFDF[,-1], family =poisson(link = "log") )
rank_lm_fit2 <- glm(rank ~ .,
                    data=t_GK[,-1], family =poisson(link = "log") )

tournament_ratio_FWMFDF <- tournament_ratio_FWMFDF[which(names(tournament_ratio_FWMFDF) %in% colnames(t_FWMFDF))]

final_team_t <- final_team2
for(i in 1:27){
  final_team_t[,i+1] <- final_team2[,i+1] / tournament_ratio_FWMFDF[i]
}

final_team_t <- merge(final_team_t, final_team, all.x=TRUE, by="Player")
final_team_t$rank[which(final_team_t$Pos!="GK")] <- predict(rank_lm_fit, final_team_t[which(final_team_t$Pos!="GK"),-1])

final_team_t2 <- merge(final_team_t, data_GK[,-8], all.x=TRUE, by="Player")
tournament_ratio_GK <- tournament_ratio_GK[which(names(tournament_ratio_GK) %in% colnames(t_GK))]
for(i in 1:4){
  final_team_t2[,34+i] <- final_team_t2[,i+34] / tournament_ratio_GK[i]
}
final_team_t2$rank[which(final_team_t$Pos=="GK")] <- predict(rank_lm_fit2, final_team_t2[which(final_team_t2$Pos=="GK"),-1])

## Total cost
# $224984939, 225Million
final_team_t2$average_wage[
  !(duplicated(final_team_t2$Player)) & final_team_t2$Nation=="Rarita"
] %>% sum +
  (final_team_t2$average_wage[final_team_t2$Nation!="Rarita"]*1.1) %>% sum

# The final team composition, including player's name, nationality, age and position
final_team_t2[!duplicated(final_team_t2$Player),] %>%
  select(Player,Age, Nation, Pos)

## Who to lend
## who to be the coach

overview <- rbind(
  merge(data_FW2, raw_shooting[!names,c(1,2,4)], all.x=TRUE, "Player") %>% 
    mutate(Age = 2022-Born, Pos="FW") %>%
    select("Player","Age","Nation","average_wage","predicted","Pos"),
  
  merge(data_MF2, raw_shooting[!names,c(1,2,4)], all.x=TRUE, "Player") %>% 
    mutate(Age = 2022-Born, Pos="MF") %>%
    select("Player","Age","Nation","average_wage","predicted","Pos"),
  
  merge(data_DF2, raw_shooting[!names,c(1,2,4)], all.x=TRUE, "Player") %>% 
    mutate(Age = 2022-Born, Pos="DF") %>%
    select("Player","Age","Nation","average_wage","predicted","Pos"),
  
  merge(data_GK2, raw_shooting[!names,c(1,2,4)], all.x=TRUE, "Player") %>% 
    mutate(Age = 2022-Born, Pos="GK") %>%
    select("Player","Age","Nation","average_wage","predicted","Pos")
) %>%
  mutate(`Performance Ratio`=predicted/average_wage) %>%
  filter(Nation=="Rarita")

# lend those under 22 for $22560685
overview %>%
  filter(Age <= 22) %>%
  select(average_wage) %>%
  sum * 0.1 * 0.95

# Lend those for $9020619
overview[c(139,229,72),] %>%
  select(average_wage) %>%
  sum * 0.1

# Annual cost $193403635
224984939 - 9020619 - 22560685

# Total wages of Rarita players
overview$average_wage[!duplicated(overview$average_wage)] %>% sum



