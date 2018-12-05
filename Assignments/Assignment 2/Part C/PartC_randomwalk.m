function PartC_randomwalk(n)
%ECE3093 Assignment 2 2013
% This m-file generates a plot of a random walk overlaying discrete white noise.
% The random walk is the cumulative sum of the discrete white noise
% It can be implemented, equivalently, as:
% (a)  X_t = Z_t + X_{t-1}  ie ARMA(1,0) model with phi_1=1.
% (b)  X_t = cumsum(Z_t)    ie the discrete integral of the white noise.

% generate the discrete time axis
XN=ones(n,1);
XN=cumsum(XN);
% generate a white noise vector
WN=randn(n,1); %WN(0,1)
%
% Calculate randonwalk as the sum of white noise
RW=cumsum(WN); %A random walk is discrete Brownian motion
%
% Calculate the same randomwalk as an ARMA process
AR(1)=WN(1);
for i=2:n
	AR(i)=WN(i)+AR(i-1);
end

newplot
plot(XN,RW,'k*')
hold on
plot(XN,WN,'k.')
hold on
plot(XN,AR,'ko')
legend('Sum of WN','WN','ARMA');
t=sprintf('Plot of white noise WN(0,1)');
disp(t)
title(['Time series - white noise ~ WN(0,1) and ',...
    'randow walk = cumsum(WN) length = ', num2str(n)])
xlabel('time index')
ylabel('amplitude')
hold off
t=sprintf('Plot of random walk of length = %4d',n);
disp(t)
pause

return