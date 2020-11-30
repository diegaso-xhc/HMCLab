%% Definition of fingers/palm/arm segments

thumb_finger = ["RH1", "RTH1", "RTH2", "RTH3"];
index_finger = ["RH2", "RIF1", "RIF2", "RIF3"];
third_finger = ["RH3", "RTF1", "RTF2", "RTF3"];
ring_finger = ["RH4", "RRF1", "RRF2", "RRF3", "RRF4"];
pinkie_finger = ["RH5", "RPF1", "RPF2", "RPF3"];
palm = ["RH1", "RH2", "RH3", "RH4", "RH5", "RH6"];
arm = ["RFA1", "RFA2", "RWRA", "RWRB", "RH1", "RH6"];
seg = ["RH1", "RH2", "RH3"];

[traj, ang] = track_seg(st1, 2, ring_finger, 'ring');
[traj_sn, ang_sn] = snap_seg(traj, ang, 100);
