function distance = cosine(rd,pd)
%COSINE	  Calculate the average Cosine between 
%               the predicted and the real label distribution.
%
%	Description
%   DISTANCE = Cosine(RD, PD) calculate the average Cosine
%   between the predicted and the real label distribution.
%
%   Inputs,
%       RD: real label distribution
%       PD: predicted label distribution
%
%   Outputs,
%       DISTANCE: Cosine
%	
inner=sum(pd.*rd,2);
len=(sqrt(sum(pd.*pd,2))).*(sqrt(sum(rd.*rd,2)));
distance=mean(inner./len);
end


