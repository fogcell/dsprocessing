% Program 5_2 窗函数法设计FIR高通
Wp =0.6*pi;Ws =0.4*pi;Ap =1; As=45;
%确定滤波器阶数
N =ceil(7*pi/(Wp-Ws));
N =mod(N+1,2)+N;
M =N-1;
w =hamming(N)';
%理想低通截频
Wc = (Wp+Ws)/2;
k =0:M;
hd =-(Wc/pi)*sinc(Wc*(k-0.5*M)/pi);
hd(0.5*M+1)=hd(0.5*M+1)+1;
h =hd.*w;
omega = linspace(0,pi,512);
mag =freqz(h,[1],omega);
plot(omega/pi,20*log10(abs(mag)))