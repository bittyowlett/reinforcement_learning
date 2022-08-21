% BOX MUELLER Method for generating N(0,1) random variable

function Y = box_mueller_normal_mu_sigma(mu, sigma)
    X= box_mueller_normal_m0;    
    Y = mu + sigma*X; 
end