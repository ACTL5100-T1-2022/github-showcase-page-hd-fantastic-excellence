# 2022 Student Research Case Study Challenge: Football/Soccer

## The University of New South wales
## Group members:
**Hao Wang; Juncheng Chen; Linyao Zhang; Yutong Zheng**

---

---
- [2022 Student Research Case Study Challenge: Football/Soccer](#2022-student-research-case-study-challenge--football-soccer)
- [Summary](#summary)
- [1.    Objectives of Analysis](#1----objectives-of-analysis)
- [2.    Team Selection](#2----team-selection)
- [3.    Economic Impact](#3----economic-impact)
- [4.    Implementation Plan](#4----implementation-plan)
- [5.    Assumptions](#5----assumptions)
- [6.    Risk and Risk Mitigation Considerations](#6----risk-and-risk-mitigation-considerations)
  * [Quantifiable Risk](#quantifiable-risk)
  * [Qualitative Risk](#qualitative-risk)
  * [Sensitivity analysis](#sensitivity-analysis)
- [7.    Data and Data Limitations](#7----data-and-data-limitations)
- [8.    Appendix](#8----appendix)
- [9.    Reference](#9----reference)

<small><i><a href='http://ecotrust-canada.github.io/markdown-toc/'></a></i></small>

---
  


<picture align="center">

  <img src="https://raw.githubusercontent.com/ACTL5100-T1-2022/github-showcase-page-hd-fantastic-excellence/main/ACC.png" alt="Football" width="100%">

</picture>

# Summary
This report applies generalized linear model regression and Monte Carlo simulation to the team selection process and the national economic impact analysis. Risk analysis such as risk metrics and implementation plans associated with real world teams such as researching Australian Football are important for Rarita. 24 players are selected for the national team and the team has a high probability to be ranked in top three within five years.

# 1.	Objectives of Analysis
This report is conducted to propose a competitive national team and analyze the impact of constructing a national team to the Rarita economy. Players in the team are selected with highest probability in order to achieve the purpose of ranking in the FSA top 10 members within the next five years and achieving the FSA championship within the next 10 years. Direct and indirect revenues and expenses from constructing such a team is discussed in detail, followed by prediction of the influence in the economy in the next 10 years. Potential risk and mitigation is provided for both quantitative and qualitative factors. Data limitations are also discussed with suggestions for future improvement.

# 2.	Team Selection
We focus on the data from the player-data.xlsx file to construct the most competitive team. The team selection criteria will be based on both their performance and annual salary.

One important purpose for constructing a national team is to promote the economy in Rarita. As a symbol for the country, the national team signifies the spirit of sport that represents this country. So, most soccer leagues require that the majority players of a national team should be from that nation. We expect the team to include few best forward players and defenders worldwide. Inspired by the Brazil soccer team, our team consists of around 24 players including 3 goalkeepers, 8 defenders, 5 midfielders and 8 forwards. May include some free players in multi-positions. Formation and techniques are discussed in the appendix.

Our team selection is done position-by-position. For each position, we only consider players that have experience in that position. It is too risky that we place a player in a position he/she never played. We tend to select the top-performing players from each position, but also take into consideration that player’s nationality, wage, and age. Nationality is explained above that Rarita players are our top priorities in each position. Wage of a player is calculated as a weighted average of both 2020 and 2021 wage, with inflation taken into account. This helps us to be cost-effective with our budget.

The selection criteria is shown below in figure 2.1. Two generally important factors for selecting players are experience and durability. This is also proven as significant factors by Carling in his studies on professional teams (Carling, 2011). Majority of the criteria for forward players are also important to midfielders, except midfielders have more significant variables. This is because midfielders are expected to come back and forth on the field by both attacking with forwards and defending with defenders. For defenders, along with the defending abilities, shooting abilities also seem to be important and significant. Although defenders usually stay in the defending 1/3 and would not leave their defending positions to shoot goals. However, as goal shooting ability is highly correlated with passing abilities, it explains why both goal shooting and passing abilities are important for defenders. Lastly, the three important variables for goalkeepers are all related to the players goalkeeping abilities. More detailed discussion of model results can be found in the appendix.


| Forward                                     |              | Midfielder                                                             |              |
|---------------------------------------------|--------------|------------------------------------------------------------------------|--------------|
| Explanatory   Factors                       | Significance | Explanatory Factors                                                    | Significance |
| Goals minus expected goals                  | ***          | Goals minus expected goals                                             | ***          |
| Passing completion percentage               | ***          | Pass completion percentage (5 - 15 yards)                              | ***          |
| Minutes divided by 90 minutes               | ***          | Minutes divided by 90 minutes                                          | ***          |
| Goals                                       | ***          | Goals                                                                  | ***          |
| possession of the ball after   pressure     | **           | Shots total                                                            | ***          |
| pressure in defensive 1/3                   | .            | Completed passes that enter the 1/3 of the pitch closest to   the goal | 　           |
| pressure in attacking 1/3                   | *            | Number of dribblers tackled                                            | .            |
| 　                                          | 　           | possession of the ball after pressure                                  | ***          |
|                                             |              | pressure in defensive 1/3                                              | **           |
| 　                                          | 　           | pressure in middle 1/3                                                 | *            |
| 　                                          | 　           | Clearances                                                             | ***          |
| 　                                          | 　           | 　                                                                     | 　           |
| Defender                                    |              | Gatekeeper                                                             |              |
| Explanatory   Factors                       | Significance | Explanatory Factors                                                    | Significance |
| Goals minus expected goals                  | ***          | Goal against per 90 minutes                                            | ***          |
| Assists minus expected   assisted           | 　           | Start line-up percentage                                               | *            |
| Pass completion percentage (5   - 15 yards) | ***          | Penaty kick saved                                                      | .            |
| Minutes divided by 90 minutes               | ***          | 　                                                                     | 　           |
| Goals                                       | **           |                                                                        |              |
| Shots total                                 | ***          | Notes: Significance Level                                              | 　           |
| Completed crosses into the   18-yard box    | *            | ***:     Greater than   99.9%                                          |              |
| Tackles in defensive 1/3                    | ***          | **:       99%~99.9%                                                    | 　           |
| possession of the ball after   pressure     | ***          | *:         95%~99%                                                     |              |
| pressure in defensive 1/3                   | **           | .:          90%~95%                                                    | 　           |
| Number of Player tackle plus   interception | ***          | blank:  less than 90%                                                  | 　           |

Figure 2.1: Significant Factors for Forward, Midfielder, Defender, Gatekeeper 

The probability of success is measured by the 2020 and 2021 tournament statistics. Our analysis finds that shooting and passing abilities, total distance ran, pressure given to the opponent team, and ability to prevent the opponent from scoring a goal, are all important factors to determine the tournament result for those professional players. There are strong relationships between the tournament and league statistics for most variables. Hence, we predict the actual tournament performance of our proposed national team and compare the statistics with other national teams. Our model shows that this national team has the abilities between third place and second place in the 2021 tournament data, both individually and as a whole team.

Direct revenues from having this competitive team are the sponsorship, broadcast licensing and match tickets (United States Soccer Federation, Inc., 2021). There are 17 million subscribers in Rarita’s football-soccer Facebook page. Compared with the 12 million population in Rarita, there are a huge number of enthusiastic soccer audiences in Rarita. This shows that the broadcast will attract both Rarita citizens and foreigners to watch. 

The total wage of our proposed national team is ∂ 224,984,939 and we lend three most overpaid Rarita player to foreign countries for ∂ 9,020,619. Moreover, we find the total wage of Rarita players (1.6 billion) exceeds the total staff expense (1.2 billion). This indicates that around 30% of Rarita soccer players are playing and receiving wages in foreign countries. This is a good opportunity for young Rarita players to go and gain experience overseas. This includes the 39 adult Rarita players who are under 22 years old. Income from lending those players are ∂ 22,560,685. This value is taken into account of both inflation and the possibility that some players are not accepted by foreign teams. The annual net staff cost is ∂ 193,403,635
 
# 3.	Economic Impact
Analysis of revenue
 In order to analyze the relationship between revenue and GDP, this article use a simple linear regression and different provinces’ revenue proportion of GDP, then forecasting revenue for the next ten years. 
According to linear regression, there is a great positive relationship between GDP and total revenue, and the estimator is significant at 95%. The second part shows different provinces’ football revenue as a share of GDP (see Figure 3.1). The West has the main influence on GDP, and the East has the least impact on GDP. In general, the share of the football industry is gradually increasing, so the future of football-related industries is expected to increase. The last part is using Monte Carlo simulation to predict total football revenue (see Figure 3.2). There is a steady increase in the next ten years, also the growth rate of the total revenue is also increasing slightly.

<picture align="center">

  <img src="https://raw.githubusercontent.com/ACTL5100-T1-2022/github-showcase-page-hd-fantastic-excellence/main/Figure-3.1-LR-revenue-gdp-model.png" alt="Football" width="100%">

</picture>

<div align=center>

Figure 3.1:Linear Regression Summary for GDP and Revenue

</div>

<picture align="center">

  <img src="https://raw.githubusercontent.com/ACTL5100-T1-2022/github-showcase-page-hd-fantastic-excellence/main/Figure-3.2-Revenue-proportion.png" alt="Football" width="100%">

</picture>

<div align=center>
 
Figure 3.2: Total Revenue Accounted for GDP 

</div>

<picture align="center">

  <img src="https://raw.githubusercontent.com/ACTL5100-T1-2022/github-showcase-page-hd-fantastic-excellence/main/Figure-3.3-CI-of-revenue.jpeg" alt="Football" width="100%">

</picture>

<div align=center>
 
Figure 3.3: The CI of Future Revenue 

</div>

Analysis of expense
Similar with revenue analysis, expense analysis also divides into three parts: linear regression of GDP and expense, different provinces’ expense accounted for GDP and forecasting expense for the next ten years. 
From the results of linear regression, staff expenses have a negative impact on GDP, but other expenses will promote GDP. GDP growth and both expenses per capita show a positive correlation at least at the 95% confidence level. As with revenues, there is a similar regional imbalance in spending(Figure 3.2.1). Expenditure on the football industry has the greatest impact on the West and the least on the East. In general, there is an increasing trend on all expenses from 2018 to 2020. The forecasting of total expense, using the same methodology to revenue, shows in Figure 3.2.2. There is an increase year by year from the simulation results. The 95% confidence interval is wider with time, which means its standard deviation gradually increases over time.


<picture align="center">

  <img src="https://raw.githubusercontent.com/ACTL5100-T1-2022/github-showcase-page-hd-fantastic-excellence/main/Figure-3.4-expense-gdp-model.png" alt="Football" width="100%">

</picture>

<div align=center>
 
Figure 3.4: Linear Regression Summary for GDP and Expense 

</div>

<picture align="center">

  <img src="https://raw.githubusercontent.com/ACTL5100-T1-2022/github-showcase-page-hd-fantastic-excellence/main/Figure-3.5-Expense-Porprotion.png" alt="Football" width="100%">

</picture>

<div>
 
 Figure 3.5: Total Expense Accounted for GDP
 
</div> 

<picture align="center">

  <img src="https://raw.githubusercontent.com/ACTL5100-T1-2022/github-showcase-page-hd-fantastic-excellence/main/Figure-3.6-Expense.jpeg" alt="Football" width="100%">

</picture>

<div>
 
 Figure 3.6: The CI for Future Expense
 
</div> 
 
# 4.	Implementation Plan

| No. | Name           | Age | Nation           | Position |
|-----|----------------|-----|------------------|----------|
| 1   | C. Baluka      | 22  | Rarita           | DF       |
| 2   | R. Namutebi    | 25  | Rarita           | DF       |
| 3   | D. Naula       | 26  | Rarita           | DF       |
| 4   | M. Pedersen    | 26  | Rarita           | DF       |
| 5   | S. Fontana     | 26  | Rarita           | DF       |
| 6   | G. Hou         | 27  | Rarita           | DF       |
| 7   | G. Oduro       | 28  | Rarita           | DF       |
| 8   | Y. Rabinovitch | 30  | Western Niasland | DF       |
| 9   | K. Al-Zahrani  | 20  | Rarita           | FW       |
| 10  | P. Martin      | 21  | Xikong           | FW       |
| 11  | A. Tindimwebwa | 22  | Rarita           | FW       |
| 12  | W. Martinez    | 23  | Rarita           | FW       |
| 13  | G. Lamwaka     | 28  | Rarita           | FW       |
| 14  | O. Nambafu     | 28  | Rarita           | FW       |
| 15  | H. Makumbi     | 29  | Rarita           | FW       |
| 16  | K. Adong       | 29  | Dosqaly          | FW       |
| 17  | F. Akumu       | 22  | Rarita           | GK       |
| 18  | F. Musa        | 25  | Rarita           | GK       |
| 19  | M. Bahri       | 27  | Rarita           | GK       |
| 20  | D. Makumbi     | 21  | Rarita           | MF       |
| 21  | A. Tindimwebwa | 22  | Rarita           | MF       |
| 22  | B. Mhamid      | 26  | Rarita           | MF       |
| 23  | V. álvarez     | 26  | Rarita           | MF       |
| 24  | S. Razaee      | 27  | Rarita           | MF       |

The major purpose for the national soccer team construction is to benefit the local communities in Rarita by receiving money award from the FSA championship
and other economic benefits. The development of the national soccer team is treated as a business. Players in the team may retire in the next 10 years according to their performance. The team data collection and analysis is annual and team players replacement is bi-yearly. Therefore, the project duration has been splitted into five periods and each period includes two years. There are no actions in the first two periods since the importance of the team running. The commission collects the performance and health data of players annually in order to be consistent with the underlying goal. After that, the team selection process will be repeated bi-yearly.

Alternatively, Rarita can establish a national soccer association and complete the domestic soccer system. The commision is able to collect the domestic players data outside the national team from the internal matches and foreign players data from international matches. 

Once the national soccer association is established, Rarita can complete the internal system through hosting domestic leagues. The association revenue from the leagues includes the gate receipts at matchdays, commercial revenues and broadcasts.  

| Revenue of National Soccer Association   | Revenue of National Soccer Team            |
|------------------------------------------|--------------------------------------------|
| Gate Receipts                            | Association/League Revenue on Matchday     |
| Broadcast                                | Scholarship                                |
| Sponsor with corporates                  | Sponsor with corporates                    |
| Government Support                       | Individual Player's commerical corporation |
| Relavent Products Selling                | 　                                         |

Figure 4.2: Revenue resource for national soccer association and team.

Additionally, the complete soccer league system also benefits the national economy. The government is able to expand revenue resources such as tourism and lottery and raise the revenue amount from the soccer fields.  Moreover, the government develops the national infrastructure such as construction of soccer fields and hosts professional and amateur matches around the whole country. Once the soccer infrastructure is developed in Rarita, the Rarita government is able to make a bid to host the FSA League. The success of hosting the largest international soccer match benefits the national economy comprehensively.

<picture align="center">

  <img src="https://raw.githubusercontent.com/ACTL5100-T1-2022/github-showcase-page-hd-fantastic-excellence/main/Figure-4.3-Development-cycle-for-Rarita.png
" alt="Football" width="100%">

</picture>

<div align=center>

 Figure 4.3: Development cycle for Rarita

</div>

<picture align="center">

  <img src="https://raw.githubusercontent.com/ACTL5100-T1-2022/github-showcase-page-hd-fantastic-excellence/main/Figure-4.4-10-years-soccer-and-related-industries-development-timeline-Football-Australia-2021.png" alt="Football" width="100%">

</picture>

<div align=center>
 
 Figure 4.4: 10 years soccer and related industries development timeline (Football Australia, 2021)

</div>

# 5.	Assumptions			
The following assumptions are made when we conduct our analysis.
1.	Players are available for selection while their revenue is paid annually, and wages increase at the rate of inflation.
2.	Countries in the world have already moved away from COVID-19 after 2022 and return to their normal development paths. The impact of COVID-19 is significant and the probability of such a large global event occurring is extremely small. Our analysis of future revenues and expenses is based on the general scenario, so we neglect the impact of COVID-19 when forecasting future revenues and expenses.
3.	Growth rates of both revenue and expenses follow a normal distribution. Normal distribution is widely used in the economy model (Stockhammar & Öller, 2011).
4.	League data is assumed to be affected by the squad they stayed with. Either player’s latest data is used or their statistics is averaged with the weighting of squads.
5.	Player’s wage is used as a performance measure of that player’s abilities in his/her position. We understand that sometimes famous soccer players have extraordinary wages due to their fandom, but soccer fandoms always originate from a players’ outstanding skills. There is a positive correlation between a player’s wage and ability (Gasparetto, 2012).

 
# 6.	Risk and Risk Mitigation Considerations
 
 <picture align="center">

  <img src="https://raw.githubusercontent.com/ACTL5100-T1-2022/github-showcase-page-hd-fantastic-excellence/main/Figure-6.1-Risk-Metrics.jpeg" alt="Football" width="100%">

</picture>

<div align=center>
 
 Figure 6.1: Risk Metrics 

</div>

## Quantifiable Risk

a.	Data and Model Risk

There is a probability that the model fails or performs inadequately and leads to unfavorable outcomes.Because of the limitations on the data itself, it is difficult to perform deeper analysis. Data manipulation including imputation may also result in inaccuracy in the result.

**Casualty risk may affect players or physical assets**

b.	Force majeure

Unexpected severity events harm the players and the whole team. Such as the extreme weather and world-widely infectious diseases outbreak increase the players’ injury probability and the team is unable to hire a foreign player or attend an international competition due to war and politics.

c.	 Providing equipment and facilities that are not safe for intended use

Unsafe equipment and facilities can lead to a risk of soccer players injury, and even event accidents, like being on fire since faulty fire protection facilities or terrorist attacks since incomplete security system.

d.	Players’ injury risk.

Player’s injury affects the whole team including the strategy and performance. Players may get injured in training such as unprepared equipment hurts players and competition. 

**Mitigation**: Firstly, we ensure that safe playing fields are provided and that they are inspected prior to all training and matches. Also, the equipment should be checked regularly.

**Financial risk is the risk involving the assets of a football team or the risk that may be encountered in the course of business activities.**

e.	The risk of losing a sponsor

If the team does not achieve the desired results, there is a risk that our sponsors will lose confidence in our team and that people will pay less attention to the team. The commercial value for the sponsors will then drop and sponsorship will be withdrawn accordingly.

f.	Making a loss on events

The football team currently has no ongoing financial resources, so it will affect the normal functioning of the team if a huge loss occurs. Meanwhile, without continued state funding, there is even the possibility of the football team going bankrupt.

**Mitigation**: The first step is to form a professional finance team to manage the flow of funds. Also, improve the oversight of the football system. Finally expand the dimension of funding sources.

## Qualitative Risk 

**Legal risks refer to breaches of the responsibilities imposed on the team by law. This may include non-compliance with child protection legislation.**
 
g.	Not complying with child protection legislation

There are some 14-year-old players playing in the adult games, which means they may get injured in physical defense against adults. The corresponding legal protection and assistance is inadequate. The national team may be criticized (Brackenridge et al., 2020).

h.	Playing Fake Matches

Players who choose to play fake matches for personal gain would create problems for the reputation of the team. Also the nation's confidence in the team will drop.

i.	Doping

Use of illegal drugs of players led to banning of the team and also resulted in the team's reputation being tarnished (Reardon & Creado, 2014).

**Mitigation**: First, legal advisors are brought in to guide the social behavior of the team. Then, improve the rules of the game to protect the safety of the players. For minors, youth leagues can be formed to facilitate the display of their talents.

**Ethical risk refers to actual or potential damage to the reputation or confidence of the country team.**

j.	Not having a member protection policy

The football policies are establishing and improving the state in the first few years. There can be risk in the benefits of members under an imperfect policy.

k.	Players' personal behavioral issues

Players may have personal behavior problems such as excessive drinking, drugs, which can affect their performance on the field and the length of their careers. For the team, the attention paid to the team will also be greatly reduced and, accordingly, the team's income will be reduced.

**Mitigation**: The first step is to put in place a proper system to strictly regulate the behavior of players and then issue severe penalties to punish players for infractions.

## Sensitivity analysis

The historical data from the last 10 years of the survey and the severity of the problem show that doping and players' personal behaviour (e.g. alcohol, drugs, disorderly private life) have a significant impact on the performance and reputation of teams. Meanwhile, these two have a relatively high probability of occurring. Team performance, on the other hand, is less sensitive to the loss of sponsors. 

# 7.	Data and Data Limitations

After brief viewing of the player data, we found that there are a large number of missing values in many variables. Some variables have the exact same number of missing values in shooting, passing and defending data. With a missing data pattern analysis, we found that these missing values are not missing at random. Goalkeepers have no data in shooting abilities. This makes sense because there is no reason why goalkeepers would score a goal. There are also some variables with unreasonable data. For example, since the data should be assumed to be an average per 90-minute game, players cannot score a negative number of goals. In addition, for those percentage statistics, one cannot get a value smaller than zero or larger than one hundred, and they do not match results we obtain from related variables. To illustrate, the short passing percentage does not equal to the number of short passes completed divided by the total number of short passing attempts. Consequently, our team decides to consider those inappropriate values as missing data. Last but not least, there is no information regarding the cooperation between players. Nonetheless, there is little evidence that foreign born players impact team performance on the pitch but may have a positive effect on attendance (Medcalfe et al., 2020).

In forecasting the economic impact of the national team, we found that there is only tournament result in 2020 and 2021 while the revenue and expense sourced from soccer is only up to 2020. It is therefore difficult to investigate the impact of the tournament result on the Rarita economy. 

We analyze the overall trend of the direction based on historical data from 2016-2020. However, such data is relatively scarce and it is difficult to accurately model the future revenue and expense of the football industry.

# 8.	[Appendix](https://github.com/ACTL5100-T1-2022/github-showcase-page-hd-fantastic-excellence/blob/main/Appendix.md)


# 9.	Reference

“2022 Student Research Case Study Challenge.” SOA, https://www.soa.org/research/opportunities/2022-student-research-case-study-challenge/

Brackenridge, C, Bringer, JD, Cockburn, C, Nutt, G, Pitchford, A, Russell, K & Pawlaczek, Z 2004, ‘The Football Association's Child Protection in Football Research Project 2002-2006: rationale, design and first year results’, Managing leisure, vol. 9, no. 1, pp. 30–46.)

Carling, C. (2011). Influence of opposition team formation on physical and skill-related performance in a professional soccer team. European Journal of Sport Science, 11(3), 155-164.

Caley, M., (2013). The Football Player Aging Curve. Cartilage Free Captain. Retrieved from http://cartilagefreecaptain.sbnation.com/2013/12/9/5191634/the-football-aging-curve

Dendir, S. (2016). When do soccer players peak? A note. Journal of Sports Analytics, 2(2), 89-105.

Di Salvo, V., Baron, R., Tschan, H., Montero, F. C., Bachl, N., & Pigozzi, F. (2007). Performance characteristics according to playing position in elite soccer. International journal of sports medicine, 28(03), 222-227.

Football Australia (2021). 2021 Annual Report. Retrieved from https://www.footballaustralia.com.au/sites/ffa/files/2021-11/Football%20Australia%202021%20Annual%20Review%20v2_0.pdf

Football Victoria (2021). Factsheet Risk Management from Club Support Program. Retrieved from https://www.footballvictoria.com.au/sites/ffv/files/2021-02/FV%20Factsheet%20-%20Risk%20Management.pdf

Gasparetto, T. M. (2012). Relationship between wages and sports performance. The Empirical Economics letters, 11(9), 943-949.

Lucas, G. (2022). Soccer Forward Guide - A Soccer Player's Complete Guide To The Game. A Soccer Player's Complete Guide To The Game. Retrieved 7 April 2010, from https://completesoccerguide.com/soccer-forward/

Medcalfe, S., & Smith, R. (2018). The Effect of Foreign Players on Pay and Performance in Major League Soccer. International Journal of Sport Finance, 13(4).

Reardon, C. L., & Creado, S. (2014). Drug abuse in athletes. Substance abuse and rehabilitation, 5, 95.

Stockhammar, & Öller, L.-E. (2011). On the probability distribution of economic growth. Journal of Applied Statistics, 38(9), 2023–2041. https://doi.org/10.1080/02664763.2010.545110

Tweedale, A. (2022). The 4-3-3: football tactics explained - The Coaches' Voice. The Coaches' Voice. Retrieved 25 March 2022, from https://www.coachesvoice.com/cv/4-3-3-football-tactics-explained-formation-liverpool-klopp-barcelona-guardiola

United States Soccer Federation, Inc. (2021). Consolidated Financial Statements and Report of Independent Certified Public Accountants. Retrieved from https://cdn.ussoccer.com/-/media/project/ussf/governance/2021/fy2021-us-soccer-audited-financial-statements.ashx?la=en-us&rev=95bd2e66d5b54f209c817afabdd3fea5&hash=93CA413B20C32F2A5460FE85E3BF1F63
