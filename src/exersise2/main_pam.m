clear all; close all; clc;

% Main PAM modulation file
i = 1;
k = 1;
for M=4:4:8
	for SNR=0:2:20
		% Number of bits
		n_bits = 25;
		% Generate binary sequence
		% Input bit stream - 4 possible ways
		x = randi([0, 1], 1, n_bits);
		% x = randsrc(1, n_bits);
		% x = rand(1, n_bits);
		
		% For rand() function, this step important
		% x = round(x);
		% Or this
		% x = rand(1, n_bits)> 0.5;
		
		% For randsrc() function, this step important
		% x = randsrc(1, n_bits / bit2sym, symbols);
		
		% Mapper
		mapped_seq = mapper(in_signal, n_bits, M);
		
		% PAM modulation
		pam_sig = pam_mod(in_sign, M, SNR, n_bits);
		
		
		% PAM demodulation
		r_out = pam_demod(r, M);
		
		% Demapper
		demapped_seq = demapper(in_sign, M);
		
		% Evaluate BER
		ber(i, k) = sum(x ~= demapped_seq) / n_bits;
		
		% Evaluate SER
		ser(i, k) = sum(mapped_seq ~= r_out) / n_bits;
		
		k = k + 1;
		end
	i = i + 1;
end