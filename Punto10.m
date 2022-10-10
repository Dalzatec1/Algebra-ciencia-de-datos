clear
for n =1:8

foto=imread('Yo.PNG');
fotog = rgb2gray ( foto );
fotodouble = im2double ( fotog );
imagen=[]

for i =1:511
  for j =1:511
    fotomodificada(i,j) = fotodouble(i,j)+(1/1.1)^n;
    

  end

end


    imshow(fotomodificada)
hold on
imwrite(fotomodificada,n+".jpg")

end
foto1000 = fotodouble+(1/1.1)^1000;
foto1000s =imshow(foto1000)
imwrite(foto1000,1000+".jpg")

limit = 0.05;
i=1
%% distancia de norma donde el limite es 0.05

while 1
l005 = fotodouble + (1/1.1)^i;
 Norma = norm ( fotodouble -l005 , 2);
    norm1 = norm(fotodouble -l005,1)
    norm2 = norm(fotodouble -l005,2)
    norminf = norm(fotodouble -l005,'inf')
    normfro = norm(fotodouble -l005,'fro')
    i=i+1
 if norm1 > limit | norm2> limit | norminf > limit | normfro > limit 
 break
 end
end


