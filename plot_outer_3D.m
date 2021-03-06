function plot_outer_3D(tv, r, v, u, m)

time = tv;
input_norm = norms(u);
thrust_vectorX = 90 - rad2deg(atan2(u(1,:), u(3,:)));
thrust_vectorY = 90 - rad2deg(atan2(u(2,:), u(3,:)));
thrust_magnitude = input_norm .* m;

figure; 
subplot(2,1,1);
plot(time, r(1,:), time, r(2,:), time, r(3,:));
% legend('x-Position','y-Position','z-Position')
title('Position (m)');
xlabel('Timing Index (s)')
ylabel('Position (m)')

subplot(2,1,2);
plot(time, v(1,:), time, v(2,:), time, v(3,:));
% legend('x-velocity','y-velocity','z-velocity')
title('Velocity (m/s)');
xlabel('Timing Index (s)')
ylabel('Velocity (m/s)')
hold off;

figure; 
subplot(3,1,1);
plot(time, u(1,:), time, u(2,:), time, u(3,:));
% legend('x-accel','y-accel','z-accel')
title('Thrust Each Axis');
xlabel('Timing Index (s)')
ylabel('Acceleration (m/s^2)')

subplot(3,1,2);
plot(time, thrust_magnitude./1000);
title('Thrust Magnitude- kN');
xlabel('Timing Index (s)')
ylabel('Thrust (kN)')

subplot(3,1,3);
plot(time, thrust_vectorX, time, thrust_vectorY);
title('Thrust Vector');
xlabel('Timing Index (s)')
ylabel('Angle (deg)')
% legend('X-angle', 'Y-angle')
hold off;

figure;
plot(time, m);
title('Mass Depletion');
xlabel('Timing Index (s)')
ylabel('Mass (kg)')

figure; hold on;
grid on;
plot3(r(1,:), r(2,:), r(3,:));
q = quiver3(r(1,:), r(2,:), r(3,:), u(1,:), u(2,:), u(3,:));
q.Color = 'red';
q.LineWidth = 0.25;
title(['Trajectory (m) w/ Initial Velocity:[' num2str(v(:,1)') ']']);
xlabel('X distance (m)')
ylabel('Y distance (m)')
zlabel('Z distance (m)')

end

