k =0:1:5;
x =cos(pi*k./2);
y =3.^k;
X =fft(x);
Y =fft(y);
y1 =ifft(X.*Y)