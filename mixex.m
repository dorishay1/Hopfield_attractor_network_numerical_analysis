function [new_example] = mixex(choosen_ex,q)

%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
prob = rand([1,length(choosen_ex)]);

for i = 1:length(choosen_ex)
    if prob(i)<q
        new_example(i)=choosen_ex(i)*(-1);
    else
        new_example(i) = choosen_ex(i);
    end
end


end

