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
% close 
% figure;
% n = 25;
% subplot(3, 1, 1)
% plot(st1.subjects{1}.out_val{n}.data(1,:),'g')
% subplot(3, 1, 2)
% plot(st1.subjects{1}.out_val{n}.data(2,:),'b')
% subplot(3, 1, 3)
% plot(st1.subjects{1}.out_val{n}.data(3,:),'c')

%% Save study
save('Trial002','st1')

