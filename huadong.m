% Program1_滑动平均去噪
M = 9;
N = 100; k = 0:N;
rx = randn(1,N+1);% 产生一行N列均值为0方差为1的Gauss分布随机数
s = 10*sin(0.02*pi*k);
x = s+rx;
b = ones(M,1)/M;a=1;
y = filter(b,a,x);
subplot(1,2,1);plot(k,x);
xlabel('k');ylabel('x[k]');
subplot(1,2,2);plot(k,y,k,s,':');
xlabel('k');ylabel('幅度');
legend('y[k]','s[k]');