% Assign Reward

function Y = assign_reward(qstar, index, variance)

mu = qstar(1, index);

Y = box_mueller_normal_mu_sigma(mu, variance) ; 

end
