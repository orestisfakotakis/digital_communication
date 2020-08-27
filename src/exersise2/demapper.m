function [demap_seq] = demapper(in_sign, M)

sym_seq = log2(M);

out_len = length(in_sign) * sym_seq;

demap_seq = zeros(1, out_len);

% Generate symbols
sym = 2*(1:M) - 1 - M;
idx = 1;
if M == 4
	for i=1:length(in_sign)
		if i == length(in_sign)
			break
		else
			if in_sign(i) == -3
				demap_seq(idx) = 0;
				demap_seq(idx+1) = 0;
				
			elseif in_sign(i) == -1
				demap_seq(idx) = 0;
				demap_seq(idx+1) = 1;
				
			elseif in_sign(i) == 1
				demap_seq(idx) = 1;
				demap_seq(idx+1) = 1;
				
			elseif in_sign(i) == 3
				demap_seq(idx) = 1;
				demap_seq(idx+1) = 0;
            end
            idx = idx + 2;
		end
	end

else
	for i=1:length(in_sign)
		if i == length(in_sign)
			break
		else
			if in_sign(i) == -7
				demap_seq(idx) = 0;
				demap_seq(idx+1) = 0;
				demap_seq(idx+2) = 0;
				
			elseif in_sign(i) == -5
				demap_seq(idx) = 0;
				demap_seq(idx+1) = 0;
				demap_seq(idx+2) = 1;
				
			elseif in_sign(i) == -3
				demap_seq(idx) = 0;
				demap_seq(idx+1) = 1;
				demap_seq(idx+2) = 1;
				
			elseif in_sign(i) == -1
				demap_seq(idx) = 0;
				demap_seq(idx+1) = 1;
				demap_seq(idx+2) = 0;
			
			elseif in_sign(i) == 1
				demap_seq(idx) = 1;
				demap_seq(idx+1) = 1;
				demap_seq(idx+2) = 0;
				
			elseif in_sign(i) == 3
				demap_seq(idx) = 1;
				demap_seq(idx+1) = 1;
				demap_seq(idx+2) = 1;
				
			elseif in_sign(i) == 5
				demap_seq(idx) = 1;
				demap_seq(idx+1) = 0;
				demap_seq(idx+2) = 1;
				
			elseif in_sign(i) == 7
				demap_seq(idx) = 1;
				demap_seq(idx+1) = 0;
				demap_seq(idx+2) = 0;
            end
            idx = idx + 3;
		end
    end
end
end