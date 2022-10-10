clear

for n=1:10
    
    h = vander(n);
    h_shrink = cov1para(h);

    Hest =cov(h);
    h_cond(n) = cond(Hest);
    h_det(n) = det(h);

    h_shrink_cond(n) = cond(h_shrink);

    h_shrink_det(n) = det(h_shrink);
    
end
    h_cond
    h_shrink_cond
nexttile
plot(h_cond,'blue')
title('condiciones vander')
nexttile
plot(h_shrink_cond,'red')
title('condiciones Shrinkage')



nexttile
plot (h_det,'blue')
title ('Determinante vander')
nexttile
plot (h_shrink_det,'red')
title ('Determinante Shrinkage')