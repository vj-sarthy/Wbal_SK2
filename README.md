# *W’<sub>bal</sub>* model to monitor real time work capacity balance during exercise.

Exercise intensity is classified as severe, heavy, or moderate [1], [2] based on blood lactate levels [3] or maximum oxygen uptake (VO<sub>2max</sub>) [4], [5]. This classification is derived from the energy systems used by the human body, i.e. ATP-PCr, anaerobic glycolysis, and aerobic glycolysis [6]. Energy expenditure in the severe exercise intensity domain has been modelled using the parameters Critical Power (*CP*) and Work Capacity (*W’*). Please refer to the article in [7] to understand how *CP* is related to exercise intensity. 

## What are *CP* and *W’*?

**Critical Power, *CP*:** Critical power is a represents a power output above which muscle metabolic homeostasis cannot be attained [8]–[10]. In layman terms, it is a theoretical power output that can be maintained for a very long time without getting tired.

**Work Capacity, *W’*:** *W’* (pronounced double-U-prime) represents the finite amount of work that can be done above CP [9], [10].

## The Mathematics

The two terms *CP* and *W’* are the power-asymptote and curvature constant of the hyperbolic relationship between power and time-to-exhaustion. The hyperbolic equation was derived from Monod and Scherrer’s [11] seminal work. The equation is given by,

<div align="center">
   <img src="https://github.com/vj-sarthy/Wbal_SK2/blob/master/Eq_1.png" width=100 alt="centered image" />
</div>

where, *P* is power in Watts, *CP* is critical power in Watts, *W’* is the work capacity in Joules, and *t* is the time to exhaustion in seconds.
The figure below shows the hyperbolic relationship with *CP* as the power asymptote and *W’* as the curvature constant.

<div align="center">
   <img src="https://github.com/vj-sarthy/Wbal_SK2/blob/master/Fig_1.png" width=300 alt="centered image" />
</div>
 
## How to determine *CP* and *W’*?

There are several ways to determine *CP* and *W’*, but two of them are most popular:
(i)	The constant work rate (CWR) protocol, derived from Monod and Scherrer [11]
(ii)	The 3-minute all-out test (3MT) proposed by Vanhatalo and colleagues [12]

**The CWR protocol:** The athlete, post warmup, is made to pedal at 3-6 constant powers based on their VO<sub>2max</sub> till exhaustion (indicated by a drop in preferred cadence). The power versus time data points are plotted and the hyperbolic relation is fitted to the data to determine *CP* and *W’*. Some researchers prefer to use the same hyperbolic equation as a linear regression by plotting power versus reciprocal of time. Curve fitting from both methods is shown in the figure below.

<div align="center">
   <img src="https://github.com/vj-sarthy/Wbal_SK2/blob/master/Fig_2.png" width=700 alt="centered image" />
</div>


**The 3MT:** The athlete, post warmup, is made to go on an all-out sprint for 3 minutes. The athlete should be at their maximal effort at every second of the three minutes. *CP* is calculated as the average power output of the last 30 seconds of the test, and the *W’* is calculated as the area below the curve above *CP*. The figure below shows a schematic of the 3MT.

<div align="center">
   <img src="https://github.com/vj-sarthy/Wbal_SK2/blob/master/Fig_3.png" width=450 alt="centered image" />
</div>


## Modelling expenditure and recovery of energy, i.e. *W’*

Expenditure of *W’* is modelled by the hyperbolic equation discussed above. The amount of *W’* remaining is given by subtracting the energy above *CP* from the amount of *W’* remaining in the previous instance of time. This is illustrated below:

<div align="center">
   <img src="https://github.com/vj-sarthy/Wbal_SK2/blob/master/Eq_2.png" width=250 alt="centered image" />
</div>

where,

<div align="center">
   <img src="https://github.com/vj-sarthy/Wbal_SK2/blob/master/Eq_3.png" width=400 alt="centered image" />
</div>
 
where, *W'<sub>bal</sub>* is the *W'* balance at any time during exercise, *W'<sub>exp</sub>* is the amount of *W'* expended, *W'<sub>0</sub>* is *W'* at time t=0, and *t<sub>e</sub>(i)* and t<sub>e</sub>(i-1) are time data that capture the duration of exercise above *CP*, i.e. duration of expenditure.
The available recovery of W’ models in literature have been proposed by Skiba and colleagues [13]–[16]. Here, the latest model presented by Skiba and colleagues [15], referred to as SK2, is considered due the robustness of its mathematical derivation from first principles. The original model from Skiba and colleagues [13] has some mathematical and applicability issues [7], [17]–[19]. The SK2 model combines the expenditure and recovery of *W’* in a biconditional model given by,

<div align="center">
   <img src="https://github.com/vj-sarthy/Wbal_SK2/blob/master/Eq_4.png" width=325 alt="centered image" />
</div>
 
where, *D<sub>CP</sub>* is the recovery power below *CP* and *t<sub>r</sub>* is the time spent below *CP*, i.e. duration of recovery. The *P > CP* condition is same as the hyperbolic model for expenditure of *W'*. The *P < CP* condition models the recovery of *W'*.

Note: It is important to note that the SK2 model also has its drawbacks with respect to applicability to all athletes. Please refer to published articles [7], [17]–[19] for the criticisms of Skiba’s models.

## The python code	

The python program reads the workout file saved as an excel with time data on column 1 and power data on column 2. Then it asks the user to input their *CP* and *W’*. After the *CP* and *W’* is entered by the user, the python program computes the *W’<sub>bal</sub>* at the end of the workout and writes the *W’<sub>bal</sub>* data points back to the excel file on column 3. Additionally, the python program plots Power, *CP*, and *W’<sub>bal</sub>* versus time and saves the plot as an image in the location where the python program would be running. Furthermore, the python program can analyse multiple files at the same time with the plot function disabled.

## Further reading:

The hyperbolic model of *CP* and *W’* can also be applied to running. In running, *CP* is replaced by Critical Speed or Critical Velocity, *CS* or *CV*, and *W’* is replaced by distance capacity, *D’*. Recently, the hyperbolic model was used to simulate the sub-2 hour marathon by Hoogkamer and colleagues [20].

## References:
1.	F. Ozyener, H. B. Rossiter, S. a Ward, and B. J. Whipp, “Influence of exercise intensity on the on- and off-transient kinetics of pulmonary oxygen uptake in humans.,” J. Physiol., vol. 533, no. Pt 3, pp. 891–902, 2001.
2.	H. Carter, J. S. M. Pringle, A. M. Jones, and J. H. Doust, “Oxygen uptake kinetics during treadmill running across exercise intensity domains,” Eur. J. Appl. Physiol., vol. 86, no. 4, pp. 347–354, 2002.
3.	E. A. Rose and G. Parfitt, “A quantitative analysis and qualitative explanation of the individual differences in affective responses to prescribed and self-selected exercise intensities.,” J. Sport Exerc. Psychol., vol. 29, no. 3, pp. 281–309, 2007.
4.	E. E. Hall, P. Ekkekakis, and S. J. Petruzzello, “The affective beneficence of vigorous exercise revisited,” Br. J. Health Psychol., vol. 7, pp. 47–66, 2002.
5.	A. S. Welch, A. Hulley, C. Ferguson, and M. R. Beauchamp, “Affective responses of inactive women to a maximal incremental exercise test: A test of the dual-mode model,” Psychol. Sport Exerc., vol. 8, no. 4, pp. 401–423, 2007.
6.	W. D. McArdle, F. I. Katch, and V. L. Katch., “Energy for Physical activity,” in Exercise physiology: nutrition, energy, and human performance., 7th ed., Lippincott Williams & Wilkins, 2010, pp. 162–177.
7.	V. S. M. Sreedhara, G. M. Mocko, and R. E. Hutchison, “A survey of mathematical models of human performance using power and energy,” Sport. Med. - Open, vol. 5, no. 1, pp. 1–13, 2019.
8.	D. C. Poole, S. A. Ward, G. W. Gardner, and B. J. Whipp, “Metabolic and respiratory profile of the upper limit for prolonged exercise in man,” Ergonomics, vol. 31, no. 19, pp. 1265–1279, 1988.
9.	D. C. Poole, S. A. Ward, and B. J. Whipp, “The effects of training on the metabolic and respiratory profile of high-intensity cycle ergometer exercise,” Eur. J. Appl. Physiol. Occup. Physiol., vol. 59, no. 6, pp. 421–429, 1990.
10.	A. M. Jones, D. P. Wilkerson, F. DiMenna, J. Fulford, and D. C. Poole, “Muscle metabolic responses to exercise above and below the ‘critical power’ assessed using 31P-MRS,” Am. J. Physiol. - Regul. Integr. Comp. Physiol., vol. 294, no. 2, pp. 585–593, 2008.
11.	H. Monod and J. Scherrer, “The work capacity of a synergic muscular group,” Ergonomics, vol. 8, no. 3, pp. 329–338, 1965.
12.	A. Vanhatalo, J. H. Doust, and M. Burnley, “Determination of critical power using a 3-min all-out cycling test,” Med. Sci. Sports Exerc., vol. 39, no. 3, pp. 548–555, 2007.
13.	P. F. Skiba, W. Chidnok, A. Vanhatalo, and A. M. Jones, “Modeling the Expenditure and Reconstitution of Work Capacity above Critical Power,” Med. Sci. Sports Exerc., vol. 44, no. 8, pp. 1526–1532, 2012.
14.	P. F. Skiba, D. Clarke, A. Vanhatalo, and A. M. Jones, “Validation of a novel intermittent W’ model for cycling using field data.,” Int. J. Sports Physiol. Perform., vol. 9, no. 6, pp. 900–904, 2014.
15.	P. F. Skiba, J. Fulford, D. C. Clarke, A. Vanhatalo, and A. M. Jones, “Intramuscular determinants of the ability to recover work capacity above critical power,” Eur. J. Appl. Physiol., vol. 115, no. 4, pp. 703–713, 2015.
16.	P. F. Skiba, S. Jackman, D. Clarke, A. Vanhatalo, and A. M. Jones, “Effect of work and recovery durations on W’ reconstitution during intermittent exercise,” Med. Sci. Sports Exerc., vol. 46, no. 7, pp. 1433–1440, 2014.
17.	J. C. Bartram, D. Thewlis, D. T. Martin, and K. I. Norton, “Predicting Critical Power in Elite Cyclists: Questioning the Validity of the 3-Minute All-Out Test,” Int. J. Sports Physiol. Perform., vol. 12, no. 6, pp. 783–787, 2017.
18.	K. Caen, J. G. Bourgois, G. Bourgois, T. Van der Stede, K. Vermeire, and J. Boone, “The Reconstitution of W′ Depends on Both Work and Recovery Characteristics,” Med. Sci. Sports Exerc., vol. 51, no. 8, pp. 1745–1751, 2019.
19.	V. S. M. Sreedhara, F. Ashtiani, G. M. Mocko, A. Vahidi, and R. E. Hutchison, Modeling the Recovery of W’ in the Moderate to Heavy Exercise Intensity Domain, vol. Publish Ah, no. June. 2020.
20.	W. Hoogkamer, K. L. Snyder, and C. J. Arellano, “Modeling the Benefits of Cooperative Drafting : Is There an Optimal Strategy to Facilitate a Sub‑2‑Hour Marathon Performance?,” Sport. Med., vol. 48, no. 12, pp. 2859–2867, 2018.


