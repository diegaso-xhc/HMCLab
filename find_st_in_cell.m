function ind = find_st_in_cell(c, st)
% This function returns the index of a string on a given cell which
% contains multiple strings, as for example on the model output names of
% the vicon trials

% c is a cell containing strings 
% st is the string we need to compare it to
ind = find(not(cellfun('isempty', strfind(c, st)))); 
end