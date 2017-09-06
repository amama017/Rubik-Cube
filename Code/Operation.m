function output=Operation(cube,op)

%Select which mutation operation will be performed
list_op = [];
if op == 1
	%2 edge flip cw
	%FRBLULiUBiRiFiLiUiLUi
	list_op = {'F','R','B','L','U','L-','U','B-','R-','F-','L-','U-','L','U-'};
elseif op == 2
	%2 edge flip ccw
	%FiLiBiRiUiRUiBLFRURiU
	list_op = {'F-','L-','B-','R-','U-','R','U-','B','L','F','R','U','R-','U'};
elseif op == 3
	%2 corner flip cw
	%LDiLiFiDiFUFiDFLDLiUi
	list_op = {'L','D-','L-','F-','D-','F','U','F-','D','F','L','D','L-','U-'};
elseif op == 4
	%2 corner flip ccw
	%RiDRFDFiUiFDiFiRiDiRU
	list_op = {'R-','D','R','F','D','F-','U-','F','D-','F-','R-','D-','R','U'};
elseif op == 5
	%3 edge swap cw
	%UF2UiRiDiLiF2LDR
	list_op = {'U','F2','U-','R-','D-','L-','F2','L','D','R'};
elseif op == 6
	%3 edge swap ccw
	%UiF2ULDRF2RiDiLi
	list_op = {'U-','F2','U','L','D','R','F2','R-','D-','L-'};
elseif op == 7
	%2 edge/corner swap cw
	%RiURUiRiUFRBiRBRFiR2
	list_op = {'R-','U','R','U-','R-','U','F','R','B-','R','B','R','F-','R2'};
elseif op == 8
	%2 edge/corner swap ccw
	%LUiLiULUiFiLiBLiBiLiFL2
	list_op = {'L','U-','L-','U','L','U-','F-','L-','B','L-','B-','L-','F','L2'};
elseif op == 9
	%3 corner swap cw
	%FiUBUiFUBiUi
	list_op = {'F-','U','B','U-','F','U','B-','U-'};
elseif op == 10
	%3 corner swap ccw
	%FUiBiUFiUiBU
	list_op = {'F','U-','B-','U','F-','U-','B','U'};
elseif op == 11
	%3 inslice edge swap cw
	%RLiU2RiLF2
	list_op = {'R','L-','U2','R-','L','F2'};
elseif op == 12
	%3 inslice edge swap ccw
	%LiRU2LRiF2
	list_op = {'L-','R','U2','L','R-','F2'};
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Modified Herdy's
%else
%elseif op == 13
    %Choose Random Basic Motion
	%Rotate Front
%    template = {'F','B','U','D','L','R','F-','B-','U-','D-','L-','R-','F2','B2','U2','D2','L2','R2'};
%    tmp = round(17*rand()+1);
%	list_op = template(tmp);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
else
	error('Wrong Motion Operation = "%s"', op)
end

%Perform the List of Operations
tmp = cube;
for i=1:size(list_op,2)
	tmp = move(tmp,cell2mat(list_op(i)));
end
output = tmp;