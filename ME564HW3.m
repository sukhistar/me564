% Sukhjit Kaur
%% ME564 HW3
close all;
clc;
%% Problem 3-2
ic = [0.2;0.5];
t = 0:0.01:100;
a = -0.1;
epsilon = 0.05;
%% a)
Aa = [a 0; 0 a];
%% 
% i) - There is only one distinct eigenvalue of -0.1.
[Va, Da] = eig(Aa);
eigAa = diag(Da)

%% 
% ii) - These are parallel which indicates symmetry of the system's
% solutions. The system has one direction of trajectory, where all the
% solutions decay along the same path. 
vecAa = Va;
%% 
% iii)
[ta,ya] = ode45(@(t,y)Aa*y,t,ic);
x1a = ya(:,1);
x2a = ya(:,2);
plot(ta,x1a)
xlabel('t')
ylabel('x1(t)')
title('3-2)a.iii')
figure
plot(ta,x2a)
xlabel('t')
ylabel('x2(t)')
title('3-2)a.iii')
%% 
% iv) 
x_values = linspace (-1, 1, 10);
y_values = linspace (-1, 1, 10);
[X,Y] = meshgrid(x_values, y_values);
initial_conditions = [X(:),Y(:)];

figure;
hold on
for i = 1:size(initial_conditions,1)
    y0 = initial_conditions(i,:);
    [t,y] = ode45(@(t,y)Aa*y,t,y0);
plot(y(:,1),y(:,2),'color', 'c')
end
xlabel('x1(t)')
ylabel('x2(t)')
title('3-2)a.iv')
grid on

% eigenvectors are purely real, plot on same axis

plot(vecAa(:,1),vecAa(:,2),'Color','k')
legend('Phase Portrait','Eigenvectors')

hold off

%% 
% v) The system is a sink (node). 
%% 
% vi) The eigenvalues are all real and negative, so the system is a stable
%     sink. 

%% b)
Ab = [a epsilon; 0 a];
%% 
% i) - There is one distinct eigenvalue of -0.1
[Vb, Db] = eig(Ab);
eigAb = diag(Db)
%% 
% ii) These are parallel which indicates symmetry of the system's
% solutions. The system has one direction of trajectory, where all the
% solutions decay along the same path. 
vecAb = Vb
%% 
% iii)
[tb,yb] = ode45(@(t,y)Ab*y,t,ic);
x1b = yb(:,1);
x2b = yb(:,2);
figure
plot(tb,x1b)
xlabel('t')
ylabel('x1(t)')
title('3-2)b.iii')
figure
plot(tb,x2b)
xlabel('t')
ylabel('x2(t)')
title('3-2)b.iii')
%% 
% iv) 
x_values = linspace (-1, 1, 10);
y_values = linspace (-1, 1, 10);
[X,Y] = meshgrid(x_values, y_values);
initial_conditions = [X(:),Y(:)];

figure;
hold on
for i = 1:size(initial_conditions,1)
    y0 = initial_conditions(i,:);
    [t,y] = ode45(@(t,y)Ab*y,t,y0);
plot(y(:,1),y(:,2),'color','m')
end
xlabel('x1(t)')
ylabel('x2(t)')
title('3-2)b.iv')
grid on
% eigenvectors are purely real, plot on same axis

plot(vecAb(:,1),vecAb(:,2),'Color','k')
legend('Phase Portrait','Eigenvectors')

hold off
%% 
% v) The system is a sink (node). 
%% 
% vi) The eigenvalues are all real and negative, so the system is a stable
%    sink.

%% c)
Ac = [a epsilon; -epsilon a];
%%
% i) - There are two distinct eigenvalues.
[Vc, Dc] = eig(Ac);
eigAc = diag(Dc)
%% 
% ii) - These are not purely real.
vecAc = Vc
%% 
% iii)
[tc,yc] = ode45(@(t,y)Ac*y,t,ic);
x1c = yc(:,1);
x2c = yc(:,2);
figure
plot(tc,x1c)
xlabel('t')
ylabel('x1(t)')
title('3-2)c.iii')
figure
plot(tc,x2c)
xlabel('t')
ylabel('x2(t)')
title('3-2)c.iii')
%% 
% iv) 
x_values = linspace (-1, 1, 10);
y_values = linspace (-1, 1, 10);
[X,Y] = meshgrid(x_values, y_values);
initial_conditions = [X(:),Y(:)];

figure;
hold on
for i = 1:size(initial_conditions,1)
    y0 = initial_conditions(i,:);
    [t,y] = ode45(@(t,y)Ac*y,t,y0);
plot(y(:,1),y(:,2),'Color','b')
end
xlabel('x1(t)')
ylabel('x2(t)')
title('3-2)c.iv')
grid on
hold off
%% 
% v) The system is a spiral.
%% 
% vi) The eigenvalues are complex with a negative real part, the system is
%    stable spiral. 

%% d)
Ad = [0 a; -a 0];
%% 
% i) - There are two distinct eigenvalues.
[Vd, Dd] = eig(Ad);
eigAd = diag(Dd)
%% 
% ii) - The eigenvectors are purely imaginary. 
vecAd = Vd;
%% 
% iii)
[td,yd] = ode45(@(t,y)Ad*y,t,ic);
x1d = yd(:,1);
x2d = yd(:,2);
figure
plot(td,x1d)
xlabel('t')
ylabel('x1(t)')
title('3-2d).iii')
figure
plot(td,x2d)
xlabel('t')
ylabel('x2(t)')
title('3-2d).iii')
%% 
% iv) 
x_values = linspace (-1, 1, 10);
y_values = linspace (-1, 1, 10);
[X,Y] = meshgrid(x_values, y_values);
initial_conditions = [X(:),Y(:)];

figure;
hold on
for i = 1:size(initial_conditions,1)
    y0 = initial_conditions(i,:);
    [t,y] = ode45(@(t,y)Ad*y,t,y0);
plot(y(:,1),y(:,2),'color','g')
end
xlabel('x1(t)')
ylabel('x2(t)')
title('3-2)d.iv')
grid on
hold off
%% 
% v) The system is a center.
%% 
% vi) The eigenavalues are entirely imaginary, so it is unstable. No there
%    are no trajectories that will decay to (0,0), the center is centered
%    around (0,0) and no path will decay to the origin, since all paths
%    surround the origin.

%% e)
Ae = [a 0; 0 -a];
%% 
% i) - There is one distinct eigenvalue
[Ve, De] = eig(Ae);
eigAe = diag(De)
%% 
% ii) - These are parallel which indicates symmetry of the system's
% solutions. The system has one direction of trajectory, so all solutions
% will evolve the same way/path. This could point to the stable or unstable
% manifold of the saddle point.
vecAe = Ve
%% 
% iii)
[te,ye] = ode45(@(t,y)Ae*y,t,ic);
x1e = ye(:,1);
x2e = ye(:,2);
figure
plot(te,x1e)
xlabel('t')
ylabel('x1(t)')
title('3-2)e.iii')
figure
plot(te,x2e)
xlabel('t')
ylabel('x2(t)')
title('3-2)e.iii')
%% 
% iv) 
x_values = linspace (-1, 1, 10);
y_values = linspace (-1, 1, 10);
[X,Y] = meshgrid(x_values, y_values);
initial_conditions = [X(:),Y(:)];

figure;
hold on
for i = 1:size(initial_conditions,1)
    y0 = initial_conditions(i,:);
    [t,y] = ode45(@(t,y)Ae*y,t,y0);
plot(y(:,1),y(:,2),'Color','r')
end
xlabel('x1(t)')
ylabel('x2(t)')
title('3-2)e.iv')
grid on
% eigenvectors are purely real, plot on same axis
plot(vecAe(:,1),vecAe(:,2),'Color','k')
legend('Phase Portrait','Eigenvectors')
hold off
%% 
% v) The system is a saddle point. 
%% 
% vi) The eigenvalues are real and of opposite signs, the system is unstable
%      saddle. Yes the eigenvector trajectory decays to (0,0). 

%% Problem 3-3

%% a)
% ii. Solve numerically and plot numerical and analytical solution x(t),
%      include legend and label axes 
%      x''+ 6x'+ 5x = 0

A3 = [ 0 1; -5 -6];
t = 0:0.01:100;
x0 = 2;
v0 = -6;
[t3,y3] = ode45(@(t,y) Ae*y, t, [x0 v0]);
x_ana = exp(-t)+exp(-5*t);
figure
plot(t3,y3(:,1))
hold
plot(t3,x_ana)
xlabel('t')
ylabel('x(t)')
legend('Numerical','Analytical')
title('3-3)a.ii')

%% b)
% ii. x'' + 6x' + 5x = 3e^-2t

[t3b,y3b] = ode45(@rhs, t, [x0 v0]);
x_ana_b = (7/4)*exp(-t)+(5/4)*exp(-5*t)-exp(-2*t);
figure
plot(t3,y3(:,1))
hold
plot(t3,x_ana_b)
xlabel('t')
ylabel('x(t)')
legend('Numerical','Analytical')
title('3-3)b.ii')

function dxdt = rhs(t,x)
          dxdt_1 = x(2);
          dxdt_2 = -6*x(2) - 5*x(1) + 3*exp(-2*t); 
          dxdt=[dxdt_1; dxdt_2];
end