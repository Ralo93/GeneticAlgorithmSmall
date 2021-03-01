

clc;

warning('off','all')
%addpath(genpath(pwd));


% INITIALIZATION

fs = FeedbackSystem();
env = Environment();
l = Learner();

%Initialization Q(states, actions)
%Wie könnte man die Initialisierung gut gestalten?
Q = zeros(4,7);
Q(1,1) = 12;
Q(1,2) = 14;
Q(1,3) = 11;
Q(1,4) = 13;
Q(1,5) = 12;
Q(1,6) = 16;
Q(1,7) = 12;

Q(2,1) = 12;
Q(2,2) = 16;
Q(2,3) = 12;
Q(2,4) = 14;
Q(2,5) = 12;
Q(2,6) = 12;
Q(2,7) = 12;

Q(3,1) = 12;
Q(3,2) = 13;
Q(3,3) = 12;
Q(3,4) = 17;
Q(3,5) = 12;
Q(3,6) = 14;
Q(3,7) = 12;

Q(4,1) = 12;
Q(4,2) = 16;
Q(4,3) = 12;
Q(4,4) = 17;
Q(4,5) = 12;
Q(4,6) = 14;
Q(4,7) = 12;


Kp = 1;
Ki = 0;
Kd = 0;


%For plotting
pGain = [200];
iGain = [200];
dGain = [200];

sse = [200];
mp = [200];
st = [200];

% Get starting state

[sse, Mp, sTime] = fs.calculateFeedback(Kp, Ki, Kd);
state = getState(sse, Mp);

for v = 1:1:200
    
    % Code an Michi
    
    % nach 100 iterationen plant change to second system
    
    % Teste mehrere Systeme: dritter ordnung
    
    % Recherche Q-Learning erweitern: 2 Paper    
    
    % Terminierungsangabe: When state 4 erreicht: Abbruch
    
    action = pickAction(Q, state);
    [KpNew, KiNew, KdNew] = takeAction(action, Kp, Ki, Kd);
    [sseNew, MpNew, sTimeNew] = fs.calculateFeedback(KpNew, KiNew, KdNew);
    stateNew = getState(sseNew, MpNew);
    reward = l.calculateReward(state, sseNew, MpNew, sTimeNew);
    
    newQValue = l.calculateQValue(reward, Q, state, action);
    
    Q(state, action) = newQValue;
    
    Kp = KpNew;
    Ki = KiNew;
    Kd = KdNew;
    
    state = stateNew;
    
    %For plotting
    pGain(v) = Kp;
    iGain(v) = Ki;
    dGain(v) = Kd;
    
    sse(v) = sseNew;
    mp(v) = MpNew;
    st(v) = sTimeNew;
    
    
    
end    


figure(1)
plot(sse)
title('Steady State Error')

figure(2)
plot(mp)
title('Overshoot in %')

figure(3)
plot(st)
title('Settling Time in s')


figure(4)
plot(pGain)
title('kP Gain in 0.5 steps')

figure(5)
plot(iGain)
title('kI Gain in 0.5 steps')

figure(6)
plot(dGain)
title('kD Gain in 0.5 steps')

[sseEnd, MpEnd, sTimeENd] = fs.calculateFeedback(5.5, 11.5, 7.5);

%action = env.pickAction(state);

%[KpNew, KiNew, KdNew] = takeAction(action, Kp, Ki, Kd);

% calculate feedback and getState (and numbers) for this action
% then calculate the reward

%[sseNew, MpNew, sTimeNew] = fs.calculateFeedback(KpNew, KiNew, KdNew);
%stateNew = getState(sseNew, MpNew);
%reward = L.calculateReward(state, sseNew, MpNew, sTimeNew);

% Q = env.giveAllQ(2);

% newQValue = L.calculateQValue(reward, Q, state, action);

%nextAction = takeAction(state);
%Look up Q values for action










%--------------------------------------------------------------- Simulation

%ex = Experiment();
%ex.simulation.Tsim = 1.0;
%ex.setup.projectile.state = [0.7e-03; 0; 0.7e-03; 0];
%ex.controller.kPID = [80,42,-12]; % which is k_p, k_i, k_d

%[x,u,t] = ex.simulation.PIDCtrl;
%[x,u,t] = ex.simulation.openLoop(0);

% x ist hier ein Lösungsvektor: x(:,1) ist die Position, x(:,2) die
% Geschwindingkeit
% Jetzt nicht mehr


%Non-linear system:
% Eigentlich nur die projectile dynamics







% z<obj.pos-15e-03) | (z>obj.pos+15e-03)
%z_beispiel = -15e-03:0.0001:15e-03;

%f = ex.setup.magnet.computeMagneticField(z_beispiel);
%f2 = ex.setup.magnet.computeMagneticField(x(:,1));

%uind = ex.setup.measurement.measure(t, x(:,1), x(:,2));
%figure(1);
%plot(z_beispiel, f);
%xlabel('Position z');
%ylabel('Magnetic force');

%Fg = ex.setup.projectile.computeFg()
%Fges = f2 - Fg;
%mass = ex.setup.projectile.mass



%figure(1);
%plot(t, x(:,1),'r');
%figure(2);
%plot(t, x(:,3),'b');
%figure(3);
%plot(t, Fges);

%figure(3);
%plot(t, x(:,2),'r');
%figure(4);
%plot(t, x(:,4),'b');

%figure(5);
%plot(t, x(:,5),'c');
%figure(6);
%plot(t, x(:,6),'h');


%State_new = ex.setup.projectile.dynamics(x, Fges);


%figure(2);
%plot(t,f);
%xlabel('Time (sec)')
%ylabel('Magnetic force')
%-------------------------------------------------------------------------


%--------------------------------------------------------------- Evaluation
%ex.visualization.plotTrajectory(x,t);
%ex.visualization.plotTrajectory(x,t);

 %ex.visualization.plotVoltage(u,t);
 %ex.visualization.plotCurrent(x(:,3),t);
 %ex.visualization.plotPermanentMagnet();
%-------------------------------------------------------------------------

% rmpath(genpath(pwd));
