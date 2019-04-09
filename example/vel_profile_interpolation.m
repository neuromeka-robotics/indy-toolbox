function [pd, vd, ad] = vel_profile_interpolation(delt, start, goal)
	DOF = length(start.pos);

	t0 = start.t;
	p0 = start.pos;
	v0 = start.vel;

	tf = goal.t;
	%pf = goal.pos;
	vf = goal.vel;
	af = goal.acc;

	pd = zeros(1, DOF, 'double');
	vd = zeros(1, DOF, 'double');
	ad = zeros(1, DOF, 'double');

	a0 = (vf - v0)/(tf - t0);
	%q_tar = q_0 + v0*(tf - t0)/2.0;

	i = 0;
	for t = t0:delt:tf+2
        i = i + 1;
        if (t == t0)
            pd(i, :) = p0;
            vd(i, :) = v0;
            ad(i, :) = a0;
        elseif (t >= tf)
            pd(i, :) = pd(i-1, :) + vf*delt;
            vd(i, :) = vf;
            ad(i, :) = af;
        else
            period = t - t0;
            vd(i, :) = v0 + a0*period;
            pd(i, :) = p0 + (v0 + vd(i, :))*period/2.0;
            ad(i, :) = a0;
        end
    end
end