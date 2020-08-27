function exodos = Dektis(input,mode)
M=log2(mode)
Es = 1;
fc = 1/4;
Tsample = 1;
Tsymbol = 40;
T = Tsymbol/Tsample;
gt = sqrt(2*Es/Tsymbol);
L = length(input)/T;
output = zeros(2,L);
symbolSamples = reshape(input, T, L);
 symbols(:,1) = sqrt(Es)*(cos(2*pi/4*(0:(M-1))))';
 symbols(:,2) = sqrt(Es)*(sin(2*pi/4*(0:(M-1))))';
 dd(1:T,:) = diag(gt * cos(2*pi*fc*(0:T-1)));
 dd(T+1:2*T,:) = diag(gt * sin(2*pi*fc*(0:T-1)));
 received = zeros(L,2);
 for i = 1 : 2
 a = T*(i-1) + 1;
 b = T * i;
 received(:,i) = sum(dd(a:b,:) * symbolSamples);
 end
 decSymbols = zeros(L,2);
 for i = 1 : L
 A = repmat(received(i,:),M,1) - symbols;
 [x,indx] = min(max(abs(A),[],2));
 decSymbols(i,:) = symbols(indx,:);
 end
end
g(k,:) = sum(gt * cos(a'*(0:T-1)) * resinput(:,k),2);
end
decSymbols = zeros(L,2);
for i = 1:L
 [x,indx] = max(g(i,:));
 decSymbols(i,:) = symbols(indx,:);
end

9
 % Demapper
 exodos=gray2bin(decSymbols,'psk',M)
 output = reshape(output, 2*L,1); 