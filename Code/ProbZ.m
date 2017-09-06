%Computing the satisfying success by generation i at least once in R runs

%Compute P(M,i)
h_prob = h_freq / sum(h_freq);
Accumlated_gen = cumsum(h_prob);

%for #runs = 100
%Calculate Z
R=100;
Z = 1 - (1 - Accumlated_gen).^R;

%Plot the Results
plot([0 h_points(1) h_points],[0 0 Z]);