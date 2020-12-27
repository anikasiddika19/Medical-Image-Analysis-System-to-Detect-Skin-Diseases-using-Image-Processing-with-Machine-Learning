
clc;
close all;

load('Train_Feat.mat');
load('Train_Label.mat'); 
load('Test_Feat.mat'); 
load('Test_Label.mat');


y_train_transpose = transpose(Train_Label);
y_test_transpose = transpose(Test_Label);

%initialization
%number of class-10
%number of test samples-3251
SVMModel = cell(4,1);
label = zeros(4,5504);

%1 in the place of index, other class 0
trainingClassLabelsMatrix = full(ind2vec(y_train_transpose,4));

%train the model one-vs-all
for index=1:4
    SVMModel{index} = fitcknn(Train_Feat,trainingClassLabelsMatrix(index,:),'NumNeighbors',3);
end

%Test_Feat=Test_Feat(57,:);
%X_test=X_test(nm,:);
%predict values
for index=1:4
    [~,score] = predict(SVMModel{index},Test_Feat);
    %Scores(:,j)=score(:,2)
    
end

%[~,maxScore] = max(Scores,[],2);
[Xknn1,Yknn1,Tknn1,AUCknn1] = perfcurve(Test_Label,score(:,1),'1');

for index=1:4
    SVMModel{index} = fitcsvm(Train_Feat,trainingClassLabelsMatrix(index,:),'Standardize',true,'KernelFunction','RBF',...
  'KernelScale', 'auto');
end

%Test_Feat=Test_Feat(57,:);
%X_test=X_test(nm,:);
%predict values
for index=1:4
    [~,score2] = predict(SVMModel{index},Test_Feat);
end
[Xsvm1,Ysvm1,Tsvm1,AUCsvm1] = perfcurve(Test_Label,score2(:,1),'1');


for index=1:4
    SVMModel2{index} = fitcsvm(Train_Feat,trainingClassLabelsMatrix(index,:),'KernelFunction','linear');
end

%Test_Feat=Test_Feat(57,:);
%X_test=X_test(nm,:);
%predict values
for index=1:4
    [~,score3] = predict(SVMModel2{index},Test_Feat);
end
[Xsvm11,Ysvm11,Tsvm11,AUCsvm11] = perfcurve(Test_Label,score3(:,1),'1');




%%%%%Impetigo
[Xknn2,Yknn2,Tknn2,AUCknn2] = perfcurve(Test_Label,score(:,1),'2');

[Xsvm2,Ysvm2,Tsvm2,AUCsvm2] = perfcurve(Test_Label,score2(:,1),'2');

[Xsvm22,Ysvm22,Tsvm22,AUCsvm22] = perfcurve(Test_Label,score3(:,1),'2');








%%%melanoma



[Xknn3,Yknn3,Tknn3,AUCknn3] = perfcurve(Test_Label,score(:,1),'3');

[Xsvm3,Ysvm3,Tsvm3,AUCsvm3] = perfcurve(Test_Label,score2(:,1),'3');
[Xsvm33,Ysvm33,Tsvm33,AUCsvm33] = perfcurve(Test_Label,score3(:,1),'3');




[Xknn4,Yknn4,Tknn4,AUCknn4] = perfcurve(Test_Label,score(:,1),'4');

[Xsvm4,Ysvm4,Tsvm4,AUCsvm4] = perfcurve(Test_Label,score2(:,1),'4');
[Xsvm44,Ysvm44,Tsvm44,AUCsvm44] = perfcurve(Test_Label,score3(:,1),'4');





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
[Xknn1_Q,Yknn1_Q,Tknn1_Q,AUCknn1_Q] = perfcurve(Test_Label_IQA,score(:,1),'1');

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
[Xsvm1_Q,Ysvm1_Q,Tsvm1_Q,AUCsvm1_Q] = perfcurve(Test_Label_IQA,score2(:,1),'1');


for index=1:4
    SVMModel2{index} = fitcsvm(Train_Feat_IQA,trainingClassLabelsMatrix(index,:),'KernelFunction','linear');
end

%Test_Feat=Test_Feat(57,:);
%X_test=X_test(nm,:);
%predict values
for index=1:4
    [~,score3] = predict(SVMModel2{index},Test_Feat_IQA);
end
[Xsvm11_Q,Ysvm11_Q,Tsvm11_Q,AUCsvm11_Q] = perfcurve(Test_Label_IQA,score3(:,1),'1');

figure;
plot(Xsvm1,Ysvm1,'LineWidth', 2);
hold on
plot(Xknn1,Yknn1, 'LineWidth', 2);
plot(Xsvm11,Ysvm11,'LineWidth',2);

plot(Xsvm1_Q,Ysvm1_Q,'LineWidth', 2);
plot(Xknn1_Q,Yknn1_Q, 'LineWidth', 2);
plot(Xsvm11_Q,Ysvm11_Q,'LineWidth',2);

xlabel('False Positive Ratio (1-specificity)','fontsize',10,'FontWeight','bold');
ylabel('True Positive Ratio (Sensitivity)','fontsize',10,'FontWeight','bold');
title('ROC For Dermatitis') 
grid on

ROCtitle_1=['NL-SVM using GLCM'];
ROCtitle_2=['KNN using GLCM']; 
ROCtitle_3=['L-SVM using GLCM'];
ROCtitle_4=['NL-SVM using IQA'];
ROCtitle_5=['KNN using IQA']; 
ROCtitle_6=['L-SVM using IQA'];


hh1=legend((ROCtitle_1),(ROCtitle_2),(ROCtitle_3),(ROCtitle_4),(ROCtitle_5),(ROCtitle_6),'Location','northwest');
set(hh1,'edgecolor','black')

%%%%%Impetigo
[Xknn2_Q,Yknn2_Q,Tknn2_Q,AUCknn2_Q] = perfcurve(Test_Label_IQA,score(:,1),'2');

[Xsvm2_Q,Ysvm2_Q,Tsvm2_Q,AUCsvm2_Q] = perfcurve(Test_Label_IQA,score2(:,1),'2');

[Xsvm22_Q,Ysvm22_Q,Tsvm22_Q,AUCsvm22_Q] = perfcurve(Test_Label_IQA,score3(:,1),'2');




figure;
plot(Xsvm2,Ysvm2,'LineWidth', 2);
hold on
plot(Xknn2,Yknn2, 'LineWidth', 2);
plot(Xsvm22,Ysvm22,'LineWidth', 2);

plot(Xsvm2_Q,Ysvm2_Q,'LineWidth', 2);
plot(Xknn2_Q,Yknn2_Q, 'LineWidth', 2);
plot(Xsvm22_Q,Ysvm22_Q,'LineWidth', 2);

xlabel('False Positive Ratio (1-specificity)','fontsize',10,'FontWeight','bold');
ylabel('True Positive Ratio (Sensitivity)','fontsize',10,'FontWeight','bold');
title('ROC For Impetigo') 
grid on
ROCtitle_1=['NL-SVM using GLCM'];
ROCtitle_2=['KNN using GLCM']; 
ROCtitle_3=['L-SVM using GLCM'];
ROCtitle_4=['NL-SVM using IQA'];
ROCtitle_5=['KNN using IQA']; 
ROCtitle_6=['L-SVM using IQA'];


hh1=legend((ROCtitle_1),(ROCtitle_2),(ROCtitle_3),(ROCtitle_4),(ROCtitle_5),(ROCtitle_6),'Location','southeast');
set(hh1,'edgecolor','black')


%%%melanoma



[Xknn3_Q,Yknn3_Q,Tknn3_Q,AUCknn3_Q] = perfcurve(Test_Label_IQA,score(:,1),'3');

[Xsvm3_Q,Ysvm3_Q,Tsvm3_Q,AUCsvm3_Q] = perfcurve(Test_Label_IQA,score2(:,1),'3');
[Xsvm33_Q,Ysvm33_Q,Tsvm33_Q,AUCsvm33_Q] = perfcurve(Test_Label_IQA,score3(:,1),'3');




figure;
plot(Xsvm3,Ysvm3,'LineWidth', 2);
hold on
plot(Xknn3,Yknn3,'LineWidth', 2);
plot(Xsvm33,Ysvm33,'LineWidth', 2);

plot(Xsvm3_Q,Ysvm3_Q,'LineWidth', 2);
plot(Xknn3_Q,Yknn3_Q,'LineWidth', 2);
plot(Xsvm33_Q,Ysvm33_Q,'LineWidth', 2);

xlabel('False Positive Ratio (1-specificity)','fontsize',10,'FontWeight','bold');
ylabel('True Positive Ratio (Sensitivity)','fontsize',10,'FontWeight','bold');
title('ROC For Melanoma') 
grid on
ROCtitle_1=['NL-SVM using GLCM'];
ROCtitle_2=['KNN using GLCM']; 
ROCtitle_3=['L-SVM using GLCM'];
ROCtitle_4=['NL-SVM using IQA'];
ROCtitle_5=['KNN using IQA']; 
ROCtitle_6=['L-SVM using IQA'];


hh1=legend((ROCtitle_1),(ROCtitle_2),(ROCtitle_3),(ROCtitle_4),(ROCtitle_5),(ROCtitle_6),'Location','southeast');
set(hh1,'edgecolor','black')


[Xknn4_Q,Yknn4_Q,Tknn4_Q,AUCknn4_Q] = perfcurve(Test_Label_IQA,score(:,1),'4');

[Xsvm4_Q,Ysvm4_Q,Tsvm4_Q,AUCsvm4_Q] = perfcurve(Test_Label_IQA,score2(:,1),'4');
[Xsvm44_Q,Ysvm44_Q,Tsvm44_Q,AUCsvm44_Q] = perfcurve(Test_Label_IQA,score3(:,1),'4');



figure;
plot(Xsvm4,Ysvm4,'LineWidth', 2);
hold on
plot(Xknn4,Yknn4,'LineWidth', 2);
plot(Xsvm44,Ysvm44,'LineWidth', 2);

plot(Xsvm4_Q,Ysvm4_Q,'LineWidth', 2);
plot(Xknn4_Q,Yknn4_Q,'LineWidth', 2);
plot(Xsvm44_Q,Ysvm44_Q,'LineWidth', 2);


xlabel('False Positive Ratio (1-specificity)','fontsize',10,'FontWeight','bold');
ylabel('True Positive Ratio (Sensitivity)','fontsize',10,'FontWeight','bold');
title('ROC For Diabetic Foot Ulcer') 
grid on
ROCtitle_1=['NL-SVM using GLCM'];
ROCtitle_2=['KNN using GLCM']; 
ROCtitle_3=['L-SVM using GLCM'];
ROCtitle_4=['NL-SVM using IQA'];
ROCtitle_5=['KNN using IQA']; 
ROCtitle_6=['L-SVM using IQA'];


hh1=legend((ROCtitle_1),(ROCtitle_2),(ROCtitle_3),(ROCtitle_4),(ROCtitle_5),(ROCtitle_6),'Location','northwest');
set(hh1,'edgecolor','black')


