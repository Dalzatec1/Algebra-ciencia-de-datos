
importedData = importdata('portfolio100.txt',' ');
X = importedData(:,2:end);

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

[idx,dm,mm,Ss,wval0,ndir]=kur_main(X);
for j=1:n 
    DKurtosis(j)=XC(j ,:)*inv(Ss)*XC(j ,:)';
end



pch=prctile(DMahalanobis,95);
pcs=prctile(DShrinkage,95);
pck=prctile(DKurtosis,95);

Ih= find(DMahalanobis>pch)
Is= find(DShrinkage>pcs)
Ik= find(DKurtosis>pck)
IMk = find(idx == 1)
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

nexttile
plot(X(:,1),X(:,2),'o')
hold on
plot(X(IMk,1),X(IMk,2),'og')
title ("mímina curtosis")