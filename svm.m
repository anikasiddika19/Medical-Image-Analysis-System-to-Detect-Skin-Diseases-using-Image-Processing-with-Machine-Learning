clc;
close all;

cd D:\4.1\Thesis\DATASET\database

DF=[];

for i=1:20
    
 str1=int2str(i);
 str2=strcat(str1,'.jpg');
 
I=imread(str2);
I=double(I);
I = reshape(I.',1,[]);
e=entropy(I);

m=mean2(I);

s=std2(I);

v=mean2(var(I));

k=kurtosis(I);
sk=skewness(I);

gg=graycomatrix(I);
stats = graycoprops(gg,'Contrast Correlation Energy Homogeneity');
contrast=stats.Contrast;
core=stats.Correlation;
energy=stats.Energy;
homo=stats.Homogeneity;
RMS=mean2(rms(I));


FEAT=horzcat(1,[e m s v k sk contrast core energy homo RMS]);

DF=[DF;FEAT];

end
 
cd ..

inp=input('Enter image: ');

I2=imread(inp);

I2=double(I2);
I2 = reshape(I2.',1,[]);
e=entropy(I2);

m=mean2(I2);

s=std2(I2);

v=mean2(var(I2));

k=kurtosis(I2);
sk=skewness(I2);

gg=graycomatrix(I2);
stats = graycoprops(gg,'Contrast Correlation Energy Homogeneity');
contrast=stats.Contrast;
core=stats.Correlation;
energy=stats.Energy;
homo=stats.Homogeneity;
RMS=mean2(rms(I2));


QF=horzcat(1,[e m s v k sk contrast core energy homo RMS]);

TrainingSet=[DF(1,:);DF(2,:); DF(3,:); DF(4,:); DF(5,:); ...
    DF(6,:); DF(7,:); DF(8,:); DF(9,:); DF(10,:); DF(11,:); DF(12,:); ...
    DF(13,:); DF(14,:); DF(15,:); DF(16,:); DF(17,:); DF(18,:); DF(19,:); DF(20,:)];

GroupTrain={'1' '1' '1' '1' '1' '2' '2' '2' '2' '2' '3' '3' '3' '3' '3' '4' ...
    '4' '4' '4' '4'};


SVMModel=cell(4,1);

Y=GroupTrain;

classes=unique(Y);

rng(1);

for j=1:numel(classes)
   indx=strcmp(Y', classes(j));
   %SVMModel{j}=fitcsvm(DF,indx,'ClassNames', [false true],'Standardize', true, ...
       %'KernelFunction','rbf','BoxConstraint',1);
   SVMModel{j}=fitcknn(DF,indx,'NumNeighbors',5,'Standardize',1);
 
end
xGrid=QF;
for j=1:numel(classes)
   [~,score]=predict(SVMModel{j},xGrid);
   Scores(:,j)=score(:,2)
    
end

[~,maxScore] = max(Scores,[],2);

result=maxScore;
%figure,imshow(I2),title('Input');

if result==1
msgbox('Dermatitis')
elseif result==2
msgbox('Impetigo')
elseif result==3   
 msgbox('Melanoma')
elseif result==4
 msgbox('Ulcer')
end

