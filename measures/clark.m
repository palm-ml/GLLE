function distance=clark(rd,pd)
%CLARK	  Calculate the average Clark between 
%               the predicted and the real label distribution.
%
%	Description
%   DISTANCE = Clark(RD, PD) calculate the average Clark
%   between the predicted and the real label distribution.
%
%   Inputs,
%       RD: real label distribution
%       PD: predicted label distribution
%
%   Outputs,
%       DISTANCE: Clark
%	
temp=pd-rd;
temp=temp.*temp;
temp2=pd+rd;
temp2=temp2.*temp2;
temp=temp./temp2;
temp=sum(temp,2);
temp=sqrt(temp);
distance=mean(temp);
end

