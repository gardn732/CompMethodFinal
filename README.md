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
  A list of each function/script and a single-line description of what it does.  The name of the function/script should link to the file in the repository on GitHub.
	PaperPlane.m (main script were most of the calculations and plotting were done)

	EqMotion.m   (function which takes initial conditions of the environment and the plane and makes the setup needed in order toc alculate height and 
		      range over time)
  # Figures

  ## Fig. 1: Single Parameter Variation
![image](https://github.com/gardn732/CompMethodFinal/assets/168943029/a46b7157-1954-4bae-a833-6bd82f9c17ef)


  ## Fig. 2: Monte Carlo Simulation
  <2D trajectories simulated using random sampling of parameters, overlay polynomial fit onto plot.>

  Briefly describe what is being shown in the figure.

 ## Fig. 3: Time Derivatives
 <Time-derivative of height and range for the fitted trajectory>

  Briefly describe what is being shown in the figure.
