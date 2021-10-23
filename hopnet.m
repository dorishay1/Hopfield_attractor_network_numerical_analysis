function [final_state,energy, t] = hopnet(N,J,s0)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
current_s = s0;
flag = 0;

% while convergence(s0,P) == 0
t = 1;
while flag==0
    previous_state = current_s;
    for i = 1:N
        %% energy
        energy(t) = (-1/2) * current_s * J * current_s';
        t = t+1;
        
        %% activate function
        h = J(i,:)*current_s';
        s_update = sign(h);
        %% handle 0 case
        if s_update == 0
            prob = rand(1);
            if prob>0.5
                s_update = 1;
            else
                s_update = -1;
            end
        end
        
        %% update state
        current_s(i) = s_update;
        
        
    end
    %% check for convergence
    %get out of loop only if nothing has changed.
    if sum(previous_state == current_s)== length(s0)
        flag = 1;
    end
end

final_state = current_s;

end




