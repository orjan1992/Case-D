close, clear
eta_0 = [1.95 0.05 0]';
s_0 = 0;
eta_d_0 = [2 0 0]';
eta_d_1 = [10 4 0]';
U_ref = 0.5;
sim task4.slx


t = data.Time;
x = data.Data(:, 1);
y = data.Data(:,2);
psi = data.Data(:,3);
x_d = data.Data(:,4);
y_d = data.Data(:,5);
psi_d = data.Data(:,6);
s = data.Data(:, 7);
subplot(2, 2, 1);
plot(t, x, t, x_d);
xlabel('x [m]');
ylabel('t [s]');
legend('x(t)', 'x_d(s)');
subplot(2, 2, 2);
plot(t, s);
xlabel('s');
ylabel('t');
legend('s');
subplot(2, 2, 3);
plot(t, y, t, y_d);
xlabel('y [m]');
ylabel('t [s]');
legend('y(t)', 'y_d(s)');
