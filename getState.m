function [state] = getState(sse,overshoot)
% 0.37 und 16.9

lsse = 0.001;
lmp = 0.05;

if (sse > lsse && overshoot > lmp)
    state = 1;    
end

if (sse > lsse && overshoot <= lmp)
    state = 2;
    
end

if (sse <= lsse && overshoot > lmp)
    state = 3;
    
end

if (sse <= lsse && overshoot <= lmp)
    state = 4;
    
end



end

