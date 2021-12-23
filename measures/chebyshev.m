function distance = chebyshev(rd,pd)
%CHEBYSHEV	  Calculate the average Chebyshev between 
%               the predicted and the real label distribution.
%
%	Description
%   DISTANCE = Chebyshev(RD, PD) calculate the average Chebyshev
%   between the predicted and the real label distribution.
%
%   Inputs,
%       RD: real label distribution
%       PD: predicted label distribution
%
%   Outputs,
%       DISTANCE: Chebyshev
%	
temp=abs(pd-rd);
temp=max(temp')';
distance=mean(temp);
end

