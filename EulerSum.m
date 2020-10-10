function [Se,e] = EulerSum(N)
Se = 0;
for n=1:N
    Se = Se + 1/n;
end
Se = Se - log(N);
e = abs(Se - 0.577215664901532);