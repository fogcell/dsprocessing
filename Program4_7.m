% Program 4_3 脉冲响应不变法设计CB I 型 LP DF
%DF BW LP 指标
Wp =0.2*pi; Ws =0.4*pi; Ap = 1; As = 15;
Fs =1; %抽样频率(Hz)
%确定模拟BW指标
wp =Wp*Fs; ws=Ws*Fs;
%确定AF阶数
N =cheb1ord(wp,ws,Ap,As,'s');
%由通带指标确定的3db截频
wc =wp/(10^(0.1*Ap)-1)^(1/2/N);
%Determine BW AF
[numa,dena] =cheby1(N,Ap,wc,'s');
%Determine DF
[numd,dend] =impinvar(numa,dena,Fs);
w= linspace(0,pi,512);
h =freqz(numd,dend,w);
%Amplitude normalization DF amplitude corresponding
norm =max(abs(h));
numd = numd/norm;
plot(w/pi,20*log10(abs(h)/norm))
% calculation Ap and As
w =[Wp Ws];
h =freqz(numd,dend,w);
fprintf('Ap =%.4f\n',-20*log10(abs(h(1))));
fprintf('As =%.4f\n',-20*log10(abs(h(2))));
    