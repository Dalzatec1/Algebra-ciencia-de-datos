mu =[0 0]; %centro
sigma =[1 0
0 1]
X1= mvnrnd (mu , sigma , 10000) ;

 m= size (X1);
Xbar= mean (X1);
x1=Xbar (1 ,1);
x2=Xbar (1 ,2);
for j=1:m
    y1=X1(j ,1);
    y2=X1(j ,2);
    if (x1^2+x2^2==y1^2+y2^2)
        d(j) = sqrt ((x1-y1)^2+(x2-y2)^2) ;
    else
        d(j)=sqrt(x1^2+x2^2)+sqrt(y1^2+y2^2);
    end
end
Percent= prctile (d ,80);
Ip= find(d>Percent);
plot (X1 (: ,1) ,X1 (: ,2) , 'o')
hold on
plot (X1(Ip ,1) ,X1(Ip ,2) , 'or')
title (" Distribucion Normal Bivariada ")
