clc;clear;
%Parameters
varZ=1;
%Use your Student ID derived a and b.
a=0.4380;
b=0.5336;
n=2000;
maxlags=150;

XN=ones(n,1);
XN=cumsum(XN);
WN=(varZ^(1/2))*randn(n,1); %WN(0,1) for ARMA(2,0) model.

%Model a particular ARMA model
%An general ARMA(2,0) model.
ARMA(1)=WN(1);
ARMA(2)=WN(2);
for i=3:n
    ARMA(i)=WN(i)+a*ARMA(i-1)+0.5*b*ARMA(i-2);
end
gamma=zeros(1,maxlags+1);
TACF=zeros(1,2*maxlags+1);
TACF_xscale=-maxlags:1:maxlags;

% Compute the theoretical covariance function; TACF.
% Map gamma(0:maxlags) to TACF(1:2*maxlags+1)
gamma(1)=4*(varZ^2)*(2-b)/((2+b)*((2-b)^2-4*a^2));%TACF(0)
gamma(2)=gamma(1)*2*a/(2-b);
for i=3:maxlags+1
    gamma(i)=a*gamma(i-1)+gamma(i-2)*b/2;
end

for i=1:maxlags
    TACF(i)=gamma(maxlags+2-i);
end

TACF(1,maxlags+1:end)=gamma;

[PARMA,w] = periodogram(ARMA);
PARMA = PARMA/pi;

% [1]Compute the periodogram of the ARMA process; to obtain vector w.
[PARMA,w] = periodogram(ARMA);
PARMA = PARMA/pi;

% [2]Compute the theoretical spectral density; SDAR
SDAR = (varZ^2/(2*pi))./(1+a^2+b^2/4-a*(2-b)*cos(w)-b*cos(2*w))
SDAR=(pi^(1/2))*SDAR; %necessary scaling; a 'fix'.