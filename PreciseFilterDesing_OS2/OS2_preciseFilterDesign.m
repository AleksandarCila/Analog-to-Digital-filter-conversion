%% precise filter design
close all;
clear;
clc
D=25;%red imenioca
N=20;%red brojioca
M=200; %broj ulaznih i izlaznih signala M>>D+N+1
fs=2500;

%analogni filtar
%koristi se funkcija za prototip

[z,p,k]=ellipap(4,1,50);
[b,a]=zp2tf(z,p,k);
%iz prototipa u neki drugi filtar,granica je w[rad/s]
[b,a]=lp2lp(b,a,400);
%racunamo u M tacaka
%fs>w(M)/(2*pi) inace dolazi do replika
[h,w]=freqs(b,a,M);
%skup frekvencija
frequency=w/(2*pi);
figure,freqs(b,a,M),title('Analog filter');
%sve amplitude naseg filtra,u M tacaka,i faze
amplitude=abs(h);
phase=angle(h);
%input signal
ts=1/fs;
%formiranje matrice X koja sadrzi prosle odbirke izlaznog signala i odbirke
%ulaznog,uzimamo odbirke na periodu 1/fs
for i=1:M
        %za svaku frekvenciju racunamo sve odbirke
        w_ts=2*pi*frequency(i)*ts;  
        %D odbiraka izlaznog signala skaliranih sa fazom i amplitudom
        for kolona=1:D 
            k=kolona;
            y(kolona)=-(amplitude(i)*cos((-k*w_ts)+phase(i)));
        end;
        %N+1 odbirak ulaznog signala
        for kolona=1:(N+1)   
            k=kolona-1;
	        u(kolona)=cos(-k*w_ts);    
        end;
        x(i,:)=[ y u ];   % [M*(D+N+1)]
    
   
end;
%formiranje matrice Y koja sadrzi M trenutnih vrednosti izlaza,zavisi samo
%od amplited i faze filtra
y=amplitude.*cos(phase);  % [M * 1]
%racunanje koeficijenata pseudoinverznom matricom,trazi se najbolje resenje
%koje odgovara svim jednacinama
coefs=x\y;
%rasporedjuju se koeficijenti iz matrice koeficijenata 
b_found=coefs((D+1):(D+1+N));    % [(N+1) x 1]
if (D~=0)
    a_found=[1;coefs(1:D)];  % [(D+1) x 1]
else
    a_found=[ 1 ];
end
%formiranje frekvencijskog odzviva na osnovu koeficijenata koje smo
%izracunali
h_found=freqz(b_found,a_found,frequency,fs);
h_found_abs=abs(h_found);
h_found_abs=h_found_abs/max(h_found_abs);
%frekvencijski odziv aproksimiranog filtra
figure,freqz(b_found,a_found,frequency,fs),title('FDLS');
%racunanje faze aproksimiranog filtra
phase_found=angle(h_found);
for i=1:M
    while(phase_found(i) < -pi)
		phase_found(i)=phase_found(i)+2*pi;
    end;
    while(phase_found(i) > pi)
		phase_found(i)=phase_found(i)-2*pi;
    end;
end;
phase_found=phase_found*180/pi;
phase=phase*180/pi;
%uporedjivanje frekvencijskog odziva analognog filtra i aproksimiranog
%filtra
figure,plot((h_found_abs),'r');
hold on
plot(abs(h),'k'),legend('FDLS','analog'),title('Frequency response');
hold off;
%crtanje na logaritamskoj osi amplitudske karakteristike oba filtra
figure;
semilogx(frequency,20*log10(abs(h_found)),'r');
hold on;
semilogx(frequency,20*log10(amplitude),'k'),legend('FDLS','analog'),ylabel('magnitude[dB]'),xlabel('f[Hz]'),title('Magnitude');
grid;
hold off;
%crtanje na logaritamskoj osi fazne karakteristike oba filtra
figure;
semilogx(frequency,phase_found,'r');
hold on;
semilogx(frequency,phase,'k'),legend('FDLS','analog'),ylabel('phase[degrees]'),xlabel('f[Hz]'),title('Phase');
grid;
hold off;

[bd,ad]=bilinear(b,a,fs);
h_bil=freqz(bd,ad,frequency,fs);
figure;
semilogx(frequency,20*log10(abs(h_bil)),'r');
hold on;
semilogx(frequency,20*log10(amplitude),'k'),legend('bilinear transformation','analog'),ylabel('magnitude[dB]'),xlabel('f[Hz]'),title('Magnitude');
grid;
hold off;
