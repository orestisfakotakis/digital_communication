function [noised_sig] = pam_mod(in_sign, M, SNR, n_bits)

% Multiply symbol sequence with rectangular pulse
Tsym = 4*10e-6;
g = sqrt(2/Tsym);
pam_sig = in_sign * g;

% Carrier frequency
fc = 2.5*10e6;

% Sample rate
Tsample = 0.1*10e-6;

% Define time period
t = 0:(1/(2*pi*(1/Tsample))):(1/(2*pi*(1/Tsample))) * (n_bits -1);

% Modulate symbol sequence with carrier frequency
pam_sig = pam_sig .* cos(2*pi*fc*t);

% Infect modulated signal with AWGN
noised_sig = awgn(pam_sig, SNR, 'measured');

end
