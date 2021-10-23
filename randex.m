function [P] = randex(N, n_examples)
%creating matrix P

P = randn(n_examples, N);

%run again if a zero is choosen
while sum(sum(P==0))>0
P = randn(n_examples, N);
end

P = sign(P);

end

