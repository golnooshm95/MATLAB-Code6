function Modifiedsimpson2D ()
% Composite Simpson's Double Intergral
% Author: Golnoosh Morshedi
% Date: April 29, 2019
% For entering your function you can follow below example or if your bound for 
% inner integral is function you can enter it in a same way.
% below example:
% e.g. ---> @(x) 2*x+1;

f = input('Please declare your function: ');
a  = input('Please Enter outter integral lower bound: ');
b  = input('Please Enter outter integral upper bound: ');
n = input('Please Enter an even integer number for subdivision on outter intergral: ');
while (~mod(n,2) == 0)
    n = input('You entered an odd number! Please enter an even number: ');
end    
m = input('Please Enter an even integer number for subdivision on inner intergral: ');
while (~mod(m,2) == 0)
    m = input('You entered an odd number! Please enter an even number: ');
end
h = (b-a)/n;
J1 = 0; % End Terms.
J2 = 0; % Even Terms.
J3 = 0; % Odd Terms.
c  = input('Please enter inner integral start point (lower bound) or declare your function: ');
d  = input('Please enter inner integral end point (upper bound) or declare your function: ');
for i=0:n
    x = a+(i*h);
    HX = (d(x)-c(x))/m;
    K1 = f(x,c(x))+f(x,d(x));
    K2 = 0; % Even Terms
    K3 = 0; % Odd Terms
    for j=1:m-1
        y = c(x)+j.*HX;
        Q = f(x,y);
        if (~mod(j,2) == 0)
            K2 = K2+Q;
        else
            K3 = K3+Q;
        end
    end
    L = ((K1+2*K2+4*K3)*HX)/3; % Calculating inner integral by Composite Simpson's Rule.
    if (i==0 || i==n)
        J1 = J1+L;
    else
        if (mod(i,2) == 0)
            J2 = J2+L;
        else
            J3 = J3+L;
        end
    end
end
J = (h.*(J1+2.*J2+4.*J3))./3;
format long
fprintf('-------------------------------------------------------------------------- \n');
fprintf('Result of double integration by Composite Simpsons Method is: %.6g %d ',J);
fprintf('\n');





