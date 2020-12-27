x1=1;
iqa=2.325821;

hold on;

%plot(x1,iqa,'Ob');
bar(x1,iqa);

glcm=1.006502;
x2=2;
%plot(x1,glcm,'Xb');
bar(x2,glcm);
xlabel(' IQA          GLCM', 'FontSize', 20);
ylabel('Runtime in seconds', 'FontSize', 20);
title('Comparison of runtime', 'FontSize', 20);

hold off;

x=[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16];
y=[1,2,5,9,18,35,41,54,112,94,58,139,182,209,219,341];
plot(x,y,'--gs',...
    'LineWidth',2,...
    'MarkerSize',10,...
    'MarkerEdgeColor','b',...
    'MarkerFaceColor',[0.5,0.5,0.5]);

xlabel('1->2->5->9->18->35->41->54->112->94->58->139->182->209->219->341', 'FontSize', 11);
ylabel('Number of positive Corona cases', 'FontSize', 15);
%title('Comparison of runtime', 'FontSize', 20);
