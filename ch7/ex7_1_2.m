%ex_ pg 457
L =10;
N = 10;

x=ones(1,15);
k=0:N-1;

wk = 2 * pi .*k/N;

for k_index = 1:N
    X(k_index) = 0;
    for n_index = 1:length(k)
        X(w_index)=X(w_index)+exp(-1j*wk(n_index))*x(n_index);
    end
end
