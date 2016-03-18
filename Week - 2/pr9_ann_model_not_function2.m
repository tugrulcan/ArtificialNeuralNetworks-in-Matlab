DataGeneratorforPavianiFunction();
load  dataPavianiFunc.mat  


%Creating training and test data
inputTraining = x_matris(1:800,:)'; % train inputs
outputTraining = results(1:800,:)'; % training outputs
inputTest = x_matris(801:1000,:)'; % test inputs
outputTest = results(801:1000,:)'; % test outputs


% minmax(x_matris')

inputTrainingNew=(inputTraining)./(10.98); 
inputTestNew=(inputTest)./(10.98); 

minoutputTraining = min(min(outputTraining));
minOutputTest = min(min(outputTest));

outputTrainingRange = max(max(outputTraining)) - min(min(outputTraining))  ;
outputTestRange = max(max(outputTest)) - min(min(outputTest))  ;
outputTrainingNew = ( ( (outputTraining -  minoutputTraining ) * (0.8))./ ( outputTrainingRange )) + 0.1;
outputTestNew = ( ( (outputTest - minOutputTest) * (0.8))./ (outputTestRange)) + 0.1;


pr9_model1=newff(minmax(inputTrainingNew),[10,10,10,1],{'tansig','tansig','tansig','purelin'},'trainlm');
pr9_model1.trainParam.show = 10;
pr9_model1.trainParam.epochs = 300;
pr9_model1.trainParam.goal = 1e-9;
pr9_model1.trainParam.min_grad = 1e-9;
[pr9_model1,tr]=train(pr9_model1,inputTrainingNew,outputTrainingNew);



ann=sim(pr9_model1,inputTrainingNew);
error_training=abs(((ann-outputTrainingNew)./ann)*100);
Re1 = corrcoef(ann,outputTrainingNew);
bigger_than_five=size(find(error_training>5));
[mean(error_training) max(error_training) bigger_than_five(2)]

subplot(2,1,1),plot(outputTrainingNew)
subplot(2,1,2),plot((sim(pr9_model1,inputTrainingNew)))


%gerçek
ann=sim(pr9_model1,inputTrainingNew).*outputTrainingRange-minoutputTraining;
error_training=abs((ann-outputTraining)./ann)*100;
Re2 = corrcoef(ann,outputTraining);
bigger_than_five=size(find(error_training>5));
[mean(error_training) max(error_training) bigger_than_five(2)]


%'test'
% normalize
ann=sim(pr9_model1,inputTestNew);
error_test=abs((ann-outputTestNew)./ann)*100;
bigger_than_five=size(find(error_test>5));
[mean(error_test) max(error_test) bigger_than_five(2)]

Rt = corrcoef(ann,outputTestNew);
subplot(2,1,1),plot(outputTestNew)
subplot(2,1,2),plot(ann)


