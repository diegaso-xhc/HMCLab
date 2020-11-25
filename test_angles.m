%% Initialize modules
% clc 
% clear all
% close all

%% Manipulating data

% st1 = Study(); % Gather the information and data from a trial 
% st1.plot_mk(1, 24, 0); % Plot the marker 24 trajectory
% st1.plot_traj(); % Plot the motion study of subject 1 and subject 2
st1.subjects{2}.build_results();
% st1.plot_traj_ax(2, 150);
y = st1.subjects{2}.get_var_list(st1.subjects{2}.out_names);




%% Plot output angles

figure;
sub = 2;
n = 16;
subplot(3, 1, 1)
plot(st1.subjects{sub}.out_val{n}.data(1,:),'g')
xlabel('No. of sample')
ylabel('Angle with respect to axis 1')
subplot(3, 1, 2)
plot(st1.subjects{sub}.out_val{n}.data(2,:),'b')
xlabel('No. of sample')
ylabel('Angle with respect to axis 2')
subplot(3, 1, 3)
plot(st1.subjects{sub}.out_val{n}.data(3,:),'c')
xlabel('No. of sample')
ylabel('Angle with respect to axis 3')

sgtitle(y{n, 2})


%% Save study
save('Trial002_s2','st1')

