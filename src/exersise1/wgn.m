function 8oribos = WGN(n,SNR)
Tsymbol = 40;
Tsample = 1;
T = Tsymbol/Tsample;
Eb = 1/2;
Nok = Eb/(10^(SNR/10));
8oribos = sqrt(Nok/2) * randn(T*(n/2),1);
