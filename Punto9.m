importedData = importdata('portfolio100.txt',' ');
X = importedData(:,2:end);

Xmedia=mean(X)

[ Filas Columnas ] = size ( X ) ;
mes = importedData(1:Filas)';
for j =1: Columnas
    if Xmedia (1 , j ) >0
        vfB(1,j)=1;
    else
        vfB (1,j)=0;
    end
end

for i =1: Filas
    for j =1: Columnas
        if X(i,j) >0
            XB(i,j) =1;
        else
            XB(i,j) =0;
        end
    end
end

for i=1:Filas
    
    mcon = confusionmat(vfB,XB(i,:));
  
    c = mcon(1,2);
    b = mcon(2,1);
    a = mcon(2,2);
   
    distanceJaccard(i)= (a)/(a+b+c);
end

PActive = prctile(distanceJaccard,90);
IActive = find(distanceJaccard > PActive);

outliers = importedData(IActive,1);
disp(outliers);

plot(mes,distanceJaccard,'o')
hold on
plot(mes(IActive,1), distanceJaccard(IActive),'or')