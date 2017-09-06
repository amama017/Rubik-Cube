function output=Loadcube(fname)
%Load Rubik Cube from file
output = struct2array(load(fname));