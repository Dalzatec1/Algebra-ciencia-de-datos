f=dir('fotos11/*.jpg');
files={f.name};

for k=1:length(f)
  Im{k}=imread(strcat('fotos11/',files{k}));
end

% Escala de grises
for k=1:length(f)
  gris{k}=rgb2gray(Im{k});
  gris2double{k} = im2double (gris{k});

end

%montage(gris)


for i=1:length(f)

    sujeto1=gris2double{i};

    for j=1:length(f)
        sujetoJ=gris2double{j};
        Norm1(j) = norm ((( sujeto1 - sujetoJ )) ,1);
        Norm2(j) = norm ((( sujeto1 - sujetoJ )) ,2);
        Norminf(j) = norm (((sujeto1 - sujetoJ )) ,"inf");
        Normfro(j) = norm ((( sujeto1 - sujetoJ)) ,"fro");
        
    end
    media1=mean(Norm1);
    media2(i)=mean(Norm2);
    mediainf=mean(Norminf);
    media1fro=mean(Normfro);
    mediana(i)=mean(media1+media2+mediainf+media1fro);
end
media2
radio=mean(media2)
minimo=min(media2)
indice=find(media2==minimo)
imshow(gris2double{indice})

