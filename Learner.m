classdef Learner < handle
    %LEARNER Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        a               % Learning rate
        y               % expected future reward discount factor
        b               % is 1.5 for states 1-3 and 1 for state 4
        wMp             % weight for reward of overshoot
        wSse            % weight for reward of sse
        wt              % weight for reward for settiling time
    end
    
    methods
        function obj = Learner(par)
            
           % obj.parent = par;
            obj.a = 0.9;
            obj.y = 0.9;
            obj.b = -1.5;
            obj.wMp = 1;
            obj.wSse = 1;
            obj.wt = 0.1;          
            
            
        end
        
        function reward = calculateReward(obj, state, sseNew, MpNew, stNew)
            
           
            if (state == 4)
                % Kann auch 0 sein (nicht ganz ersichtlich)
                reward = -1*(obj.wMp*MpNew + obj.wSse*sseNew+obj.wt*stNew);
                return;
            end    
                   
            reward = obj.b*(obj.wMp*MpNew + obj.wSse*sseNew+obj.wt*stNew);
                       
        end
        
        function qValueNew = calculateQValue(obj, reward, Q, state, action)
            
            currentQ = Q(state, action);
            % Does not use the future state here! Does work better than
            % with the new state tho (getGammeMax(stateNew, Q)
            qValueNew = 0.1*currentQ + reward + obj.y*obj.getGammaMax(state, Q);
            
        end    
        
        function gammaMax = getGammaMax(obj, state, Q)
            
            % Muss hier der neue QValue mit einberechnet werden?
           gammaMax = max(Q(state,:));
            
        end    
        
        
    end
end

