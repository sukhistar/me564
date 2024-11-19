% Sukhjit Kaur
% ME564 HW 2 Coding and Plots

% 2-1
t = 0:0.01:50;
y0 = [1;0;1;0];
A = [0 1 0 0; -2 0 1 0; 0 0 0 1; 1 0 -1 0];
[t,y] = ode45(@(t,y)A*y,t,y0);
plot(t,y(:,1))
xlabel('t')
ylabel('displacement')
title('2-1d). Double Spring-Mass System')

y0_1 = [-0.5;0;0.5;0];
[t1,y1] = ode45(@(t,y)A*y,t,y0_1);
figure
plot(t1,y1(:,1))
xlabel('t')
ylabel('displacement')
title('2-1e).Double Spring-Mass System')

% 2-2 f
t = 0:0.01:100;
y0_2 = [1;1];
A_2 = [0 1; -100 -2];
x0 = 1;
v0 = 1;
[t2,y2] = ode45(@(t,y)A_2*y,t,y0_2);
x_t = y2(:,1);
v_t = y2(:,2);
figure
plot(x_t,v_t)
xlabel('x(t)')
ylabel('v(t)')
title('2-2f). Solution to ODE')
                          
 
% 2-3 f
t = 0:0.01:200;
y0_3 = [1;1];
A_3 = [0 1; -0.01 -0.4];
x0 = 1;
v0 = 1;
[t3,y3] = ode45(@(t,y)A_3*y,t,y0_3);
x_t = y3(:,1);
v_t = y3(:,2);
figure
plot(x_t,v_t)
xlabel('x(t)')
ylabel('v(t)')
title('2-2e). Solution to ODE')