% Program 4_3 ������Ӧ���䷨���CB I �� LP DF
%DF BW LP ָ��
Wp =0.2*pi; Ws =0.4*pi; Ap = 1; As = 15;
Fs =1; %����Ƶ��(Hz)
%ȷ��ģ��BWָ��
wp =Wp*Fs; ws=Ws*Fs;
%ȷ��AF����
N =cheb1ord(wp,ws,Ap,As,'s');
%��ͨ��ָ��ȷ����3db��Ƶ
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
    