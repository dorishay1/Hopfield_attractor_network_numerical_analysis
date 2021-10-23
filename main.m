clear; close all; clc;

%% Net install
N = 200;                        %net size and memory length
n_examples = 3;                 %number of examples to memory

P = randex(N, n_examples);      %creating random examples
J = Jcalc(P);                   %calculating matrix J

%% settings
n_rep = 50;                                         %number of repeats
q = [0,.1,.2,.3,.35,.36,.37,.38,.39,.4,.45,.5];     %q vector

%random example number
ex_num = randi([1,n_examples]);
choosen_ex = P(ex_num,:);

%creating memory for loop
overlap = zeros(n_rep,n_examples);
overlap_q = zeros(length(q),n_examples);

%% main loop
for r = 1:length(q)
    current_q = q(r);
    for iter = 1:n_rep
        %% choose example and modify according to q
        s0 = mixex(choosen_ex,current_q);
        
        %% run hopfield
        [hop_output,energy,t] = hopnet(N,J,s0);
        
        %% overlap calc
        for n = 1:n_examples
            cov_mat = cov(hop_output',P(n,:));
            overlap(iter,n) = cov_mat(1,2);
        end
        
    end
    %% mean overlap per q
    overlap_q(r,:) = mean(overlap);
end

%% Plots

% q as function of overlap
figure
plot(q, overlap_q,'linewidth', 1.5)

title('overlap as function of q')
xlabel('q size')
ylabel('overlap')

lgd = legend('1','2','3');
title(lgd,['choosen example #', num2str(ex_num)])

%energy as function of steps
figure
plot(1:(t-1),energy)

title('energy as function of steps')
xlabel('time steps')
ylabel('energy')
