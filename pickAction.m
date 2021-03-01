function [action] = pickAction(Q, state)


            row = Q(state,:);
           
            % Find maxima
            idx = find( row == max(row) );
            
            % Calculate random index
            randomIndex = randi(length(idx), 1);
            
            % Choose action
            action = idx(randomIndex); 
                
            end    
                       
            


