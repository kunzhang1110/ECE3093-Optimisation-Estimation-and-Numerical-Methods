syms z;

th = 0:pi/50:2*pi;
xunit =  cos(th);
yunit =  sin(th);
f=1-0.438*z-0.2668*z^2;
S=solve(f)
plot(xunit, yunit)
hold on
plot(S(1),0,'o')
hold on
plot(S(2),0,'o')
title('Argand diagram');
xlabel('x');
ylabel('y');