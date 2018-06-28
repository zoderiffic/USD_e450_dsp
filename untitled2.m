%  \   [q_out, Delta,SQNR]=uniquan(sig_in,L)
%   L  -  number of uniform quantization levels
%   sig_in  -  input signal vector
%   Function ouputs:
%            q_out - quantized output
%            Delta - quantization interval
%            SQNR  - actual signal to quantization noise ratio
% sig_pmax=max(sig_in);% finding the positive peak;
% sig_nmax=min(sig_in);% finding the negative peak
t = 0:1/1000:1;
L=6
sig_in = sin(t*2*pi*10);
sig_pmax=2;
sig_nmax=-2;
Delta=(sig_pmax-sig_nmax)/L; % difference represented by 1 quantization level
q_level=sig_nmax+Delta/2:Delta:sig_pmax-Delta/2;
    % q_level defines set of values that each quantization level represents

%L_sig=length(sig_in); % find signal length
sigp=(sig_in-sig_nmax)/Delta+1/2;% convert into 1/2 to L+1/2 range
qindex=round(sigp); % round to 1,2,... L levels
qindex=min(qindex,L); % eleminate L+1 as a possibility
q_out=q_level(qindex);% use q_index to translate level into value
q=sig_in-q_out; %q is noise, diff between signal and quantized
N0=norm(q); %power of noise
%norm is a builtin that gives us avg of square
S0=norm(sig_in); %power of signal
SQNR=S0/N0; %Signal to Quantization Noise ratio
SQNRdB=20*log10(SQNR);%  SQNR in dB


% see p. 364 of Lathi