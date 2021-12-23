function similarity=intersection(rd,pd)
%INTERSECTION	Calculate the average intersection between the predicted label
%               distribution and the real label distribution.
%
%	Description
%   SIMILARITY = INTERSECTION(RD, PD)	Calculate the average intersection
%   between the predicted label distribution and the real label distribution.
%
%   Inputs,
%       RD: real label distribution
%       PD: predicted label distribution
%
%   Outputs,
%       SIMILARITY: the average of intersection
%
temp=sum(min(pd,rd),2);
similarity=mean(temp);
end