# 2022 Student Research Case Study Challenge: Football/Soccer

# The University of Nsw South wales
# Group members:
Hao Wang; Juncheng Chen; Linyao Zhang; Yutong Zheng

_"Tell me and I forget. Teach me and I remember. Involve me and I learn" - Benjamin Franklin_

---

### Congrats on completing the [2022 SOA Research Challenge](https://www.soa.org/research/opportunities/2022-student-research-case-study-challenge/)!

>Now it's time to build your own website to showcase your work.  
>To create a website on GitHub Pages to showcase your work is very easy.

This is written in markdown language. 
>
* Click [4001 link](https://classroom.github.com/a/ggiq0YzO) to accept your group assignment.
* Click [5100 link](https://classroom.github.com/a/uVytCqDv) to accept your group assignment 

Table of Content
Table of Content	i
Summary	1
1.	Objectives of Analysis	1
2.	Team Selection	1
3.	Economic Impact	3
Analysis of revenue	3
Analysis of expense	4
4.	Implementation Plan	7
5.	Assumptions	9
6.	Risk and Risk Mitigation Considerations	10
Quantifiable Risk	10
Qualitative Risk	11
Sensitivity analysis	11
7.	Data and Data Limitations	12
8.	Appendix	12
Appendix A - Team formation and techniques	12
Appendix B - Discussion of R results from team selection criteria	12
Appendix C. Methodology for modeling forecast future revenue and expense	13
Appendix D - Discussion of R results from Economy Analysis	14
Appendix E - Ethical considerations	14
Appendix F - General suggestions	15
Appendix G - R Code for Team Selection	15
Appendix H - Economic Impact	30
9.	Reference	34

  
# Summary
This report applies generalized linear model regression and Monte Carlo simulation to the team selection process and the national economic impact analysis. Risk analysis such as risk metrics and implementation plans associated with real world teams such as researching Australian Football are important for Rarita. 24 players are selected for the national team and the team has a high probability to be ranked in top three within five years.
1.	Objectives of Analysis
This report is conducted to propose a competitive national team and analyze the impact of constructing a national team to the Rarita economy. Players in the team are selected with highest probability in order to achieve the purpose of ranking in the FSA top 10 members within the next five years and achieving the FSA championship within the next 10 years. Direct and indirect revenues and expenses from constructing such a team is discussed in detail, followed by prediction of the influence in the economy in the next 10 years. Potential risk and mitigation is provided for both quantitative and qualitative factors. Data limitations are also discussed with suggestions for future improvement.

# 2.	Team Selection
We focus on the data from the player-data.xlsx file to construct the most competitive team. The team selection criteria will be based on both their performance and annual salary.
One important purpose for constructing a national team is to promote the economy in Rarita. As a symbol for the country, the national team signifies the spirit of sport that represents this country. So, most soccer leagues require that the majority players of a national team should be from that nation. We expect the team to include few best forward players and defenders worldwide. Inspired by the Brazil soccer team, our team consists of around 24 players including 3 goalkeepers, 8 defenders, 5 midfielders and 8 forwards. May include some free players in multi-positions. Formation and techniques are discussed in the appendix.
Our team selection is done position-by-position. For each position, we only consider players that have experience in that position. It is too risky that we place a player in a position he/she never played. We tend to select the top-performing players from each position, but also take into consideration that player’s nationality, wage, and age. Nationality is explained above that Rarita players are our top priorities in each position. Wage of a player is calculated as a weighted average of both 2020 and 2021 wage, with inflation taken into account. This helps us to be cost-effective with our budget.
The selection criteria is shown below in figure 2.1. Two generally important factors for selecting players are experience and durability. This is also proven as significant factors by Carling in his studies on professional teams (Carling, 2011). Majority of the criteria for forward players are also important to midfielders, except midfielders have more significant variables. This is because midfielders are expected to come back and forth on the field by both attacking with forwards and defending with defenders. For defenders, along with the defending abilities, shooting abilities also seem to be important and significant. Although defenders usually stay in the defending 1/3 and would not leave their defending positions to shoot goals. However, as goal shooting ability is highly correlated with passing abilities, it explains why both goal shooting and passing abilities are important for defenders. Lastly, the three important variables for goalkeepers are all related to the players goalkeeping abilities. More detailed discussion of model results can be found in the appendix.
 
Figure 2.1: Significant Factors for Forward, Midfielder, Defender, Gatekeeper
The probability of success is measured by the 2020 and 2021 tournament statistics. Our analysis finds that shooting and passing abilities, total distance ran, pressure given to the opponent team, and ability to prevent the opponent from scoring a goal, are all important factors to determine the tournament result for those professional players. There are strong relationships between the tournament and league statistics for most variables. Hence, we predict the actual tournament performance of our proposed national team and compare the statistics with other national teams. Our model shows that this national team has the abilities between third place and second place in the 2021 tournament data, both individually and as a whole team.
Direct revenues from having this competitive team are the sponsorship, broadcast licensing and match tickets (United States Soccer Federation, Inc., 2021). There are 17 million subscribers in Rarita’s football-soccer Facebook page. Compared with the 12 million population in Rarita, there are a huge number of enthusiastic soccer audiences in Rarita. This shows that the broadcast will attract both Rarita citizens and foreigners to watch. 
The total wage of our proposed national team is ∂ 224,984,939 and we lend three most overpaid Rarita player to foreign countries for ∂ 9,020,619. Moreover, we find the total wage of Rarita players (1.6 billion) exceeds the total staff expense (1.2 billion). This indicates that around 30% of Rarita soccer players are playing and receiving wages in foreign countries. This is a good opportunity for young Rarita players to go and gain experience overseas. This includes the 39 adult Rarita players who are under 22 years old. Income from lending those players are ∂ 22,560,685. This value is taken into account of both inflation and the possibility that some players are not accepted by foreign teams. The annual net staff cost is ∂ 193,403,635
 
# 3.	Economic Impact
Analysis of revenue
 In order to analyze the relationship between revenue and GDP, this article use a simple linear regression and different provinces’ revenue proportion of GDP, then forecasting revenue for the next ten years. 
According to linear regression, there is a great positive relationship between GDP and total revenue, and the estimator is significant at 95%. The second part shows different provinces’ football revenue as a share of GDP (see Figure 3.1). The West has the main influence on GDP, and the East has the least impact on GDP. In general, the share of the football industry is gradually increasing, so the future of football-related industries is expected to increase. The last part is using Monte Carlo simulation to predict total football revenue (see Figure 3.2). There is a steady increase in the next ten years, also the growth rate of the total revenue is also increasing slightly.
 
Figure 3.1:Linear Regression Summary for GDP and Revenue

 
Figure 3.2: Total Revenue Accounted for GDP

 
Figure 3.3: The CI of Future Revenue

Analysis of expense
Similar with revenue analysis, expense analysis also divides into three parts: linear regression of GDP and expense, different provinces’ expense accounted for GDP and forecasting expense for the next ten years. 
From the results of linear regression, staff expenses have a negative impact on GDP, but other expenses will promote GDP. GDP growth and both expenses per capita show a positive correlation at least at the 95% confidence level. As with revenues, there is a similar regional imbalance in spending(Figure 3.2.1). Expenditure on the football industry has the greatest impact on the West and the least on the East. In general, there is an increasing trend on all expenses from 2018 to 2020. The forecasting of total expense, using the same methodology to revenue, shows in Figure 3.2.2. There is an increase year by year from the simulation results. The 95% confidence interval is wider with time, which means its standard deviation gradually increases over time.

 
Figure 3.4: Linear Regression Summary for GDP and Expense

 
Figure 3.5: Total Expense Accounted for GDP
 
Figure 3.6: The CI for Future Expense
 
# 4.	Implementation Plan


The major purpose for the national soccer team construction is to benefit the local communities in Rarita by receiving money award from the FSA championship
and other economic benefits. The development of the national soccer team is treated as a business. Players in the team may retire in the next 10 years according to their performance. The team data collection and analysis is annual and team players replacement is bi-yearly. Therefore, the project duration has been splitted into five periods and each period includes two years. There are no actions in the first two periods since the importance of the team running. The commission collects the performance and health data of players annually in order to be consistent with the underlying goal. After that, the team selection process will be repeated bi-yearly. 
Alternatively, Rarita can establish a national soccer association and complete the domestic soccer system. The commision is able to collect the domestic players data outside the national team from the internal matches and foreign players data from international matches. 
Once the national soccer association is established, Rarita can complete the internal system through hosting domestic leagues. The association revenue from the leagues includes the gate receipts at matchdays, commercial revenues and broadcasts.  

Additionally, the complete soccer league system also benefits the national economy. The government is able to expand revenue resources such as tourism and lottery and raise the revenue amount from the soccer fields.  Moreover, the government develops the national infrastructure such as construction of soccer fields and hosts professional and amateur matches around the whole country. Once the soccer infrastructure is developed in Rarita, the Rarita government is able to make a bid to host the FSA League. The success of hosting the largest international soccer match benefits the national economy comprehensively.



# 5.	Assumptions			
The following assumptions are made when we conduct our analysis.
1.	Players are available for selection while their revenue is paid annually, and wages increase at the rate of inflation.
2.	Countries in the world have already moved away from COVID-19 after 2022 and return to their normal development paths. The impact of COVID-19 is significant and the probability of such a large global event occurring is extremely small. Our analysis of future revenues and expenses is based on the general scenario, so we neglect the impact of COVID-19 when forecasting future revenues and expenses.
3.	Growth rates of both revenue and expenses follow a normal distribution. Normal distribution is widely used in the economy model (Stockhammar & Öller, 2011).
4.	League data is assumed to be affected by the squad they stayed with. Either player’s latest data is used or their statistics is averaged with the weighting of squads.
5.	Player’s wage is used as a performance measure of that player’s abilities in his/her position. We understand that sometimes famous soccer players have extraordinary wages due to their fandom, but soccer fandoms always originate from a players’ outstanding skills. There is a positive correlation between a player’s wage and ability (Gasparetto, 2012).

 
# 6.	Risk and Risk Mitigation Considerations
 
Figure 6.1: Risk Metrics

Quantifiable Risk
a.	Data and Model Risk
There is a probability that the model fails or performs inadequately and leads to unfavorable outcomes.Because of the limitations on the data itself, it is difficult to perform deeper analysis. Data manipulation including imputation may also result in inaccuracy in the result.

Casualty risk may affect players or physical assets
b.	Force majeure
Unexpected severity events harm the players and the whole team. Such as the extreme weather and world-widely infectious diseases outbreak increase the players’ injury probability and the team is unable to hire a foreign player or attend an international competition due to war and politics.

c.	 Providing equipment and facilities that are not safe for intended use
Unsafe equipment and facilities can lead to a risk of soccer players injury, and even event accidents, like being on fire since faulty fire protection facilities or terrorist attacks since incomplete security system.

d.	Players’ injury risk.
Player’s injury affects the whole team including the strategy and performance. Players may get injured in training such as unprepared equipment hurts players and competition. 

Mitigation: Firstly, we ensure that safe playing fields are provided and that they are inspected prior to all training and matches. Also, the equipment should be checked regularly.

Financial risk is the risk involving the assets of a football team or the risk that may be encountered in the course of business activities. 
e.	The risk of losing a sponsor
If the team does not achieve the desired results, there is a risk that our sponsors will lose confidence in our team and that people will pay less attention to the team. The commercial value for the sponsors will then drop and sponsorship will be withdrawn accordingly.
f.	Making a loss on events
The football team currently has no ongoing financial resources, so it will affect the normal functioning of the team if a huge loss occurs. Meanwhile, without continued state funding, there is even the possibility of the football team going bankrupt.

Mitigation: The first step is to form a professional finance team to manage the flow of funds. Also, improve the oversight of the football system. Finally expand the dimension of funding sources.

Qualitative Risk

Legal risks refer to breaches of the responsibilities imposed on the team by law. This may include non-compliance with child protection legislation.
 
g.	Not complying with child protection legislation
There are some 14-year-old players playing in the adult games, which means they may get injured in physical defense against adults. The corresponding legal protection and assistance is inadequate. The national team may be criticized (Brackenridge et al., 2020).
h.	Playing Fake Matches
Players who choose to play fake matches for personal gain would create problems for the reputation of the team. Also the nation's confidence in the team will drop.
i.	Doping
Use of illegal drugs of players led to banning of the team and also resulted in the team's reputation being tarnished (Reardon & Creado, 2014).


Mitigation: First, legal advisors are brought in to guide the social behavior of the team. Then, improve the rules of the game to protect the safety of the players. For minors, youth leagues can be formed to facilitate the display of their talents.

Ethical risk refers to actual or potential damage to the reputation or confidence of the country team.
j.	Not having a member protection policy
The football policies are establishing and improving the state in the first few years. There can be risk in the benefits of members under an imperfect policy.
k.	Players' personal behavioral issues
Players may have personal behavior problems such as excessive drinking, drugs, which can affect their performance on the field and the length of their careers. For the team, the attention paid to the team will also be greatly reduced and, accordingly, the team's income will be reduced.


Mitigation: The first step is to put in place a proper system to strictly regulate the behavior of players and then issue severe penalties to punish players for infractions.

Sensitivity analysis
The historical data from the last 10 years of the survey and the severity of the problem show that doping and players' personal behaviour (e.g. alcohol, drugs, disorderly private life) have a significant impact on the performance and reputation of teams. Meanwhile, these two have a relatively high probability of occurring. Team performance, on the other hand, is less sensitive to the loss of sponsors. 

# 7.	Data and Data Limitations
After brief viewing of the player data, we found that there are a large number of missing values in many variables. Some variables have the exact same number of missing values in shooting, passing and defending data. With a missing data pattern analysis, we found that these missing values are not missing at random. Goalkeepers have no data in shooting abilities. This makes sense because there is no reason why goalkeepers would score a goal. There are also some variables with unreasonable data. For example, since the data should be assumed to be an average per 90-minute game, players cannot score a negative number of goals. In addition, for those percentage statistics, one cannot get a value smaller than zero or larger than one hundred, and they do not match results we obtain from related variables. To illustrate, the short passing percentage does not equal to the number of short passes completed divided by the total number of short passing attempts. Consequently, our team decides to consider those inappropriate values as missing data. Last but not least, there is no information regarding the cooperation between players. Nonetheless, there is little evidence that foreign born players impact team performance on the pitch but may have a positive effect on attendance (Medcalfe et al., 2020).
In forecasting the economic impact of the national team, we found that there is only tournament result in 2020 and 2021 while the revenue and expense sourced from soccer is only up to 2020. It is therefore difficult to investigate the impact of the tournament result on the Rarita economy. 
We analyze the overall trend of the direction based on historical data from 2016-2020. However, such data is relatively scarce and it is difficult to accurately model the future revenue and expense of the football industry.

# 8.	Appendix

Appendix A - Team formation and techniques
Inspired by the Brazil soccer team, our team consists of 24 players including 3 goalkeepers, 8 defenders, 5 midfielders and 8 forwards. The 11 starting line-ups consist of 4 forwards, 3 midfielders, 3 defenders, 1 goalkeeper. This team structure is also known as the 4-3-3 formation. The remaining 3 to 5 players will be included in the substitutes. Studies have shown that in the 4-3-3 formation, having three forward players in the attack form a good shape to press high up the pitch. The three midfielders, with the aim to block off any switch of play, can focus on the central areas before pressing outwards to force the ball wide (Tweedale, 2022). There are many famous teams that use this 4-3-3 formation, including Pep Guardiola’s Barcelona, Jürgen Klopp’s Liverpool, and Maurizio Sarri’s Napoli.
Appendix B - Discussion of R results from team selection criteria
According to Carling, experience and durability is very important in assessing a professional player’s soccer capability for all positions (Carling, 2011). Experience of a player is shown in the “90s” variable, which represents minutes of matches a player played. The more matches a player plays, the more experienced they get. Durability can be measured in the “Total TotDist” variable which represents the average distance a player runs in a 90-minute game. Generally, intensity of running provides more details for players’ durability. Unfortunately, we do not have that information to analyze.
For forward players, the selection criteria mostly focus on players’ shooting abilities and short distance passing abilities (Lucas, 2022). Our analysis result emphases that expected goals, total passing percentage and pressure given to opposing players are important for selecting forward players. The number of goals scored and passing percentage have a positive impact on a player’s performance. Nevertheless, the number of times applying pressure to opposing players who are receiving, carrying or releasing the ball in both the attacking and defending 1/3 field negatively impacts a forward player’s performance. A causal explanation of this is that the main mission for forward players is to receive the ball and score a goal. When forward players spend too much time giving pressure to opponents, they do not have the strength to shoot for goals (Di et al., 2020).
Midfielders have more selection criteria than the forward players but have some variables in common. There is more weight on the passing abilities of a midfielder than forward players. Midfielders need to run back and forth in the field for attacking and defending, and to successfully bring the ball to the attacking 1/3. As a result, passing percentage between 5 to 15 yards is one of the most significant factors. Interestingly, clearance gives a negative coefficient and tackle gives a positive coefficient, showing that midfielders shall focus on aggressively tackling opponents instead of defending passively.
Our model shows that defenders perform well when they have good abilities to tackle opponent players and complete interception. Along with the defending abilities, shooting abilities also seem to be important and significant. Defenders usually stay in the defending 1/3 and would not leave their defending positions to shoot goals. However, as goal shooting ability is highly correlated with passing abilities, it explains why both goal shooting and passing abilities are important for defenders.
We analyze the performance of goalkeepers separately to the forward players, midfielders, and defenders. The reason behind this is that goalkeepers do not need to travel around the soccer field like all other positions. We expect the trade-off between age and experience for goalkeepers is less, because studies have found that the optimal age for goalkeepers is around 28 years old (Dendir, 2016). The average number of goals scored against a goalkeeper is the most significant variable, as lower the better, which is self-explanatory. The shots on target save rate and penalty kick save rate are two other important factors for selecting goalkeepers. All of the three factors we take into consideration are about how defensive the goalkeepers are.
Appendix C. Methodology for modeling forecast future revenue and expense 
We calculated the growth rates of matchday, broadcast and Commercial from 2016 to 2019 respectively and estimated the growth rates for the next 10 years by Monte Carlo simulation. Then the average revenue for the next 10 years can be obtained by summing the 10-year data of Matchday,broadcast and Commercial.
Similarly, we modeled the growth rates of the future staff and other costs for the next 10 years based on the mean and variance of the growth rates respectively. The overall future team costs were then calculated from the future staff and other costs.
Appendix D - Discussion of R results from Economy Analysis
Revenue
The team's main revenue comes from three main components: match day revenue, media rights and other commercial activities.The analysis leads to the conclusion that the ranking of World Cup matches has little impact on income per capita, so we analyzed the growth data from 2016 to 2019 (2020 is not taken into account because of the impact of COVID-19). 

The analysis leads to the conclusion that the ranking of World Cup matches has little impact on income per capita, so we analyzed the growth data from 2016 to 2019. 2020 is not taken into account because the impact of COVID-19 is not frequent. 

In order to analyze the relationship between revenue and GDP, this article uses a simple linear regression and different provinces’ revenue proportion of GDP, then forecasting revenue for the next ten years.

According to the linear regression model, GDP growth and revenue per capita show a positive correlation at the 95% confidence level. The result is GDP = 10068.63 + 82.31*Total Revenue, which means when total revenue increases by one unit, GDP will increase 82.31 units. This means Rarita football revenue has a great positive influence in GDP. 

In terms of the components of GDP, per capita income as a percentage of GDP is gradually increasing (except 2020), which indicates a gradual change in the industrial structure of Ririta (see Graph 3.1). Different provinces’ football revenue have different impacts on GDP. The West has the main influence on GDP, and the East has the least impact on GDP. In general, the share of the football industry is gradually increasing, while the future of football-related industries is expected to increase.

The revenue can be simulated by the methodology in appendix 1.1. Since this is a competitive team, we can get a strong growth trend, which means that the future growth trend is no less than 1. Also since this is a random simulation, we give a 95% confidence interval. The confidence interval is getting wider from 2022 to 2031, since the prediction is less reliable over time. Apart from that, the growth rate of the total revenue is also increasing slightly.
Expense
The result of linear regression is GDP = 22194.87-203.00*Staff Expense +428.4*Other Expenses, which means staff expense has a negative impact on GDP, but other expenses will promote GDP. GDP growth and both expenses per capita show a positive correlation at least at the 95% confidence level.

Appendix E - Ethical considerations
Since Rarita never had a national team before, we suggest the managerial team to implement a full set of Code of Ethics and Standards to all staff. This should include the values and expectation to show the sporting spirit of Rarita. The welfare system should also be developed to ensure players are appreciated for their contributions, especially those permanently injured players.
Another significant issue to take into consideration is the cut-off age limit. As humans’ physical performance substantially drop-off at 29 (Dendir, 2016), peak age for soccer players is scientifically shown to be around their late 20s. Caley (2013) used minutes played in the Premier League as a proxy for performance and concluded that peak age likely occurs between the ages of 24 and 28, with attacking players likely to peak at 25-26 (Caley, 2013). Often soccer clubs have an unofficial policy that there is a cut-off age of 30 (Dendir, 2016). We respect those elderly players, but we prioritize players in their 20s unless with extraordinary performance due our duties as analysts. For those exiting the national team because of the cut-off age, we suggest relevant departments to pay compensations. On the other hand, there are players under 18 years old playing in the league. We do not accept juveniles under 18 years old to avoid legal and humane risks.
Appendix F - General suggestions


This section provides some general suggestions for the prosperity of the soccer industry in Rarita. 
Comparing the social media data and Rarita population, followers in youth communities such as Tik Tok and Youtube are extremely smaller than other platforms. However, the facebook followers exceeds the Rarita population. Therefore, Rarita needs to develop such plans to enhance youth interest in soccer.

