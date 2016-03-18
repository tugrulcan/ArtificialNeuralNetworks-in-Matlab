clc
errorTrainingNew=[];
errorTestNew=[];
ann_all={};
for i = 1 : 10
    y = 3;
    y_i = [y i]
    [net,errorTraining,errorTest] = pr9_ann_model_function(y,1);
    ann_all{i} = net;
    errorTrainingNew = [errorTrainingNew;errorTraining];
    errorTestNew = [errorTestNew;errorTest];
end

% min, mean and max percentages of errors in training/test sets
temp = [];
trainingMin = -1;
trainingMean = -1;
trainingMax = -1;

temp = min(errorTrainingNew);
trainingMin = temp(:,[1]);

temp = [];
temp = mean(errorTrainingNew);
trainingMean = temp(:,[1]);

temp = [];
temp = max(errorTrainingNew);
trainingMax = temp(:,[2]);
disp('trainingMin -  trainingMean - trainingMax')
[trainingMin trainingMean trainingMax]

temp = [];
temp = min(errorTestNew) ;
testMin = temp(:,[1]);

temp = [];
temp = mean(errorTestNew) ;
testMean = temp(:,[1]);

temp = [];
temp = max(errorTestNew);
testMax = temp(:,[2]);

disp('Test Min - Test Mean - Test Max')
[testMin testMean testMax]
save pr9_ann_model_3_300_50.mat

errorTrainingNew=[];
errorTestNew=[];
ann_all={};
for i=1:10 % same operations for ann which has two hidden layers
    y = 3;
    y_i=[y y i]
    [net,errorTraining,errorTest]=pr9_ann_model_function(y,2);
    ann_all{i}=net;
    errorTrainingNew=[errorTrainingNew;errorTraining];
    errorTestNew=[errorTestNew;errorTest];
end
% min, mean and max percentages of errors in training/test sets
temp = [];
temp = min(errorTrainingNew);
trainingMin = temp(:,[1]);

temp = [];
temp = mean(errorTrainingNew);
trainingMean = temp(:,[1]);

temp = [];
temp = max(errorTrainingNew);
trainingMax = temp(:,[2]);

disp('trainingMin - Egitim Ortalama - Egitim Max')
[trainingMin trainingMean trainingMax]

temp = [];
temp = min(errorTestNew) ;
testMin = temp(:,[1]);

temp = [];
temp = mean(errorTestNew) ;
testMean = temp(:,[1]);

temp = [];
temp = max(errorTestNew);
testMax = temp(:,[2]);

disp('Test Min - Test Ortalama - Test Max')
[testMin testMean testMax]
save pr9_ann_model_3_3_300_50.mat
