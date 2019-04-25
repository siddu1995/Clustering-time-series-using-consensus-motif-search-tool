% consensus motif example for a sequence of 10 time series
% Commented out sections were used to generate the file random_walk.txts


%rng('default');
k = 10;
baselen = 2^12;
%L = [2^12; 2^10; 2^10; 2^11 + 1; 2^12 + 76; 2^11 + 130; 2^11 + 60; 2^11 + 80; 2^10 + 100; 2^11 + 100];
%L = [2^10-24;2^10-24;2^10-24;2^10-24;2^10-24;2^10-24;2^10-24;2^10-24;2^10-24;2^10-24];
L = [2^12+904;2^12+904;2^12+904;2^12+904;2^12+904;2^12+904;2^12+904;2^12+904;2^12+904;2^12+904];
%L = [2^11+131;2^11+131;2^11+131;2^11+131;2^11+131;];%2^11+51;2^11+51;2^11+51;2^11+51;2^11+51;];

subsequence_len = 256;
%T = zeros(sum(L) + k - 1,1);
%T(1:L(1)) = cumsum(randn(L(1), 1));
%j = L(1) + 1;
%for i = 2 : k
%    T(j) = NaN;
%    T(j + 1 : j + L(i)) = cumsum(randn(L(i), 1));
%    j = j + 1 + L(i);
%end

T = load('sin1.txt');
%T = load('computer_classification.txt');
%T = load('random_walk.txt');

figure();
ax = axes();
j = 1;
hold on;
for i = 1 : 10
    plot(zscore(T(j : j + L(i) - 1),1) + 5*i);
    j = j + 1 + L(i);
end
hold off;
title(sprintf('k = 5 time series',k));
ax.YTick = [];
drawnow;
[sol,obj] = consensus_search.from_nan_cat(T,subsequence_len,true);
title(sprintf('corresponding consensus motif for subsequence length: %d radius %g',subsequence_len,sol.radius));
drawnow;
% optional to test against brute force version. Beware this can take a long time
%[sol_0] = obj.solve_brute_force(true);
