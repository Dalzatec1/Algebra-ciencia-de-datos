importedData = importdata('portfolio100.txt',' ');
X = importedData(:,2:end);

Covarianza = cov(X);

[f c] = size(X)



con = cond(Covarianza);
numbini=con
meta=con/4;
i=0
err = [];
con_n=con;
while con_n>=meta
    i=i+1
    NCLW = X + (eye(f, c) * i);
    con = cov(NCLW);
    con_n=cond(con)
    err(i) = con_n ;
end

disp(max(err));

plot(err);
title(['Condition number: ', num2str(numbini),' Condition number reduced: ', num2str(err(end))]);
xlabel("Iteration");
ylabel("Condition number");

%prueba
