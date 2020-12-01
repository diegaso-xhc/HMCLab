% Developed by Diego Hidalgo C.

%% Restart the program
clear all
close all
clc

%% Loading the information from recordings
load('Trial004_s2.mat')
st1.subjects{1}.build_results();
st1.subjects{2}.build_results();

%% Definition of fingers/palm/arm segments
thumb_finger = ["RH1", "RTH1", "RTH2", "RTH3"];
index_finger = ["RH2", "RIF1", "RIF2", "RIF3"];
third_finger = ["RH3", "RTF1", "RTF2", "RTF3"];
ring_finger = ["RH4", "RRF1", "RRF2", "RRF3", "RRF4"];
pinkie_finger = ["RH5", "RPF1", "RPF2", "RPF3"];
palm = ["RH1", "RH2", "RH3", "RH4", "RH5", "RH6"];
arm = ["RFA1", "RFA2", "RWRA", "RWRB", "RH1", "RH6"];
seg = ["RH1", "RH2", "RH3"];

n_smp = 750;
[traj, ang] = track_seg(st1, 2, index_finger, 'index');
[traj_sn, ang_sn] = snap_seg(traj, ang, n_smp);
T = [st1.subjects{2}.ax(4:6, n_smp), st1.subjects{2}.ax(7:9, n_smp), st1.subjects{2}.ax(10:12, n_smp), st1.subjects{2}.ax(1:3, n_smp)];
T = [T; 0 0 0 1];
T*[1;0;0;1]

