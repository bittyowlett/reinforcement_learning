

% SINGLE Multi armed bandit problem

Rt = zeros(timesteps, 1);

indicator_a = zeros(timesteps, narms);

Qt = zeros(timesteps, narms);

R_avg_one_bandit = zeros(timesteps, 1);

index = zeros(timesteps,1);

percentage_optimal_action_one_bandit=zeros(timesteps,1);

% ITERATION BEGINS:

% N is the counter for evolving time

N = 1; 

while N<=timesteps

% choose action with epsilon greedy policy: args: Qt, N, epsilon, narms and
% return the chosen arm index 

if N==1
    index(N,1) = choose_action(Qt, N, epsilon, narms, 0, c, indicator_a, qstar);
else
    index(N,1) = choose_action(Qt, N, epsilon, narms, index(N-1,1), c, indicator_a, qstar);   % (Qt, N, epsilon, narms)
end

% When action a is selected : indicator function updates occurence of a 
indicator_a(N,:) = update_indicator(N, indicator_a, index(N,1)); 

% Assign reward as per weighted normal distribution
Rt(N, 1) = assign_reward(qstar, index(N,1), variance);

if N==1
    R_avg_one_bandit(N,1)= R_avg_one_bandit(1,:) + (1/N).*(Rt(N,1) - R_avg_one_bandit(1,:));
    Qt(N,:) = Q0;
    Qt(N,index(N,1)) = Rt(N,1);
    percentage_optimal_action_one_bandit(N,1) = indicator_a(N, optimal_action_index)*100;
else
    R_avg_one_bandit(N,1)= R_avg_one_bandit(N-1,:) + (1/N).*(Rt(N,1) - R_avg_one_bandit(N-1,:));
    Qt(N,:) = Qt(N-1,:);
    Qt(N,index(N,1)) = Qt(N-1, index(N,1)) + (1/(indicator_a(N,index(N,1)))).*(Rt(N,1) - Qt(N-1, index(N,1))) ;
    percentage_optimal_action_one_bandit(N,1) = percentage_optimal_action_one_bandit(N-1,1) + (1/N).* (indicator_a(N, optimal_action_index)*(100/N) - percentage_optimal_action_one_bandit(N-1,1)) ; 
end

N=N+1;

end

%percentage_optimal_action_one_bandit(N,1) = percentage_optimal_action_one_bandit(N-1,1) + (1/(indicator_a(N,optimal_action_index))).* (indicator_a(N, optimal_action_index) - percentage_optimal_action_one_bandit(N-1,1)) ; 





