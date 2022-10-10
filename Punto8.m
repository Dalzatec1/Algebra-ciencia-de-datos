importedData = importdata('portfolio100.txt',' ');
X = importedData(:,2:end);

n= length ( X );
Xm = mean(X');
Xmedia = Xm';

Xmayor = Xmedia >1.5

mean (Xmayor)

Xbi = X>0;
Xmayor = double(Xmayor);
Xbi = double(Xbi);

for i =1:100
  correlacion (i)= corr( Xbi (:,i), Xmayor );
end
pearson = correlacion'

[Pmax Pimax]= maxk ( pearson , 10);
[Pmin Pimin]= mink ( pearson , 10)

 % Jaccard

for i =1:100
met_jaccard (i) = jaccard ( Xbi (:,i),Xmayor);
end

met_jaccardord = met_jaccard'

[Jmax Jimax]= maxk ( met_jaccardord ,10) ;
[Jmin Jimin]= mink ( met_jaccardord ,10) 

 % Dice

for i =1:100
  met_dice (i)= dice ( Xbi (:,i), Xmayor )
end
 met_diceord = met_dice'
[Dmax Dimiax]= maxk ( met_diceord ,10);
[Dmin Dimin]= mink ( met_diceord ,10)


Pmin 
Pimin
Jmin 
Jimin