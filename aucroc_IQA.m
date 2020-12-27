
clc;
close all;

load('Train_Feat_IQA.mat');
load('Train_Label_IQA.mat'); 
load('Test_Feat_IQA.mat'); 
load('Test_Label_IQA.mat');


y_train_transpose = transpose(Train_Label_IQA);
y_test_transpose = transpose(Test_Label_IQA);

%initialization
%number of class-10
%number of test samples-3251
SVMModel = cell(4,1);
label = zeros(4,5504);

%1 in the place of index, other class 0
trainingClassLabelsMatrix = full(ind2vec(y_train_transpose,4));

%train the model one-vs-all
for index=1:4
    SVMModel{index} = fitcknn(Train_Feat_IQA,trainingClassLabelsMatrix(index,:),'NumNeighbors',3);
end

%Test_Feat=Test_Feat(57,:);
%X_test=X_test(nm,:);
%predict values
for index=1:4
    [~,score] = predict(SVMModel{index},Test_Feat_IQA);
    %Scores(:,j)=score(:,2)
    
end

%[~,maxScore] = max(Scores,[],2);
[Xknn1,Yknn1,Tknn1,AUCknn1] = perfcurve(Test_Label_IQA,score(:,1),'1');

for index=1:4
    SVMModel{index} = fitcsvm(Train_Feat_IQA,trainingClassLabelsMatrix(index,:),'Standardize',true,'KernelFunction','RBF',...
  'KernelScale', 'auto');
end

%Test_Feat=Test_Feat(57,:);
%X_test=X_test(nm,:);
%predict values
for index=1:4
    [~,score2] = predict(SVMModel{index},Test_Feat_IQA);
end
[Xsvm1,Ysvm1,Tsvm1,AUCsvm1] = perfcurve(Test_Label_IQA,score2(:,1),'1');


for index=1:4
    SVMModel2{index} = fitcsvm(Train_Feat_IQA,trainingClassLabelsMatrix(index,:),'KernelFunction','linear');
end

%Test_Feat=Test_Feat(57,:);
%X_test=X_test(nm,:);
%predict values
for index=1:4
    [~,score3] = predict(SVMModel2{index},Test_Feat_IQA);
end
[Xsvm11,Ysvm11,Tsvm11,AUCsvm11] = perfcurve(Test_Label_IQA,score3(:,1),'1');

figure;
plot(Xsvm1,Ysvm1,'LineWidth', 2);
hold on
plot(Xknn1,Yknn1, 'LineWidth', 2);
plot(Xsvm11,Ysvm11,'LineWidth',2);

xlabel('False Positive Ratio (1-specificity)','fontsize',10,'FontWeight','bold');
ylabel('True Positive Ratio (Sensitivity)','fontsize',10,'FontWeight','bold');
title('ROC For Dermatitis') 
grid on
ROCtitle_1=['AUC-SVM-L = ',num2str(roundn(AUCsvm11,-3))];
ROCtitle_2=['AUC-SVM-NL = ',num2str(roundn(AUCsvm1,-3))]; 
ROCtitle_3=['AUC-KNN = ',num2str(roundn(AUCknn1,-3))];
hh1=legend((ROCtitle_1),(ROCtitle_2),(ROCtitle_3),'Location','northwest');
set(hh1,'edgecolor','black')

%%%%%Impetigo
[Xknn2,Yknn2,Tknn2,AUCknn2] = perfcurve(Test_Label_IQA,score(:,1),'2');

[Xsvm2,Ysvm2,Tsvm2,AUCsvm2] = perfcurve(Test_Label_IQA,score2(:,1),'2');

[Xsvm22,Ysvm22,Tsvm22,AUCsvm22] = perfcurve(Test_Label_IQA,score3(:,1),'2');




figure;
plot(Xsvm2,Ysvm2,'LineWidth', 2);
hold on
plot(Xknn2,Yknn2, 'LineWidth', 2);
plot(Xsvm22,Ysvm22,'LineWidth', 2);

xlabel('False Positive Ratio (1-specificity)','fontsize',10,'FontWeight','bold');
ylabel('True Positive Ratio (Sensitivity)','fontsize',10,'FontWeight','bold');
title('ROC For Impetigo') 
grid on
ROCtitle_1=['AUC-SVM-L = ',num2str(roundn(AUCsvm22,-3))];
ROCtitle_2=['AUC-SVM-NL = ',num2str(roundn(AUCsvm2,-3))]; 
ROCtitle_3=['AUC-KNN = ',num2str(roundn(AUCknn2,-3))];
hh1=legend((ROCtitle_1),(ROCtitle_2),(ROCtitle_3),'Location','southeast');
set(hh1,'edgecolor','black')

%%%melanoma



[Xknn3,Yknn3,Tknn3,AUCknn3] = perfcurve(Test_Label_IQA,score(:,1),'3');

[Xsvm3,Ysvm3,Tsvm3,AUCsvm3] = perfcurve(Test_Label_IQA,score2(:,1),'3');
[Xsvm33,Ysvm33,Tsvm33,AUCsvm33] = perfcurve(Test_Label_IQA,score3(:,1),'3');




figure;
plot(Xsvm3,Ysvm3,'LineWidth', 2);
hold on
plot(Xknn3,Yknn3,'LineWidth', 2);
plot(Xsvm33,Ysvm33,'LineWidth', 2);

xlabel('False Positive Ratio (1-specificity)','fontsize',10,'FontWeight','bold');
ylabel('True Positive Ratio (Sensitivity)','fontsize',10,'FontWeight','bold');
title('ROC For Melanoma') 
grid on
ROCtitle_1=['AUC-SVM-L = ',num2str(roundn(AUCsvm33,-3))];
ROCtitle_2=['AUC-SVM-NL = ',num2str(roundn(AUCsvm3,-3))]; 
ROCtitle_3=['AUC-KNN = ',num2str(roundn(AUCknn3,-3))];
hh1=legend((ROCtitle_1),(ROCtitle_2),(ROCtitle_3),'Location','southeast');
set(hh1,'edgecolor','black')

[Xknn4,Yknn4,Tknn4,AUCknn4] = perfcurve(Test_Label_IQA,score(:,1),'4');

[Xsvm4,Ysvm4,Tsvm4,AUCsvm4] = perfcurve(Test_Label_IQA,score2(:,1),'4');
[Xsvm44,Ysvm44,Tsvm44,AUCsvm44] = perfcurve(Test_Label_IQA,score3(:,1),'4');



figure;
plot(Xsvm4,Ysvm4,'LineWidth', 2);
hold on
plot(Xknn4,Yknn4,'LineWidth', 2);
plot(Xsvm44,Ysvm44,'LineWidth', 2);

xlabel('False Positive Ratio (1-specificity)','fontsize',10,'FontWeight','bold');
ylabel('True Positive Ratio (Sensitivity)','fontsize',10,'FontWeight','bold');
title('ROC For Diabetic Foot Ulcer') 
grid on
ROCtitle_1=['AUC-SVM-L = ',num2str(roundn(AUCsvm44,-3))];
ROCtitle_2=['AUC-SVM-NL = ',num2str(roundn(AUCsvm4,-3))]; 
ROCtitle_3=['AUC-KNN = ',num2str(roundn(AUCknn4,-3))];
hh1=legend((ROCtitle_1),(ROCtitle_2),(ROCtitle_3),'Location','northwest');
set(hh1,'edgecolor','black')


