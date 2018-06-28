clc;clear; close all;


amp = 5;
n = -20:20;
w = -3*pi:1/1000:3*pi;
M = 2:5;




M= 2
x_n = amp*([zeros(1,floor(length(n)/2-M)) ones(1,2*M+1) zeros(1,floor(length(n)/2-M))] );

X_w = (amp*sin((M+0.5).*w))./sin(w./2);


figure
subplot (4,1,1)

stem (n,x_n)
title (['x(n) with M = ' num2str(M)])


subplot (4,1,2)
plot (w,X_w)
title (['X(\omega) with M = ' num2str(M)])




subplot (4,1,3)
plot (w, abs(X_w))
title (['Magnitude of X(\omega) with M = ' num2str(M)])





subplot (4,1,4)
plot (w,angle(X_w));
title (['Phase of X(\omega) with M = ' num2str(M)])

saveas(gcf,['M of',num2str(M), '.jpg'])

figure
for M = 2:5
    
    subplot (4,1, M-1)
    X_w = (amp*sin((M+0.5).*w))./sin(w./2);
    plot (w,X_w)
    title (['X(\omega) with M = ' num2str(M)])
    saveas(gcf,['all M.jpg'])
end 



 