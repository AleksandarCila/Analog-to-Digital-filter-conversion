function [b_found,a_found]=FDLS(h,w,D,N,M,fs)
%h frequency respons of analog filter in M points
%w frequency vector of M points
%D denominator order
%N numerator order
%M number of input and output signals
%fs sampling frequency


%skup frekvencija
frequency=w/(2*pi);
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
end;
end