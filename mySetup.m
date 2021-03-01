classdef mySetup < handle
    %MYSETUP Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        feedbackSystem@FeedbackSystem
        
    end
    
    methods
        function obj = mySetup()
            %MYSETUP Construct an instance of this class
            %   Detailed explanation goes here
            
            obj.feedbackSystem     =  FeedbackSystem(obj);
        end
        
        
        
        
    end
end

