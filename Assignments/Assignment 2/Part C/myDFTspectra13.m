function myDFTspectra13()
%ECE3093 Assignment 2 Part C 2013
%This part C of Assignment 2 2013 aims to illustrate the 
%transformation theory of a stationary time series.
%for a ARMA(2,0) process
%
%Abbreviations
%ARMA = AutoRegressive Moving Average variable; {X_t} simulation.
%DFT = Discrete Fourier Transformation (DFT)
%TACF = theoretical (Yule-Walker) autocovariance function (given in assignment).
%maxlags = half-width of the correlatioin window; MATLAB parameter.
%SACF = sample ACF = autocovariance of the ARMA simulation {X_t} sample
%f(w) = spectral density function
%PSACF = DFT of the SACF
%PTACF = DFT of the TACF
%TSDAR = theoretical spectral density (derived from ARMA model polynomials).
%
%The spectral density can also be estimated in three ways:
%[1] the DFT of the transform of SACF
%[2] the periodogram of the time-series sample; PARMA.
%[3] the amplitude of the DFT of the theoretical (Yule-Walker) ACF; PTACF

%% 1. Edit Parameters
varZ=1;
%Use your Student ID derived a and b.
a=0.4380;
b=0.5336;
n=2000;
maxlags=150;
%
% Calculate a white noise sample; WN(0,varZ) hence sd = varZ^(1/2)
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

newplot
plot(XN,WN,'ko')
title(['Time series - WN(0,1),ARMA(2,0); ARMA(i)=WN(i)(',num2str(a),...
    ')*ARMA(i-1)+(',num2str(b/2),')*ARMA(i-2)+ maxlags = ',...
    num2str(maxlags)])
xlabel('time index')
ylabel('amplitude')
hold on
plot(XN,ARMA,'k+')
legend('Time series WN','Time series ARMA');
hold off
pause

newplot

%% 2.Theoretical ACF (TACF)
%preallocations
gamma=zeros(1,maxlags+1);
TACF=zeros(1,2*maxlags+1);
TACF_xscale=-maxlags:1:maxlags;

% gamma functions
gamma(1)=4*(varZ^2)*(2-b)/((2+b)*((2-b)^2-4*a^2));%TACF(0)
gamma(2)=gamma(1)*2*a/(2-b);
for i=3:maxlags+1
    gamma(i)=a*gamma(i-1)+gamma(i-2)*b/2;
end

%mapping gamma to TACF
for i=1:maxlags
    TACF(i)=gamma(maxlags+2-i);
end
TACF(1,maxlags+1:end)=gamma;

% Calculate of the sample covariance function; SACF.
SACF=xcorr(ARMA,maxlags,'unbiased');

%% 3. Plot of TACF
% Plot the sample covariance.
newplot
% Your plot of TACF
plot(TACF_xscale,TACF,'-o');
hold on
plot(-maxlags:maxlags,SACF,'k+')
title(['Covariance of ARMA(i)=WN(i)(',num2str(a),...
    ')*ARMA(i-1)+(',num2str(b/2),')*ARMA(i-2)+ maxlags = ',...
    num2str(maxlags)])
xlabel('time difference index')
ylabel('gamma')
legend('Theoretical ACF; TACF','Sample ACF; SACF');
hold off
pause

%% 4,5 Periodogram and DFT of TACF
% [1]Compute the periodogram of the ARMA process; to obtain vector w.
[PARMA,w] = periodogram(ARMA);
PARMA = PARMA/pi;

% [2]Compute the theoretical spectral density; TSDAR
TSDAR= (varZ^2/(2*pi))./(1+a^2+b^2/4-a*(2-b)*cos(w)-b*cos(2*w));
TSDAR= (pi^(1/2))*TSDAR; %necessary scaling; a 'fix'.

% [3]Calculate the DFT of the SACF
PSACF = fft(SACF);
DN=length(PSACF);
DNS=(DN-1)/2;
PSACF=abs(PSACF(1:DNS+1))/((DNS*pi)^(1/4)); %necessary scaling

%[0:1/DNS:pi] ordinate for plotting DFT of TACF and SACF
wDFT=ones(DNS+1,1);
wDFT=cumsum(wDFT)-1;
wDFT=wDFT*pi/DNS;

% [4]Calculate the DFT of the TACF
PTACF = fft(TACF);
TDN=length(PTACF);
TDNS=(TDN-1)/2;
PTACF=abs(PTACF(1:TDNS+1))/((TDNS*pi)^(1/4)); %necessary scaling

%[0:1/DNS:pi] ordinate for plotting DFT of TACF and SACF
TwDFT=ones(TDNS+1,1);
TwDFT=cumsum(TwDFT)-1;
TwDFT=TwDFT*pi/TDNS;

%% 6,7 Semilogy plot of DFT of ACF, PTACF and Semilogy plot of TSDAR
newplot
% [1]Semilogy plot the DFT of the sample covariances,PSACF.
semilogy(wDFT,abs(PSACF),'k+');
title(['Spectral density of ARMA(i)=WN(i)(',num2str(a),...
    ')*ARMA(i-1)+(',num2str(b/2),')*ARMA(i-2)+ maxlags = ',...
    num2str(maxlags)])
xlabel('radian')
ylabel('spectral amplitude')
hold on

% [2]Semilogy DFT of the theoretical covariances, PTACF.
semilogy(TwDFT,abs(PTACF),'-o');
hold on

% [3]Semilogy of the theoretical spectral density, TSDAR.
semilogy(w,abs(TSDAR),'-rx');
hold on

legend('DFT of SACF','DFT of TACF','TSDAR');
hold off
pause

%% 8Direct route: Periodogram (DFT of ARMA)
newplot
% [1]Semilogy plot 
semilogy(w,PARMA,'k*');
title(['Spectral Density of ARMA(i)=WN(i)(',num2str(a),...
    ')*ARMA(i-1)+(',num2str(b/2),')*ARMA(i-2)+ maxlags = ',...
    num2str(maxlags)])
xlabel('frequency')
ylabel('DFT')
hold on

% [2]Semilogy plot of TSDAR
semilogy(w,abs(TSDAR),'-rx');
legend('Periodogram','TSDAR');
hold off
pause

return