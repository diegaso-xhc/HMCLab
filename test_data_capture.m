clc 
clear all
close all

st1 = Study(1500,4000); % Gather the information and data from a trial 
st1.plot_mk(1, 24, 0); % Plot the marker 24 trajectory
st1.plot_traj(); % Plot the motion study of subject 1 and subject 2

