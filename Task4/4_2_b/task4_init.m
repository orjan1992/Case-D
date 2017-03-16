close all, clear
sim_multiple = 1;
eta_0 = [6 5 0]';
s_0 = 0;
eta_d_0 = [2 0 0]';
eta_d_1 = [10 4 0]';
U_ref = 0.6/5;
mu = 0.1;
sim task4.slx
data1 = data;
if sim_multiple
    mu = 1;
    sim task4.slx
    mu = 10;
    data2 = data;
    sim task4.slx
    data3 = data;
end
t1 = data1.Time;
x1 = data1.Data(:, 1);
y1 = data1.Data(:,2);
psi1 = data1.Data(:,3)*180/pi;
x_d1 = data1.Data(:,4);
y_d1 = data1.Data(:,5);
psi_d1 = data1.Data(:,6)*180/pi;
s1 = data1.Data(:, 7);
u1 = data1.Data(:, 8);
v1 = data1.Data(:, 9);
r1 = data1.Data(:, 10);

if sim_multiple
    t2 = data2.Time;
    x2 = data2.Data(:, 1);
    y2 = data2.Data(:,2);
    psi2 = data2.Data(:,3)*180/pi;
    x_d2 = data2.Data(:,4);
    y_d2 = data2.Data(:,5);
    psi_d2 = data2.Data(:,6)*180/pi;
    s2 = data2.Data(:, 7);
    u2 = data2.Data(:, 8);
    v2 = data2.Data(:, 9);
    r2 = data2.Data(:, 10);

    t3 = data3.Time;
    x3 = data3.Data(:, 1);
    y3 = data3.Data(:,2);
    psi3 = data3.Data(:,3)*180/pi;
    x_d3 = data3.Data(:,4);
    y_d3 = data3.Data(:,5);
    psi_d3 = data3.Data(:,6)*180/pi;
    s3 = data3.Data(:, 7);
    u3 = data3.Data(:, 8);
    v3 = data3.Data(:, 9);
    r3 = data3.Data(:, 10);
end

%% plot colors
c1 = [0,0.4470,0.7410];
c2 = [0.8500,0.3250,0.0980];
c3 = [0.4660    0.6740    0.1880];
%% plot
subplot(2, 2, 1);
plot(t1, x1, 'Color', c1);
hold on;
plot(t1, x_d1,'--', 'Color', c1);
if sim_multiple
    plot(t2, x2, 'Color', c2);
    plot(t2, x_d2, '--', 'Color', c2);
    plot(t3, x3, 'Color', c3);
    plot(t3, x_d3, '--', 'Color', c3);
end
xlabel('x [m]');
ylabel('t [s]');
legend('x(t) \mu = 0.1', 'x_d(s) \mu = 0.1','x(t) \mu = 1', 'x_d(s) \mu = 1','x(t) \mu = 10', 'x_d(s) \mu = 10');
grid on;
subplot(2, 2, 2);
% plot(t, s);
% xlabel('s');
% ylabel('t');
% legend('s');
% grid on;
plot(t1, psi1, 'Color', c1);
hold on;
plot(t1, psi_d1,'--', 'Color', c1);
if sim_multiple
    plot(t2, psi2, 'Color', c2);
    plot(t2, psi_d2, '--', 'Color', c2);
    plot(t3, psi3, 'Color', c3);
    plot(t3, psi_d3, '--', 'Color', c3);
end
xlabel('s');
ylabel('t');
legend('\psi(t) \mu = 0.1', '\psi_d(s) \mu = 0.1','\psi(t) \mu = 1', '\psi_d(s) \mu = 1','\psi(t) \mu = 10', '\psi_d(s) \mu = 10');
grid on;
subplot(2, 2, 3);
plot(t1, y1, 'Color', c1);
hold on;
plot(t1, y_d1,'--', 'Color', c1);
if sim_multiple
    plot(t2, y2, 'Color', c2);
    plot(t2, y_d2, '--', 'Color', c2);
    plot(t3, y3, 'Color', c3);
    plot(t3, y_d3, '--', 'Color', c3);
end
xlabel('y [m]');
ylabel('t [s]');
legend('y(t) \mu = 0.1', 'y_d(s) \mu = 0.1','y(t) \mu = 1', 'y_d(s) \mu = 1','y(t) \mu = 10', 'y_d(s) \mu = 10');
grid on;
% subplot(2, 2, 4);
% plot(t, u, t, v, t, r*180/pi);
% ylabel('t [s]');
% xlabel('m/s and deg/s');
% legend('u', 'v', 'r');
% grid on;
if ~sim_multiple
    figure
    subplot(1, 2, 1);
    plot(y1, x1, y_d1, x_d1);
    subplot(1, 2, 2);
    plot(t1, psi_d1);
end