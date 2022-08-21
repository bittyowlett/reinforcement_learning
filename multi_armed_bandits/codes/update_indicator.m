% Indicator function

function Y = update_indicator(N, indicator_a,  index)

if N==1
    indicator_a(N,:)=0;
else
    indicator_a(N,:)= indicator_a(N-1,:);
end

indicator_a(N, index)= indicator_a(N, index) + 1;

Y = indicator_a(N,:);

end
