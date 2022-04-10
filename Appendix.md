# Appendix
---

## Appendix A - Team formation and techniques

Inspired by the Brazil soccer team, our team consists of 24 players including 3 goalkeepers, 8 defenders, 5 midfielders and 8 forwards. The 11 starting line-ups consist of 4 forwards, 3 midfielders, 3 defenders, 1 goalkeeper. This team structure is also known as the 4-3-3 formation. The remaining 3 to 5 players will be included in the substitutes. Studies have shown that in the 4-3-3 formation, having three forward players in the attack form a good shape to press high up the pitch. The three midfielders, with the aim to block off any switch of play, can focus on the central areas before pressing outwards to force the ball wide (Tweedale, 2022). There are many famous teams that use this 4-3-3 formation, including Pep Guardiola’s Barcelona, Jürgen Klopp’s Liverpool, and Maurizio Sarri’s Napoli.

## Appendix B - Discussion of R results from team selection criteria

According to Carling, experience and durability is very important in assessing a professional player’s soccer capability for all positions (Carling, 2011). Experience of a player is shown in the “90s” variable, which represents minutes of matches a player played. The more matches a player plays, the more experienced they get. Durability can be measured in the “Total TotDist” variable which represents the average distance a player runs in a 90-minute game. Generally, intensity of running provides more details for players’ durability. Unfortunately, we do not have that information to analyze.

For forward players, the selection criteria mostly focus on players’ shooting abilities and short distance passing abilities (Lucas, 2022). Our analysis result emphases that expected goals, total passing percentage and pressure given to opposing players are important for selecting forward players. The number of goals scored and passing percentage have a positive impact on a player’s performance. Nevertheless, the number of times applying pressure to opposing players who are receiving, carrying or releasing the ball in both the attacking and defending 1/3 field negatively impacts a forward player’s performance. A causal explanation of this is that the main mission for forward players is to receive the ball and score a goal. When forward players spend too much time giving pressure to opponents, they do not have the strength to shoot for goals (Di et al., 2020).

Midfielders have more selection criteria than the forward players but have some variables in common. There is more weight on the passing abilities of a midfielder than forward players. Midfielders need to run back and forth in the field for attacking and defending, and to successfully bring the ball to the attacking 1/3. As a result, passing percentage between 5 to 15 yards is one of the most significant factors. Interestingly, clearance gives a negative coefficient and tackle gives a positive coefficient, showing that midfielders shall focus on aggressively tackling opponents instead of defending passively.

Our model shows that defenders perform well when they have good abilities to tackle opponent players and complete interception. Along with the defending abilities, shooting abilities also seem to be important and significant. Defenders usually stay in the defending 1/3 and would not leave their defending positions to shoot goals. However, as goal shooting ability is highly correlated with passing abilities, it explains why both goal shooting and passing abilities are important for defenders.

We analyze the performance of goalkeepers separately to the forward players, midfielders, and defenders. The reason behind this is that goalkeepers do not need to travel around the soccer field like all other positions. We expect the trade-off between age and experience for goalkeepers is less, because studies have found that the optimal age for goalkeepers is around 28 years old (Dendir, 2016). The average number of goals scored against a goalkeeper is the most significant variable, as lower the better, which is self-explanatory. The shots on target save rate and penalty kick save rate are two other important factors for selecting goalkeepers. All of the three factors we take into consideration are about how defensive the goalkeepers are.

## Appendix C. Methodology for modeling forecast future revenue and expense 

We calculated the growth rates of matchday, broadcast and Commercial from 2016 to 2019 respectively and estimated the growth rates for the next 10 years by Monte Carlo simulation. Then the average revenue for the next 10 years can be obtained by summing the 10-year data of Matchday,broadcast and Commercial.

Similarly, we modeled the growth rates of the future staff and other costs for the next 10 years based on the mean and variance of the growth rates respectively. The overall future team costs were then calculated from the future staff and other costs.

## Appendix D - Discussion of R results from Economy Analysis

### Revenue And Expense

The team's main revenue comes from three main components: match day revenue, media rights and other commercial activities.The analysis leads to the conclusion that the ranking of World Cup matches has little impact on income per capita, so we analyzed the growth data from 2016 to 2019 (2020 is not taken into account because of the impact of COVID-19). 

The analysis leads to the conclusion that the ranking of World Cup matches has little impact on income per capita, so we analyzed the growth data from 2016 to 2019. 2020 is not taken into account because the impact of COVID-19 is not frequent. In order to analyze the relationship between revenue and GDP, this article uses a simple linear regression and different provinces’ revenue proportion of GDP, then forecasting revenue for the next ten years. According to the linear regression model, GDP growth and revenue per capita show a positive correlation at the 95% confidence level. The result is GDP = 10068.63 + 82.31*Total Revenue, which means when total revenue increases by one unit, GDP will increase 82.31 units. This means Rarita football revenue has a great positive influence in GDP. 

In terms of the components of GDP, per capita income as a percentage of GDP is gradually increasing (except 2020), which indicates a gradual change in the industrial structure of Ririta (see Graph 3.1). Different provinces’ football revenue have different impacts on GDP. The West has the main influence on GDP, and the East has the least impact on GDP. In general, the share of the football industry is gradually increasing, while the future of football-related industries is expected to increase.

The revenue can be simulated by the methodology in appendix 1.1. Since this is a competitive team, we can get a strong growth trend, which means that the future growth trend is no less than 1. Also since this is a random simulation, we give a 95% confidence interval. The confidence interval is getting wider from 2022 to 2031, since the prediction is less reliable over time. Apart from that, the growth rate of the total revenue is also increasing slightly.

The result of linear regression is GDP = 22194.87-203.00*Staff Expense +428.4*Other Expenses, which means staff expense has a negative impact on GDP, but other expenses will promote GDP. GDP growth and both expenses per capita show a positive correlation at least at the 95% confidence level.

## Appendix E - Ethical considerations

Since Rarita never had a national team before, we suggest the managerial team to implement a full set of Code of Ethics and Standards to all staff. This should include the values and expectation to show the sporting spirit of Rarita. The welfare system should also be developed to ensure players are appreciated for their contributions, especially those permanently injured players.

Another significant issue to take into consideration is the cut-off age limit. As humans’ physical performance substantially drop-off at 29 (Dendir, 2016), peak age for soccer players is scientifically shown to be around their late 20s. Caley (2013) used minutes played in the Premier League as a proxy for performance and concluded that peak age likely occurs between the ages of 24 and 28, with attacking players likely to peak at 25-26 (Caley, 2013). Often soccer clubs have an unofficial policy that there is a cut-off age of 30 (Dendir, 2016). We respect those elderly players, but we prioritize players in their 20s unless with extraordinary performance due our duties as analysts. For those exiting the national team because of the cut-off age, we suggest relevant departments to pay compensations. On the other hand, there are players under 18 years old playing in the league. We do not accept juveniles under 18 years old to avoid legal and humane risks.

## Appendix F - General suggestions

<div align=center><img width = '600' height ='400' src ="https://github.com/ACTL5100-T1-2022/github-showcase-page-hd-fantastic-excellence/blob/main/Figure%208.1-%20National%20and%20social%20media%20population%20data.png"/>
 
 Figure 8.1: National and social media population data</div>

This section provides some general suggestions for the prosperity of the soccer industry in Rarita. 
Comparing the social media data and Rarita population, followers in youth communities such as Tik Tok and Youtube are extremely smaller than other platforms. However, the facebook followers exceeds the Rarita population. Therefore, Rarita needs to develop such plans to enhance youth interest in soccer.

## Appendix G - Rcode and Team Selection

The process of Team selection can be found in the R file ---- [Team_selection.R](https://github.com/ACTL5100-T1-2022/github-showcase-page-hd-fantastic-excellence/blob/main/Team%20selection.R)

## Appendix H - Economic Impact

PLease see the file to see the file ---- [Economic impact.R](https://github.com/ACTL5100-T1-2022/github-showcase-page-hd-fantastic-excellence/blob/main/Economic%20Impact.R)
