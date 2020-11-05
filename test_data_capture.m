%% Initialize modules
clc 
clear all
close all

st1 = Study(); % Gather the information and data from a trial 
% st1.plot_mk(1, 24, 0); % Plot the marker 24 trajectory
% st1.plot_traj(); % Plot the motion study of subject 1 and subject 2
st1.subjects{1}.build_results();
st1.plot_traj_ax(150);
%% Plot output angles
close 
figure;
n = 25;
subplot(3, 1, 1)
plot(st1.subjects{1}.out_val{n}.data(1,:),'g')
subplot(3, 1, 2)
plot(st1.subjects{1}.out_val{n}.data(2,:),'b')
subplot(3, 1, 3)
plot(st1.subjects{1}.out_val{n}.data(3,:),'c')

%% Plot moving coordinate axes
ind_o = find_st_in_cell(st1.subjects{1}.out_names, 'ORIGINRHand1');
ind_x = find_st_in_cell(st1.subjects{1}.out_names, 'XAXISRHand1');
ind_y = find_st_in_cell(st1.subjects{1}.out_names, 'YAXISRHand1');
ind_z = find_st_in_cell(st1.subjects{1}.out_names, 'ZAXISRHand1');
o = st1.subjects{1}.out_val{ind_o}.data;
X = st1.subjects{1}.out_val{ind_x}.data;
Y = st1.subjects{1}.out_val{ind_y}.data;
Z = st1.subjects{1}.out_val{ind_z}.data;
org = o(:,1);
x = X(:, 1);
y = Y(:, 1);
z = Z(:, 1);
x = x-org;
x = 10*x/norm(x);
% x = o(:,1) + x*10;
y = y-o(:,1);
y = 10*y/norm(y);
% y = o(:,1) + y*10;
z = z-o(:,1);
z = 10*z/norm(z);
% z = o(:,1) + z*10;

figure
quiver3(org(1), org(2), org(3), x(1), x(2), x(3),'LineWidth',0.8)
hold on
quiver3(org(1), org(2), org(3), y(1), y(2), y(3))
quiver3(org(1), org(2), org(3), z(1), z(2), z(3))


figure
quiver3([org(1) org(1) org(1)], [org(2) org(2) org(2)], [org(3) org(3) org(3)], [x(1) x(2) x(3)], [y(1) y(2) y(3)], [z(1) z(2) z(3)])

% h = quiver3(m(1:3, 1), m(1:3, 1), m(1:3, 1), x, y, z);
% 

% st1.subjects{1}.out_val{21}
% st1.subjects{1}.out_val{21}.data
% [x,y,z] = meshgrid(0:0.2:2,0:0.2:2);
% u = cos(x).*y;
% v = sin(x).*y;
% figure
% h = quiver(x,y,u,v);
% N = 100;
% phi = linspace(0, 2*pi, N);
% for kk = 1:N
%   u = cos(x+phi(kk)).*y;
%   v = sin(x+phi(kk)).*y;
%   h.UData = u;
%   h.VData = v;
%   pause(0.05)
% end