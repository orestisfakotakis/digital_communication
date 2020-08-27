clear variables; close all; clc;

%% Prerequisites

% Input bit stream - 4 possible ways
n_bits = 26;
x = randi([0, 1], 1, n_bits);
% x = randsrc(1, n_bits);
% x = rand(1, n_bits);

% For rand() function, this step important
% x = round(x);
% Or this
% x = rand(1, n_bits)> 0.5;

% Symbols
% symbols = [-3 -1 1 3];

% For randsrc() function, this step important
% x = randsrc(1, n_bits / bit2sym, symbols);

% PAM order
M = 4;

% Symbol sequence
bit2sym = log2(M);

% Upscale input binary sequence
% x = upsample(x, 4);

% Symbolize input bit stream where necessary.
mapped_x = zeros(1, length(x)/2);
idx = 1;
for i=1:bit2sym:n_bits
    if i == n_bits
        break
    else
        if x(i) == 0
            if x(i+1) == 0
                mapped_x(idx) = -3;
            elseif x(i+1) == 1
                mapped_x(idx) = -1;
            end
        elseif x(i) == 1
            if x(i+1) == 1
                mapped_x(idx) = 1;
            elseif x(i+1) == 0
                mapped_x(idx) = 3;
            end
        end
        idx = idx + 1;
    end
end

% Symbol period
T_symbol = 4*10e-6;

% Carrier frequency
fc = 2.5 * 10e6;

% Carrier period
Tc = 0.4 * 10e-6;

% Sampling period
T_sample = 0.1*10e-6;

% Rectangular pulse
gt = sqrt(2 / T_symbol);

% AWGN; Normalized
noise = randn(1, length(x))./ 100;

% Alternative AWGN
% r = awgn(pam_mod, SNR, 'measured');