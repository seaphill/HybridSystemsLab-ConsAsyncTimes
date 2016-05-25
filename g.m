function xplus = g(x)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Matlab M-file               Author: Torstein Ingebrigtsen Bø
%
% Project: Simulation of a hybrid system (bouncing ball)
%
% Description: Jump map
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
global K v L 

z = x(1:4);
etaplus = x(5:8);
tauplus = x(9:end);

index = find(tauplus <= 0,1,'first');               % Search for index of tau = 0
if tauplus(index) <= 0                              % If such an index exists 
    tauplus(index) = v(1) + (v(2) - v(1))*rand(1);  % Update associated timer 
    etaplus(index) = K*L(index,:)*z;                % Update the controller 
end

xplus = [z;etaplus;tauplus];

end