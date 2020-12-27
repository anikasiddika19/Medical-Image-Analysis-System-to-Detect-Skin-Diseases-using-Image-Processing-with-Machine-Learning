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


%%accuracy

cd D:\4.1\Thesis\DATASET\db2

TF=[];
GroupTest=[2 2 3 1 3 4];
for i=1:6
    
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

TF=[TF;FEAT];


for j=1:numel(classes)
   [~,score]=predict(SVMModel{j},TF(i,:));
   Scores(:,j)=score(:,2);
    
end

[~,maxScore] = max(Scores,[],2);

result=maxScore;
result
%figure,imshow(I2),title('Input');

summ=0;
if GroupTest(i) == result
   summ=summ+1;
end

end

fprintf('Sum = %f%%\n',summ);

%calculate accuracy
accuracy = summ/length(GroupTest);
accuracyPercentage = 100*accuracy;
fprintf('Accuracy = %f%%\n',accuracyPercentage)
