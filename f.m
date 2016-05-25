function xdot = f(x)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Matlab M-file                Author: Torstein Ingebrigtsen Bø
%
% Project: Simulation of a hybrid system (bouncing ball)
%
% Description: Flow map
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% states
global H

eta1 = x(5);
eta2 = x(6);
eta3 = x(7);
eta4 = x(8);
tau = x(9:end);

% differential equations
x1dot = eta1;
x2dot = eta2;
x3dot = eta3;
x4dot = eta4;

eta1dot = H*eta1;
eta2dot = H*eta2;
eta3dot = H*eta3;
eta4dot = H*eta4;

taudot = -ones(size(tau));

xdot = [x1dot;x2dot;x3dot;x4dot;eta1dot;eta2dot;eta3dot;eta4dot;-ones(size(tau))];


end