classdef FeedbackSystem < handle

    
    properties
        sse         % steady-state error for the current iteration
        Mp          % overshoot for the current iteration
        sTime       % settling time for the current iteration
        
        kPID   (1,3) = [0,0,0]; 
    
        
    end
    
    methods
        function obj = FeedbackSystem(par)
            
            obj.sse = 0;
            obj.Mp = 0;
            obj.sTime = 0;
            obj.kPID(1) = 1;
            obj.kPID(2) = 0;
            obj.kPID(2) = 0;
        end
        
        function [sse, Mp, sTime] = calculateFeedback(obj, Kp, Ki, Kd)
            
            
            
            
            num = [1 30];
            den = [1 1 20];
            G = tf(num,den);
            
            
            %Speicherplatz
            
            y = zeros(200);
            t = zeros(200);
            
            %TODO: 
            %Ab hier überprüfen
            
            H = 1;
            C = pid(Kp,Ki,Kd);
            
            T = feedback(C*G,H);
            opt = stepDataOptions('InputOffset',0,'StepAmplitude',1);
            [y,t] = step(T, opt);
            
            %1-y: 1 hier dasselbe wie StepAmplitude
            

            %SettlingTime = tspan(find(y>sserror,1,'last'))
            %S = stepinfo(y,t,'SettlingTimeThreshold',0.001);
            S = stepinfo(y,t);

            %Already in percentages to the y-final
            Mp = S.(subsref(fieldnames(S),substruct('{}',{5})));
            sse = abs(1-y(end));
            sTime = S.(subsref(fieldnames(S), substruct('{}',{2})));
            
            
                   
        end
        
        %function obj = set.kPID(obj, kPID)
        %   obj.kPID(1) = kPID(1);
        %   obj.kPID(2) = kPID(2);
        %   obj.kPID(3) = kPID(3);
        % end    
        
            
    end


end

