function distance = kldist(rd, pd)
%KLDIST	  Calculate the average Kullback-Leibler divergence between the predicted label
%         distribution and the real label distribution.
%
%	Description
%   DISTANCE = KLDIST(RD, PD) calculate the average Kullback-Leibler divergence 
%   between the predicted label distribution and the real label distribution.
%
%   Inputs,
%       RD: real label distribution
%       PD: predicted label distribution
%
%   Outputs,
%       DISTANCE: Kullback-Leibler divergence
%	
temp=rd.*(log(rd./pd));
dis = sum(temp,2);
dis(dis == Inf) = [];
distance=mean(dis);
end
