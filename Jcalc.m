function [J] = Jcalc(P)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

[num_ex,ex_length] = size(P);

J = zeros(length(P));
for i = 1:ex_length
    for j = 1:ex_length
        %zeros for then main diagonal
        if i == j
            J(i,j) = 0;
        else
            for mu = 1:num_ex
              J(i,j) = J(i,j) + P(mu,i)*P(mu,j);
            end
        end
    end
end

J = (1/ex_length)*J;

end

