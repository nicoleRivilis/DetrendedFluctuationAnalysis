function [scalingExp, L, F] = DFA(timeSeries)
%given a time series, finds the scaling exponent and outputs the vector L
%of windows and corresponding fluctuation for easy plotting 


%renamed so don't have to keep retyping "timeSeries"
x = timeSeries;

%conversion to unbounded process X by integrating the difference to the
%average value of the time series
X = cumsum(x - mean(x));

%create vector L of windows that seem to work for now (logarithmically
%spaced)
L = floor(length(X)./(2.^(4:.25:floor(log2(length(X))-4))));

%initialize fluctuation vector with zeros to match number of windows
F = zeros(1,length(L));

%for each window length, compute the fluctuation

count = 0;

for n = L
  
    count = count + 1;
    
    %make X an even multiple of the window length
    Xn = X(1:(end - rem(length(X),n)));
    
    %create Y so each row in Y represents one time window
    Y = reshape(Xn,n,ceil(length(Xn)/n))';

    %find and minimize least squared error with respect to local linear fit
    squaredErr = [];
    
    %find the local least squared fits and errors
    for i = 1:size(Y,1)
        
        leastSqFit = polyfit(1:size(Y,2),Y(i,:),1);
    
        squaredErr(i) = sum((Y(i,:) - (leastSqFit(1)*(1:size(Y,2))+leastSqFit(2))).^2);

    end
    
    %fluctuation (RMS deviation from trend) is calculated for each window
    F(count) = sqrt(sum(squaredErr)); 
    
end

%plot fluctuation as a function of window size on a log-log scale plot
%loglog(L, F, 'o')
%title('Effect of Window Size on Fluctuation')

%find scaling exponent
lineFit = polyfit(log(L),log(F),1);

scalingExp = lineFit(1);

end





