g =[1 -3 4 2 0 -2];
h =[3 0 1 -1 2 1];
g1 =fft(g);
h1 =fft(h);
y =ifft(g1.*h1)