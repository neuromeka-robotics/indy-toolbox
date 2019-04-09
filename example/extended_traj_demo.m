% Check robot status
if (IsRobotReady() ~= 1)
	disp("Robot is not ready!\n");
end

% Start State
DOF = 6;
DELT = 250e-6;
DEGREE = pi/180;
start.t = 0;
start.pos = GetJointPosition();
start.vel = GetJointVelocity(); %zeros(1, DOF, 'double');

% Goal State
goal.t = 2;
goal.vel = [10, 10, 10, 10, 10, 10] * DEGREE;
goal.acc = [5, 5, 5, 5, 5, 5] * DEGREE;

[pd, vd, ad] = vel_profile_interpolation(DELT, start, goal);

% Plotting Data
t = start.t:DELT:(goal.t+2);
plot_data(t, pd, vd)

% Send to Indy
%MoveExtendedTrajectory(DELT, pd, vd, ad);
