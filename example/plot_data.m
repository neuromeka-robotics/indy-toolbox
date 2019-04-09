function plot_data(t, pos, vel)
  DOF = size(pos);
  DOF = DOF(2);
  figure(1);
  for i = 1:DOF
      plot (t, pos(:, i));
	  hold on;
  end
  
  xlabel ("t");
  ylabel ("Degree");
  title ("Position Data");

  figure(2);
  for i = 1:DOF
      plot (t, vel(:, i));
      hold on;
  end
  
  xlabel ("t");
  ylabel ("Degree/s");
  title ("Velocity Data");
end