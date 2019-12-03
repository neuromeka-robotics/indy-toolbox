SetupConnection;

% Check robot status
if (IsRobotReady() ~= 1)
	disp("Robot is not ready!\n");
end

MoveHome();
pause(3);

q0 = GetJointPosition();
q1 = [0, 0, 0, 0, 0, 0];
q2 = [0, 0, -45, 0, 0, 0];
q3 = [0, -30, -45, 0, 0, 0];
q4 = [0, -30, -45, 0, 20, 0];

waypoints = [q0; q1; q2; q3; q4];

MoveJointWaypoints(waypoints);
pause(7);

MoveZero();
pause(3);

CleanupConnection;