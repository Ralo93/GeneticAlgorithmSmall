classdef Environment < handle
    %ENVIRONMENT Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        Q = [4,7];
        currentBest
    end
    
    methods
        function obj = Environment(par)
            %ENVIRONMENT Construct an instance of this class
            %   Detailed explanation goes here
            obj.Q = zeros(4,7);
            % obj.Q(1,4) = 2;
        end
        
        function action = pickAction(obj,state)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            
            row = obj.Q(state,:);
            obj.currentBest = max(row);
            spalte = 0;
            
            for v = 1:1:7
               if any(obj.Q(state,v) == max(row))
                    spalte = v;
                    break;
               end    
                
            end    
                       
            action = spalte;
                            
        end
        
        function value = getQValue(obj, state, action)
           value = obj.Q(state, action); 
        end    
        
        function obj = setQValue(obj, state, action, value)
           obj.Q(state, action) = value;
            
        end    
        
        function wholeQ = giveAllQ(obj, ignore)
           wholeQ = obj.Q; 
            
        end   
        
    end
end

