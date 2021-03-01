function [Kp, Ki, Kd] = takeAction(action, KpIn, KiIn, KdIn)


%TODO: Switch Case (didnt work so far..)
    if (action == 1)
        
        Kp = KpIn;
        Ki = KiIn;
        Kd = KdIn;
        return
    end
    
    if (action == 2)
        Kp = KpIn+0.5;
        Ki = KiIn;
        Kd = KdIn;
        return
        
    end
     
    if (action == 3)
        KpTemp = KpIn-0.5;
        Ki = KiIn;
        Kd = KdIn;
        
        if (KpTemp < 1)
            Kp = 1;
            return
        end
            Kp = KpTemp;
        return
    end
    
    if (action == 4)
        Kp = KpIn;
        Ki = KiIn+0.5;
        Kd = KdIn;
    end
    
    if (action == 5)
        Kp = KpIn;
        KiTemp = KiIn-0.5;
        Kd = KdIn;
        
        if (KiTemp < 0)
            Ki = 0;
            return
        end
            Ki = KiTemp;
        return
    end
    
    if (action == 6)
        Kp = KpIn;
        Ki = KiIn;
        Kd = KdIn+0.5;
        return
    end
    
    if (action == 7)
        Kp = KpIn;
        Ki = KiIn;
        KdTemp = KdIn-0.5;
     
        if (KdTemp < 0)
            Kd = 0;
            return
        end
            Kd = KdTemp;
        return
    end
end

