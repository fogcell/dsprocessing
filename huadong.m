% Program1_����ƽ��ȥ��
M = 9;
N = 100; k = 0:N;
rx = randn(1,N+1);% ����һ��N�о�ֵΪ0����Ϊ1��Gauss�ֲ������
s = 10*sin(0.02*pi*k);
x = s+rx;
b = ones(M,1)/M;a=1;
y = filter(b,a,x);
subplot(1,2,1);plot(k,x);
xlabel('k');ylabel('x[k]');
subplot(1,2,2);plot(k,y,k,s,':');
xlabel('k');ylabel('����');
legend('y[k]','s[k]');