classdef Subject
   properties
      markers % These are the markers belonging to this subject      
      id_sub % This is the name of the subject   
      n_mk % Number of markers on this subject
      traj_mat % This is a matrix of (n x 3*n_mk)
   end   
   methods
      function obj = Subject(markers, id_sub)
         obj.markers = markers;
         obj.id_sub = id_sub;         
         obj.n_mk = length(obj.markers);
         obj.traj_mat = [];
         for i = 1: obj.n_mk             
            obj.traj_mat = [obj.traj_mat, obj.markers{i}.traj]; % Add each marker's trajectory to this matrix
         end         
      end
   end
end