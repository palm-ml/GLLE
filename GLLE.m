function [W,numerical] = GLLE(logicalLabel, features,lambda)
[d,n] = size(features);
[l,~] = size(logicalLabel);

global   trainFeature;
global   trainLabel;
global   G;
global   para;
%%%%%%% K-NN similarity matrix A %%%%%%%%
Idx = knnsearch(features,features,'K',20);
GraphConnect = zeros(size(features,1),size(features,1));
for i = 1:size(features,1)
    GraphConnect(i,Idx(i,:)) = 1;
end
GraphConnect = GraphConnect + GraphConnect';
GraphConnect(GraphConnect > 0) = 1;
sigma = 10;
A =  exp(-(L2_distance(features', features').^2) / (2 * sigma ^ 2));
A = A .* GraphConnect;
A = A - diag(diag(A));
A_hat = diag(sum(A,2));
G = A_hat - A;
%%%%%%% K-NN similarity matrix A %%%%%%%%




%%%%%%%linear model,kernel method%%%%%%%%
ker  = 'rbf'; %type of kernel function ('lin', 'poly', 'rbf', 'sam')
par  = 1*mean(pdist(features)); %parameter of kernel function
H = kernelmatrix(ker, par, features, features);% build the kernel matrix on the labeled samples (N x N)
UnitMatrix = ones(size(features,1),1);
trainFeature = [H,UnitMatrix];
%%%%%%%linear model,kernel method%%%%%%%%


trainLabel = logicalLabel;
para = lambda;
item=rand(size(trainFeature,2),size(trainLabel,2));
%save dt.mat trainFeature trainLabel G lambda
[W,fval] = fminlbfgsGLLE(@LEbfgsProcess,item);
numerical = trainFeature*W;


end
