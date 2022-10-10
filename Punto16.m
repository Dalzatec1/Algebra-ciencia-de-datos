x = [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15]';
x
H=vander(length(x))
b =H*x;
HI=inv(H);
A=H*HI
newM=HI*b;
newM

%posible solución :
lambda=5;
H2 = vander(length(x))+eye(length(x))*lambda;
b1=H2*x
HI2=inv(H2);
Solucion=HI2*b