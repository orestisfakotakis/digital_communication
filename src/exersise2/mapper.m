function [mapped_seq] = mapper(in_signal, n_bits, M)

% Generate symbols
sym = 2*(1:M) - 1 - M;

sym_seq = log2(M);

mapped_seq = zeros(1, round(length(in_signal)/sym_seq));

if M == 4
	idx = 1;
	for i=1:sym_seq:n_bits
		if i == n_bits
			break
		else
			if in_signal(i) == 0
				if in_signal(i+1) == 0
					mapped_seq(idx) = sym(1);
				elseif in_signal(i+1) == 1
					mapped_seq(idx) = sym(2);
				end
			elseif in_signal(i) == 1
				if in_signal(i+1) == 1
					mapped_seq(idx) = sym(3);
				elseif in_signal(i+1) == 0
					mapped_seq(idx) = sym(4);
				end
			end
			idx = idx + 1;
		end
	end

else
	idx = 1;
	for i=1:sym_seq:n_bits
		if i == n_bits
			break
        else
            if in_signal(i) == 0
                if in_signal(i+1) == 0
                    if in_signal(i+2) == 0
                        mapped_seq(idx) = sym(1);
                    elseif in_signal(i+2) == 1
                        mapped_seq(idx) = sym(2);
                    end
                elseif in_signal(i+1) == 1
                    if in_signal(i+2) == 1
                        mapped_seq(idx) = sym(3);
                    elseif in_signal(i+2) == 0
                        mapped_seq(idx) = sym(4);
                    end
                end
            elseif in_signal(i) == 1
                if in_signal(i+1) == 1
                    if in_signal(i+2) == 0
                    	mapped_seq(idx) = sym(5);
                    elseif in_signal(i+2) == 1
                        mapped_seq(idx) = sym(6);
                    end
                elseif in_signal(i+1) == 0
                    if in_signal(i+2) == 1
                    	mapped_seq(idx) = sym(7);
                    elseif in_signal(i+2) == 0
                    	mapped_seq(idx) = sym(8);
                    end
                end
            end
        end
    end
end
end