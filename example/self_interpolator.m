% Configuration
DOF = 6;
DEGREE = double(pi / 180.0);

% Precondition
t_0 = 0;
q_0 = zeros(1, DOF, "double");
qdot_0 = zeros(1, DOF, "double");

t_tar = 2;
qdot_tar = [70, 60, 50, 20, 25, 30] * DEGREE;
qddot_tar = [15, 15, 15, 15, 15, 15] * DEGREE;

% Velocity Profile Interpolator
qd = zeros(1, DOF, "double");
qdotd = zeros(1, DOF, "double");
qddotd = zeros(1, DOF, "double");

qddot_0 = (qdot_tar - qdot_0)/(t_tar - t_0);
q_tar = q_0 + qdot_0*(t_tar - t_0)/2.0;

i = 0;
delt = 250e-6;
for t = t_0:delt:t_tar+2
    i = i + 1;
    if (t == t_0)
        qd(i, :) = q_0;
		qdotd(i, :) = qdot_0;
		qddotd(i, :) = qddot_0;
    elseif (t >= t_tar)
		qd(i, :) = qd(i-1, :) + qdot_tar*delt;
		qdotd(i, :) = qdot_tar;
		qddotd(i, :) = qddot_tar;
	else
		period = t - t_0;
		qdotd(i, :) = qdot_0 + qddot_0*period;
		qd(i, :) = q_0 + (qdot_0 + qdotd(i, :))*period/2.0;
		qddotd(i, :) = qddot_0;
    end
end

t = t_0:delt:t_tar+2;
figure(1);
for i = 1:DOF
	plot (t, qd(:, i));
	hold on;
end

xlabel ("t");
ylabel ("position");
title ("Self Interpolator");

figure(2);
for i = 1:DOF
	plot (t, qdotd(:, i));
	hold on;
end
xlabel ("t");
ylabel ("velocity");
title ("Self Interpolator (vel)");

