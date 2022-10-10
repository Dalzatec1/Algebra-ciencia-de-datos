clear
for n=1:10
    
    h = hilb(n);
    D = mvnrnd(zeros(1,n),h,1000);
    h_shrink = cov1para(D,0.5);

    Hest =cov(D);
    h_cond(n) = cond(Hest);
    h_det(n) = det(h);

    h_shrink_cond(n) = cond(h_shrink);

    h_shrink_det(n) = det(h_shrink);
    
end
    h_cond
    h_shrink_cond
nexttile
plot(h_cond,'blue')
title('condiciones Hilbert')
nexttile
plot(h_shrink_cond,'red')
title('condiciones Shrinkage')



nexttile
plot (h_det,'blue')
title ('Determinante Hilbert')
nexttile
plot (h_shrink_det,'red')
title ('Determinante Shrinkage')
