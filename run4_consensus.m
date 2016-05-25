%{  
    File:    run4_consensus.m
    Author:  Sean Phillips
    
    Utility: Main run file
    
    Project: Hybrid simulation of static consensus of 
             multiple agent network systems with 
             independent communication event.
    
    Dependencies:
    
    C.m
    D.m
    f.m
    g.m
    hybridsolver.m
    plotflows.m

%}

global K v H L G Di                           %Defining global variables

% System Parameters
K = -.4;                                      % Controller Jump Gain
H = -.4;                                      % Controller Flow Gain
v = [.4,.8];                                  % Communication Interval
G = [0 1 0 1; 1 0 1 0; 0 1 0 1; 1 0 1 0];     % Adjacency matrix
Di = sum(G');                                 % Indegree Matrix
L = diag(Di) - G;                             % Laplacian

% Initial Conditions (ICs)
x = [-5 -2 5 0]';                             % State ICs
eta = [-1; 1; 0; -10];                        % Hybrid Controller ICs
tau = [.4, .08, 0.1, 0.25]';                  % Event Timer ICs
x0 = [x; eta; tau];

% simulation horizon
TSPAN=[0 5];                                  % Flow Horizon
JSPAN = [0 1000];                             % Jump Horizon

options = odeset('RelTol',1e-6,'MaxStep',.1); % Simulation Options

% simulate hybrid system
[t y j] = hybridsolver( @f,@g,@C,@D,x0,TSPAN,JSPAN,1,options,1);

%Ploting the resulting figure
barx = mean(y(:,1:4)')';
bary = [y(:,1) - barx, y(:,2) - barx, y(:,3) - barx,y(:,4) - barx];

figure(2)
clf
subplot(311)
hold on
for ii = 1:4
h1 = plot(t,y(:,ii),'LineWidth',2);
c(ii,:) = get(h1,'Color');
end
plot(TSPAN,[0 0],'k:')
axis tight
xlabel('')
% ylabel('x_i')
box on
legend '         ' '' '' '' 
subplot(312)
hold on
for ii = 1:4
    ik = 8;
    plotflows(t,j,y(:,ik+ii),c(ii,:))
end
axis([TSPAN,-.1,v(2)+.1])
plot([0,TSPAN(2)], [v(2),v(2)],'k--')
plot([0,TSPAN(2)], [v(1),v(1)],'k--')
plot([0,TSPAN(2)], [0, 0],'k--')
xlabel('')
% ylabel('\tau_i')
subplot(313)
hold on
for ii = 1:4
    plot(t,bary(:,ii),'LineWidth',2)
end
plot(TSPAN,[0 0],'k:')
axis tight
box on
% xlabel('t')
% ylabel('\bar{x}_i')
% axis([0,10,0,350])
