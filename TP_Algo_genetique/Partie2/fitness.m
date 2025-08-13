function [F] = fitness(P,D)
[p,N] = size(P);
F(1:p) = 0.0;
for i = 1:p
    for j = 1:N-1
        F(i) = F(i) + D(P(i,j),P(i,j+1));
    end
end