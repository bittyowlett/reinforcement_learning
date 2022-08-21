clear;

% INPUTS:

variance = 1;

epsilon = 0.1;

c = 0;

Q0 = 5;

% number of bandit problems averaged

nbandit = 2000;

% number of times steps for 1 bandit algorithm

timesteps = 2000;

% number of arms in a bandit problem

narms = 20;

% randomly assigned qstar values for one bandit problem

qstar = zeros(1, narms);

% Running average of Rewards while running multiple single bandit problems
R_avg_multiple_bandit = zeros(timesteps, timesteps);

percentage_optimal_action = zeros(timesteps, timesteps);

M = 1;

while M<=nbandit
    
    for i = 1:narms
        qstar(1,i) = box_mueller_normal_m0;
    end
    clearvars i;
    
    [Maxim, optimal_action_index] = max(qstar) ;
   
    single_bandit;
    
    if M==1
        R_avg_multiple_bandit(:,M) = R_avg_one_bandit;
        percentage_optimal_action(:,M) = percentage_optimal_action_one_bandit;
    else 
        R_avg_multiple_bandit(:,M) = R_avg_multiple_bandit(:,M-1) + (1/M).*(R_avg_one_bandit - R_avg_multiple_bandit(:,M-1));
        percentage_optimal_action(:,M) = percentage_optimal_action(:,M-1) + (1/M).*(percentage_optimal_action_one_bandit - percentage_optimal_action(:,M-1));
    end 
    
    M = M+1;
end

time = linspace(1, timesteps, timesteps);

%total_average
%total_reward_average = mean(R_avg_multiple_bandit,2);

subplot(2,1,1);
hold on
plot(time, R_avg_multiple_bandit(:,nbandit)', 'Linewidth', 1);
xlabel('timesteps');
ylabel('average reward');
subplot(2,1,2);
hold on
plot(time, percentage_optimal_action(:,nbandit)', 'Linewidth', 1);
xlabel('timesteps');
ylabel('% optimal action');