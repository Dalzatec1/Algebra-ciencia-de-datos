% Datos simulados
mu =[5 5];
mu1 =[10 2];
mu2 =[2 10];
sigma =[1 0
0 1]

X1= mvnrnd (mu , sigma , 1000)
X2= mvnrnd (mu1 , sigma , 100)
X3= mvnrnd (mu2 , sigma , 100)

X = [X1; X2; X3 ];

 n= length ( X );
 xm= mean ( X );

 XC=X -xm;
 CovHabitual =cov(X);
 for j=1:n
    DMahalanobis(j)=XC(j,:)*inv( CovHabitual )*XC(j ,:)';
 end

[sigma , shrinkage ]= cov1para (X);
for j=1:n 
    DShrinkage(j)=XC(j ,:)*inv( sigma )*XC(j ,:)';
end
NcondLedoit = cond ( sigma )

[idx,dm,mm,Ss,wval0,ndir]=kur_main(X)
for j=1:n 
    DKurtosis(j)=XC(j ,:)*inv(Ss)*XC(j ,:)';
end



pch=prctile(DMahalanobis,90);
pcs=prctile(DShrinkage,90);
pck=prctile(DKurtosis,90);

Ih= find(DMahalanobis>pch)
Is= find(DShrinkage>pcs)
Ik= find(DKurtosis>pck)

nexttile

plot(X(:,1),X(:,2),'o')
title ("Datos")

nexttile
plot(X(:,1),X(:,2),'o')
hold on
plot(X(Ih,1),X(Ih,2),'ored')
title (" Outlayes mahalanobis")

nexttile
plot(X(:,1),X(:,2),'o')
hold on
plot(X(Is,1),X(Is,2),'ok')
title (" Outlayes Ledoit and Wolf")

nexttile
plot(X(:,1),X(:,2),'o')
hold on
plot(X(Ik,1),X(Ik,2),'oy')
title ("máxima curtosis")
