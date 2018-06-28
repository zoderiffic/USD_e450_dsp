


%% 
clear; clc;close all;
L = 10;
N = 50;
x = [ones(1,L) zeros(1,N-L)];
X = dft(x,N);

figure
subplot (2,1,1)

stem(abs(X));
title(['Magnitude response of X\omega with N=' num2str(N) 'and L=' num2str(L) ])
subplot (2,1,2)
stem(angle(X));
title(['Phase response of X\omega with N=' num2str(N) 'and L=' num2str(L) ])
saveas(gcf, ['Fig 7.1.6 with N=' num2str(N) ' and L=' num2str(L) '.jpg'])


%% 


clear; clc;close all;
L = 10;
N = 100;
x = [ones(1,L) zeros(1,N-L)];
X = dft(x,N);

figure
subplot (2,1,1)

stem(abs(X));
title(['Magnitude response of X\omega with N=' num2str(N) 'and L=' num2str(L) ])
subplot (2,1,2)
stem(angle(X));
title(['Phase response of X\omega with N=' num2str(N) 'and L=' num2str(L) ])
saveas(gcf, ['Fig 7.1.6 with N=' num2str(N) ' and L=' num2str(L) '.jpg'])



%%
clear; clc;close all;
N = 100;
L = 4;
x = [0 1 2 3 zeros(1,N-L)];
X = dft(x,N);

figure
subplot (2,1,1)

stem(abs(X));
title(['Magnitude response of X\omega with N=' num2str(N) 'and L=' num2str(L) ])
subplot (2,1,2)
stem(angle(X));
title(['Phase response of X\omega with N=' num2str(N) 'and L=' num2str(L) ])
saveas(gcf, ['Example 7.1.3 with N=' num2str(N) ' and L=' num2str(L) '.jpg'])

%%



clear; clc;close all;
N = 4;
L = 4;
x = [0 1 2 3 ];
X = dft(x,N);

figure
subplot (2,1,1)

stem(abs(X));
title(['Magnitude response of X\omega with N=' num2str(N) 'and L=' num2str(L) ])
subplot (2,1,2)
stem(angle(X));
title(['Phase response of X\omega with N=' num2str(N) 'and L=' num2str(L) ])
saveas(gcf, ['Example 7.2.2 with N=' num2str(N) ' and L=' num2str(L) '.jpg'])

%%
clc;clear;close all;
x = [1, 1, 1, zeros(1,13)];
h_1 = [0, 1,  zeros(1,length(x)-2)];
h_2 = [zeros(1,length(x)-1) , 1];


X = dft(x,16);
H_1= dft(h_1,16);
H_2 = dft(h_2,16);

X_1 =X.*H_1;
x_1 = ift(X_1,16);

X_2 =X.*H_2
x_2 = ift(X_2,16);

subplot (3, 2, 1)
stem (abs(X))
title('Magnitude of X(\omega) of from x(n)')

subplot (3, 2, 2)
stem (angle(X))
title('Phase  of X(\omega) of from x(n)')


subplot (3, 2, 3)
stem (abs(X_1))
title('Magnitude of X(\omega) of from x(n-1)')

subplot (3, 2, 4)
stem (angle(X_1))
title('Phase  of X(\omega) of from x(n-1)')


subplot (3, 2, 5)
stem (abs(X_2))
title('Magnitude of X(\omega) of from x(n+1)')

subplot (3, 2, 6)
stem (angle(X_2))
title('Phase  of X(\omega) of from x(n+1)')


x_wr= (unwrap(x));
x_2_wr=unwrap(real(x_2));
x_1_wr=unwrap(real(x_1));


figure 
subplot(3,1,1)
stem(x_wr)
title('Unwrapped phase of x(n)')
subplot(3,1,2)
stem(x_1_wr)
title('Unwrapped phase of x(n-1)')
subplot(3,1,3)
stem(x_2_wr)
title('Unwrapped phase of x(n+1)')





