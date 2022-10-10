mu1 =[0 0]; %centro
mu2 =[5 5];
mu3 =[8 8];
mu4 =[3 3];
sigma =[1 -0.2
-0.2 1]
X1= mvnrnd (mu1 , sigma , 100)
X2= mvnrnd (mu2 , sigma , 100)
X3= mvnrnd (mu3 , sigma , 100)
X4= mvnrnd (mu4 , sigma , 100)

X1 =[X1(:,1) X1(:,2)];
X2 =[X2(:,1)-1 X2(:,2)];
X3 =[X3(:,1) X3(:,2)+5];
X4 =[X4(:,1) X4(:,2)-2];

nexttile
plot(X1(:,1),X1(:,2),'o')
hold on
plot(X2(:,1),X2(:,2),'o')
hold on
plot(X3(:,1),X3(:,2),'o')
hold on
plot(X4(:,1),X4(:,2),'o')

%idx = kmeans(X,k,Name,Value)
X=[X1(:,1) X1(:,2);X2(:,1) X2(:,2);X3(:,1) X3(:,2);X4(:,1) X4(:,2)]

[idx1,C1] = kmedoids(X,4,Distance="mahalanobis")
[idx2,C2] = kmedoids(X,4,Distance="euclidean")
[idx3,C3] = kmedoids(X,4,Distance="minkowski")
nexttile

gscatter(X(:,1),X(:,2),idx1,'bgmr')
hold on
plot(C1(:,1),C1(:,2),'kx')
title (" Grupos con Mahalanobis ")

nexttile

gscatter(X(:,1),X(:,2),idx2,'bgmr')
hold on
plot(C2(:,1),C2(:,2),'kx')
title (" Grupos con euclidiana ")

nexttile

gscatter(X(:,1),X(:,2),idx3,'bgmr')
hold on
plot(C3(:,1),C3(:,2),'kx')
title (" Grupos con minkowski ")
