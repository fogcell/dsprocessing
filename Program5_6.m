%Program5_6
M =44;Wp =0.3*pi;
m =0:M/2;
Wm =2*pi*m./(M+1);
mtr =ceil(Wp*(M+1)/(2*pi));
Ad =double([Wm>=Wp]);Ad(mtr) =0.28;
Hd =Ad.*exp(-j*0.5*M*Wm);
Hd =[Hd conj(fliplr(Hd(2:M/2+1)))];
h =real(ifft(Hd));
w =linspace(0,pi,1000);
H =freqz(h,[1],w);
plot(w/pi,20*log10(abs(H)));grid;
xlabel('Normalized frequency');
ylabel('Gain in dB');