function [X] = dft(x,N)
%DFT gives out a discrete fourrier transform
%   inputs x -> function N is number of DFT points
if   N > length(x)
    x=[x , zeros(1,N-length(x))];
end 

for k = 1:N
    X(k) = 0;
    for n = 1:N
        X(k)= X(k)+ x(n)*exp((-1j)*2*pi*(k-1)*(n-1)/N);
    end
end


end

