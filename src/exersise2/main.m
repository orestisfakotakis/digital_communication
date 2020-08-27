% SCRIPT FOR THE EXERCISE 2
%we print the results with long format
format long;
% we read the input signal
%A=wavread('speech');
[A,fs,N]=wavread('speech.wav');
% the numper of the samples of the input signal
length_x = length(A);
% the data that we print on the axis x when we design the
% desired signal
axis_x=[1:1:length_x];
% a plot of input signal
plot( axis_x, A, '.');
title('input signal');


%LLOYD_MAX
% initialization of the vector that keeps the SQNRs of after the
% quantization with Lloyd_Max
SQNR_Lloyd=zeros(3,1);
% titles that we will give to our plots
title_of_plot=['SQNR N=2';'SQNR N=4';'SQNR N=8'];
% initialization of the quantized signals
xq=zeros( length_x, 3);
% the i is actually the N of the exercise, the bits that we use for the
% quantization of the signal
c=1;
for i = 2: 2:6 
    if i==6
        i=8;
    end
    
[xq( :, c ), C, D] = Lloyd_Max(A, i,-1, 1);
kmax = length(D);
loops = (1:1:kmax);
% initialization of a vector that will keep all the SQNRs from the
% iterations
Sqnr = zeros(kmax,1);
% calculate the SQNRs from the iterations
for j = 1: 1: kmax
Sqnr(j,1)=sqnr(A,D(j,1));
end
% make a figure in a new window
figure;
% make a plot of each of the collection of SQNRs for N=[2:2:6]

plot(loops,Sqnr,'.-')
title( title_of_plot(c,:) );
xlabel('loops');
ylabel('SQNR');
% last SQNR value
SQNR_Lloyd(c,1) = Sqnr(kmax,1);
% play the quantized signal
wavplay(A,fs);
disp(i)
disp(c)
c=c+1;

end

% titles that we will give to our plots
title_of_plot=['Lloyd Max N=2';'Lloyd Max N=4';'Lloyd Max N=8'];

for i = 1: 1: 3
% make a figure in a new window
figure;
% a plot for each quantized signal
plot( axis_x, xq( :, i ), '.');
title( title_of_plot(i,:) );
end
% print the three different SQNRs for the corresponding different quantized
% signal
SQNR_Lloyd