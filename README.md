# CompMethodFinal
# Paper Airplane Numerical Study
  Final Project: AEM 3103 Spring 2024

  - By: Nick Gardner

  ## Summary of Findings

 In this study, the effects of starting velocity and launch angle were tested in order to see how they effect the height of the plane as well as the range the plane 
achieves. The first set of variations show what occurs at the minimum, inital, and maximum values, as seen in figure 1 with change of velocity in the top plot and
change in launch angle in the bottom plot. Then 100 simulations of random velocity and launch angles within the maximum and minimum range were plotted, as show in
figure 2. Using said simulations, the average of every simulation starting at time equal to 0 was taken, then again at the next point in time, and so on until 6 
seconds. This data was point together in order to make one average flight separated by two plots, height vs time and range vs time. which are both fitted with
an appropriate polynomial. The derivative of each polynomial were then taken in order to plot the total height and range at a given time.

  # Code Listing

	PaperPlane.m (main script were most of the calculations and plotting were done)

	EqMotion.m   (function which takes initial conditions of the environment and the plane
 		      and makes the setup needed in order toc alculate height and range over time)
  # Figures

  ## Fig. 1: Single Parameter Variation
![image](https://github.com/gardn732/CompMethodFinal/assets/168943029/a46b7157-1954-4bae-a833-6bd82f9c17ef)

This figure shows 2 different variations of the paper plane simulation. The top plot shows what happens when the starting velocty is changed. In yellow the inital velocity is 7.5 m/s, in orange the inital velocity is 3.55 m/s, and in blue the inital velocity is 2.5 m/s.
the bottom plot shows what happens when the starting angle is changed. In Yellow the inital angle is 0.4 radians, in orange the inital angle is -0.18 radians, and in blue the inital angle is -0.5 radians.

  ## Fig. 2: Monte Carlo Simulation

![image](https://github.com/gardn732/CompMethodFinal/assets/168943029/0ddb5f5a-8438-4bc3-a37f-41bcbd5d9e03)

  This figure shows 100 simulations in which the starting velocity and launch angle are randomized between 2.5 m/s and 7.5 m/s and -0.5 radians and 0.4 radians respectivly.  

 ## Fig. 3: Time Derivatives

![image](https://github.com/gardn732/CompMethodFinal/assets/168943029/c0aa44d6-06d9-46a6-b912-83f02a9189e3)

 This figue shows the derivitives of the average height of the 100 simulations vs time on the top plot and the average range of the 100 simulations vs time on the bottom. 
