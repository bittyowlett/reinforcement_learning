% CHOOSE an Action a


function Y = choose_action(Qt, N, epsilon, narms, index, c, indicator_a, qstar)

dummy = rand;

if N==1
    if dummy > epsilon
        I=randi(narms);
        Y=I;      
    else 
        [~, I] = max(qstar);
        Y=I;      
    end
else 
    
    if dummy > epsilon
        I=randi(narms);
        Y=I;
    else 
    [~, I] = max((Qt(N-1,:) + c.*(log(N)./(indicator_a(N-1, index)))^0.5));
        Y=I;       
    end
end

