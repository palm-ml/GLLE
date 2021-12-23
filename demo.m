clc
clear
addpath(genpath(pwd));

dataset={'LDL_DataSets\SJAFFE'};
T=strcat(dataset(1),'.mat');
load(T{1,1});
T=strcat(dataset(1),'_binary.mat');
load(T{1,1});


features = zscore(features);
lambda = 0.01;

[W, numerical] = GLLE(logicalLabel, features,lambda);
distribution = (softmax(numerical'))';

Result = zeros(6,1);
Result(1,1) = chebyshev(distribution,labelDistribution);
Result(2,1) = clark(distribution,labelDistribution);
Result(3,1) = canberra(distribution,labelDistribution);
Result(4,1) = kldist(distribution,labelDistribution);
Result(5,1) = cosine(distribution,labelDistribution);
Result(6,1) = intersection(distribution,labelDistribution);





