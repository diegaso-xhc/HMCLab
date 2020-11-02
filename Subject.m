classdef Subject
   properties
      markers % These are the markers belonging to this subject      
      id_sub % This is the name of the subject   
      n_mk % Number of markers on this subject
      traj_mat % This is a matrix of (n x 3*n_mk)
      out_names % These are the outputs names of the model
      out_val % Values of the outputs of the model
   end   
   methods
      function obj = Subject(markers, id_sub)
         global vicon
         obj.markers = markers;
         obj.id_sub = id_sub;         
         obj.n_mk = length(obj.markers);
         obj.traj_mat = [];
         for i = 1: obj.n_mk             
            obj.traj_mat = [obj.traj_mat, obj.markers{i}.traj]; % Add each marker's trajectory to this matrix
         end         
         obj.out_names = vicon.GetModelOutputNames(obj.id_sub); % Names of the outputs for the current model
         obj.out_val = {};
         for i = 1: length(obj.out_names)
             [obj.out_val{i}.data, obj.out_val{i}.exists] = vicon.GetModelOutput(obj.id_sub, obj.out_names{i}); % Get the values and a the exists boolean for each model outpu
         end
      end
   end
end