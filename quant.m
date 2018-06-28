function [sig_out,SQNRdb] = quant(sig_in,L,type)
%Quant Quantize a signal based on the function
%   sig_in signal to quantize
%   L levels of quantization
%   type 1 for floor, 2 for round, 3 for ceiling

sig_max     = max(sig_in);
sig_min     = min(sig_in);
range       = max(sig_in)-min(sig_in);
del         = range/L ; %Step size

%Creating Bins for the values to go in and the 
if type == 1 %Floor
    q_bins      = sig_min :  del  :sig_max-del; %Creating Bins for the values to go in and the 
    bin_location = min(L,floor((sig_in-sig_min)/del+1));%Determine the bin what the signal will go into

elseif type == 2
    q_bins      = sig_min+del*1/2 :  del  :sig_max-del*1/2; %Creating Bins for the values to go in and the 
    bin_location = min(L,round((sig_in-sig_min)/del+1));%Determine the bin what the signal will go into

elseif 3
    q_bins      = sig_min+del :  del  :sig_max; %Creating Bins for the values to go in and the 
    bin_location = min(L,ceil((sig_in-sig_min)/del+.1));%Determine the bin what the signal will go into

end

sig_out       = q_bins(bin_location);  %Assign the signal a value from the q_bins based on the bin_location
S0           = norm(sig_in);
N0           = norm(sig_in-sig_out);
SQNR         = S0/N0;
SQNRdb      =20*log10(SQNR);
end

