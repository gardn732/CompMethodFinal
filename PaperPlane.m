%	Example 1.3-1 Paper Airplane Flight Path
%	Copyright 2005 by Robert Stengel
%	August 23, 2005

	global CL CD S m g rho	
	S		=	0.017;			% Reference Area, m^2
	AR		=	0.86;			% Wing Aspect Ratio
	e		=	0.9;			% Oswald Efficiency Factor;
	m		=	0.003;			% Mass, kg
	g		=	9.8;			% Gravitational acceleration, m/s^2
	rho		=	1.225;			% Air density at Sea Level, kg/m^3	
	CLa		=	3.141592 * AR/(1 + sqrt(1 + (AR / 2)^2));
							% Lift-Coefficient Slope, per rad
	CDo		=	0.02;			% Zero-Lift Drag Coefficient
	epsilon	=	1 / (3.141592 * e * AR);% Induced Drag Factor	
	CL		=	sqrt(CDo / epsilon);	% CL for Maximum Lift/Drag Ratio
	CD		=	CDo + epsilon * CL^2;	% Corresponding CD
	LDmax	=	CL / CD;			% Maximum Lift/Drag Ratio
	Gam		=	-atan(1 / LDmax);	% Corresponding Flight Path Angle, rad
	V		=	sqrt(2 * m * g /(rho * S * (CL * cos(Gam) - CD * sin(Gam))));
							% Corresponding Velocity, m/s
	Alpha	=	CL / CLa;			% Corresponding Angle of Attack, rad
	
%	a) Equilibrium Glide at Maximum Lift/Drag Ratio
	H		=	2;			% Initial Height, m
	R		=	0;			% Initial Range, m
	to		=	0;			% Initial Time, sec
	tf		=	6;			% Final Time, sec
	tspan	=   (0:0.1:6);
	xoV		=	[V;Gam;H;R]; %base setup for plane
    x1V      =   [2.5;Gam;H;R];%setup for min velocity
    x2V      =   [7.5;Gam;H;R];%setup for max velocity
    xoG		=	[V;Gam;H;R];%base setup for plane
    x1G      =   [V;-0.5;H;R];%setup for min launch angle
    x2G      =   [V;0.4;H;R];%setup for max launch angle
	[ta,xa1]	=	ode23('EqMotion',tspan,x1V); %calc range and height for min velocity
    [tb,xb1]	=	ode23('EqMotion',tspan,xoV);%calc range and height for base setup
    [tc,xc1]	=	ode23('EqMotion',tspan,x2V);%calc range and height for max velocity
    [ta2,xa2]	=	ode23('EqMotion',tspan,x1G);%calc range and height for min launch angle
    [tb2,xb2]	=	ode23('EqMotion',tspan,xoG);%calc range and height for base setup
    [tc2,xc2]	=	ode23('EqMotion',tspan,x2G);%calc range and height for max launch angle

	
	figure
    subplot(2,1,1)
	plot(xa1(:,4),xa1(:,3),xb1(:,4),xb1(:,3),xc1(:,4),xc1(:,3)) %plot different velocity sims on one plot
	xlabel('Range, m'), ylabel('Height, m'), grid

    subplot(2,1,2)
    plot(xa2(:,4),xa2(:,3),xb2(:,4),xb2(:,3),xc2(:,4),xc2(:,3)) %plot different lauch angles on one plot
    xlabel('Range, m'), ylabel('Height, m'), grid


    figure
   A = zeros(61,100);%\/\/\/\/\/\/\/
   B = zeros(61,100);
     RangeAve = zeros(61,1);        %array setup for different data sets
  HeightAve =  zeros(61,1);  %/\/\/\/\/\/\/\/\
    for i = 1:100
    V = 2+(7.5-2)*(rand(1));
    Gam = -0.5+(0.4+0.5)*(rand(1));
    xo		=	[V;Gam;H;R];
    [ta,xi]	=	ode23('EqMotion',tspan,xo);
     A(:,i) = xi(:,3);
     B(:,i) = xi(:,4);  
     plot(B(:,i), A(:,i)); hold on  %plot height(B) vs Range(A) for 100 different sims
    end
xlabel('Range, m'), ylabel('Height, m'), grid
 xlim([0 16])
 ylim([0 4])

 for i = 1:61
      RangeAve(i,:) = mean(B(i,:));
      HeightAve(i,:) = mean(A(i,:));  %average the data from all 100 sims 
 end
pH = polyfit(tspan, HeightAve, 7);%polynomal curve for averge height
LineH = size(HeightAve);
pR = polyfit(tspan, RangeAve, 7);%polynomal curve for average Range
LineR = size(RangeAve);

for i = 1:61
      LineH(i,:) = 7*pH(1)*(tspan(i))^6+6*pH(2)*(tspan(i))^5+5*pH(3)*(tspan(i))^4+4*pH(4)*(tspan(i))^3+3*pH(5)*(tspan(i))^2+2*pH(6)*(tspan(i))+pH(7); %derivative placed into an array
      LineR(i,:) = 7*pR(1)*(tspan(i))^6+6*pR(2)*(tspan(i))^5+5*pR(3)*(tspan(i))^4+4*pR(4)*(tspan(i))^3+3*pR(5)*(tspan(i))^2+2*pR(6)*(tspan(i))+pR(7); %derivative placed into an array
end
figure
subplot(2,1,1)
plot(tspan, LineH)
xlabel('Time, s'), ylabel('Total Height Over Time, m'), grid
subplot(2,1,2)
plot(tspan, LineR)
xlabel('Time, s'), ylabel('Total Range Over Time, m'), grid
