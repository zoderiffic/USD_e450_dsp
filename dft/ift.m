function [x] = ift(X,N)
%IFT provides an inverse discrete fourrier transform 
 for n = 1:N
    x(n) = 0;
    for k = 1:N
        x(n) = x(n) + ((1/N)*(X(k) * exp((-i*2*pi*-(k-1)*(n-1))/N)));
    end

end

