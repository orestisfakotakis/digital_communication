function [demod_sym] = pam_demod(input_sym, fc)

demod_sym = conv(input_sym, fc);
