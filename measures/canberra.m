function distance = canberra(rd,pd)
%CANBERRA	  Calculate the average Canberra between 
%               the predicted and the real label distribution.
%
%	Description
%   DISTANCE = Canberra(RD, PD) calculate the average Canberra
%   between the predicted and the real label distribution.
%
%   Inputs,
%       RD: real label distribution
%       PD: predicted label distribution
%
%   Outputs,
%       DISTANCE: Canberra
%	
temp=abs(pd-rd);
temp2=pd+rd;
temp=temp./temp2;
temp=sum(temp,2);
distance=mean(temp);
end

