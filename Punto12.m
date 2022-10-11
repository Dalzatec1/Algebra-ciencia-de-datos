clear
clc
f=dir('fotos/*.jpg');
files={f.name};

for k=1:length(f)
  Im{k}=imread(strcat('fotos/',files{k}));
end

% Escala de grises
for k=1:length(f)
  gris{k}=rgb2gray(Im{k});
  gris2double{k} = im2double (gris{k});

end
fotolaura=imread('Captura.jpg');
lauragris=rgb2gray(fotolaura);

laura=im2double(lauragris);


    for j=1:length(f)
        sujetoJ=gris2double{j};
        Norm1(j) = norm ((( laura - sujetoJ )) ,1);
        Norm2(j) = norm ((( laura - sujetoJ )) ,2);
        Norminf(j) = norm (((laura - sujetoJ )) ,"inf");
        Normfro(j) = norm ((( laura - sujetoJ)) ,"fro");
        
    end
 
    %media1=mean(Norm1)
    %media2=mean(Norm2)
    %mediainf=mean(Norminf)
    %media1fro=mean(Normfro)

%cercanos=sort(Norm1)
cercanos=sort(Norm2)
cercanos
%cercanos=sort(Norminf)
%cercanos=sort(Normfro)

for a=1:length(Norm2)
    indeximagenes(a)=find(Norm2==cercanos(a));
end

indeximagenes
Knears{1}=lauragris;
Kindex=2;
for k=1:22
    number=indeximagenes(k);
    Knears{Kindex}=gris{number};
    Kindex=Kindex+1;
end

montage(Knears)
cercanos(1:22)