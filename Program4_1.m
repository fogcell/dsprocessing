% Program 4_1 设计滤波器
% 滤波器参数指标
wp =10; ws=2;Ap=1;As=40;
%设计Chebyshev I型低通滤波器
[N,wc] =cheb1ord(wp,ws,Ap,As,'s')
[num,den] =butter(N,wc,'s')
omega1 =linspace(0,wp,500);
omega2 =linspace(wp,ws,200);
omega3 =linspace(ws,5*1000*pi*2,500);
H1 = 20*log10(abs(freqs(num,den,omega1)));
H2 = 20*log10(abs(freqs(num,den,omega2)));
H3 = 20*log10(abs(freqs(num,den,omega3)));
fprintf('Ap = %.4f\n',max(-H1));
fprintf('As = %.4f\n',min(-H3));
plot([ omega1 omega2 omega3]/(2*pi),[H1 H2 H3])