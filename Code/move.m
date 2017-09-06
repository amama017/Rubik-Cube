function cube_after = move(cube,op_mov)
%
% Perform Transformation on cube according to rubic movements
%

% Matrix(row, col, faces)
%Faces	F -> 1
%		B -> 2
%		U -> 3
%		D -> 4
%		L -> 5
%		R -> 6
tmp = zeros(3,3,6);
tmp = cube;

if op_mov == 'F'
	%Front Layer Motion - Clockwise - 90
	%Rotate F
	tmp(:,1,1) = cube(3,:,1)';
	tmp(:,2,1) = cube(2,:,1)';
	tmp(:,3,1) = cube(1,:,1)';
	%3rd row of U = 3rd col of L (reverse)
	tmp(3,:,3) = cube(3:-1:1,3,5)';
	%1st col of R = 3rd row of U
	tmp(:,1,6) = cube(3,:,3)';
	%1st row of D = 1st col of R (reverse)
	tmp(1,:,4) = cube(3:-1:1,1,6)';
	%3rd Col of L = 1st row of D
	tmp(:,3,5) = cube(1,:,4)';

elseif op_mov == 'B'
	%Back Layer Motion - Clockwise - 90
	%Rotate B
	tmp(:,1,2) = cube(3,:,2)';
	tmp(:,2,2) = cube(2,:,2)';
	tmp(:,3,2) = cube(1,:,2)';
	%1st row of U = 3rd col of R
	tmp(1,:,3) = cube(:,3,6)';
	%1st col of L = 1st row of U (reverse)
	tmp(:,1,5) = cube(1,3:-1:1,3)';
	%3rd row of D = 1st col of L
	tmp(3,:,4) = cube(:,1,5)';
	%3rd Col of R = 3rd row of D (reverse)
	tmp(:,3,6) = cube(3,3:-1:1,4)';

elseif op_mov == 'U'
	%Upper Layer Motion - Clockwise - 90
	%Rotate U
	tmp(:,1,3) = cube(3,:,3)';
	tmp(:,2,3) = cube(2,:,3)';
	tmp(:,3,3) = cube(1,:,3)';
	%1st row of R = 1st row of B
	tmp(1,:,6) = cube(1,:,2);
	%1st row of F = 1st row of R
	tmp(1,:,1) = cube(1,:,6);
	%1st row of L = 1st row of F
	tmp(1,:,5) = cube(1,:,1);
	%1st row of B = 1st row of L
	tmp(1,:,2) = cube(1,:,5);

elseif op_mov == 'D'
	%Down Layer Motion - Clockwise - 90
	%Rotate D
	tmp(:,1,4) = cube(3,:,4)';
	tmp(:,2,4) = cube(2,:,4)';
	tmp(:,3,4) = cube(1,:,4)';
	%3rd row of R = 3rd row of F
	tmp(3,:,6) = cube(3,:,1);
	%3rd row of F = 3rd row of L
	tmp(3,:,1) = cube(3,:,5);
	%3rd row of L = 3rd row of B
	tmp(3,:,5) = cube(3,:,2);
	%3rd row of B = 3rd row of R
	tmp(3,:,2) = cube(3,:,6);

elseif op_mov == 'L'
	%Left Layer Motion - Clockwise - 90
	%Rotate L
	tmp(:,1,5) = cube(3,:,5)';
	tmp(:,2,5) = cube(2,:,5)';
	tmp(:,3,5) = cube(1,:,5)';
	%1st col of F = 1st col of U
	tmp(:,1,1) = cube(:,1,3);
	%1st col of D = 1st col of F
	tmp(:,1,4) = cube(:,1,1);
	%3rd col of B = 1st col of D (reverse)
	tmp(:,3,2) = cube(3:-1:1,1,4);
	%1st col of U = 3rd col of B (reverse)
	tmp(:,1,3) = cube(3:-1:1,3,2);

elseif op_mov == 'R'
	%Right Layer Motion - Clockwise - 90
	%Rotate R
	tmp(:,1,6) = cube(3,:,6)';
	tmp(:,2,6) = cube(2,:,6)';
	tmp(:,3,6) = cube(1,:,6)';
	%3rd col of F = 3rd col of D
	tmp(:,3,1) = cube(:,3,4);
	%3rd col of U = 3rd col of F
	tmp(:,3,3) = cube(:,3,1);
	%1st col of B = 3rd col of U (reverse)
	tmp(:,1,2) = cube(3:-1:1,3,3);
	%3rd col of D = 1st col of B (reverse)
	tmp(:,3,4) = cube(3:-1:1,1,2);

elseif op_mov == 'F2'
	%Front Layer Motion - Clockwise - 180
	%Rotate F
	tmp(1,:,1) = cube(3,3:-1:1,1);
	tmp(2,:,1) = cube(2,3:-1:1,1);
	tmp(3,:,1) = cube(1,3:-1:1,1);
	
	%3rd row of U <=> 1st row of D (reverse)
	tmp(3,:,3) = cube(1,3:-1:1,4);
	tmp(1,:,4) = cube(3,3:-1:1,3);
	%1st col of R <=> 3rd col of L (reverse)
	tmp(:,1,6) = cube(3:-1:1,3,5);
	tmp(:,3,5) = cube(3:-1:1,1,6);

elseif op_mov == 'B2'
	%Back Layer Motion - Clockwise - 180
	%Rotate B
	tmp(1,:,2) = cube(3,3:-1:1,2);
	tmp(2,:,2) = cube(2,3:-1:1,2);
	tmp(3,:,2) = cube(1,3:-1:1,2);
	
	%1st row of U <=> 3rd row of D (reverse)
	tmp(1,:,3) = cube(3,3:-1:1,4);
	tmp(3,:,4) = cube(1,3:-1:1,3);
	%3rd col of R <=> 1st col of L (reverse)
	tmp(:,3,6) = cube(3:-1:1,1,5);
	tmp(:,1,5) = cube(3:-1:1,3,6);

elseif op_mov == 'U2'
	%Upper Layer Motion - Clockwise - 180
	%Rotate U
	tmp(1,:,3) = cube(3,3:-1:1,3);
	tmp(2,:,3) = cube(2,3:-1:1,3);
	tmp(3,:,3) = cube(1,3:-1:1,3);
	
	%1st row of R <=> 1st row of L
	tmp(1,:,6) = cube(1,:,5);
	tmp(1,:,5) = cube(1,:,6);
	%1st row of F <=> 1st row of B
	tmp(1,:,1) = cube(1,:,2);
	tmp(1,:,2) = cube(1,:,1);

elseif op_mov == 'D2'
	%Down Layer Motion - Clockwise - 180
	%Rotate D
	tmp(1,:,4) = cube(3,3:-1:1,4);
	tmp(2,:,4) = cube(2,3:-1:1,4);
	tmp(3,:,4) = cube(1,3:-1:1,4);
	
	%3rd row of R <=> 3rd row of L
	tmp(3,:,6) = cube(3,:,5);
	tmp(3,:,5) = cube(3,:,6);
	%3rd row of F <=> 3rd row of B
	tmp(3,:,1) = cube(3,:,2);
	tmp(3,:,2) = cube(3,:,1);

elseif op_mov == 'L2'
	%Left Layer Motion - Clockwise - 180
	%Rotate L
	tmp(1,:,5) = cube(3,3:-1:1,5);
	tmp(2,:,5) = cube(2,3:-1:1,5);
	tmp(3,:,5) = cube(1,3:-1:1,5);
	
	%1st col of F = 3rd col of B (reverse)
	tmp(:,1,1) = cube(3:-1:1,3,2);
	tmp(:,3,2) = cube(3:-1:1,1,1);
	%1st col of D = 1st col of U
	tmp(:,1,4) = cube(:,1,3);
	tmp(:,1,3) = cube(:,1,4);

elseif op_mov == 'R2'
	%Right Layer Motion - Clockwise - 180
	%Rotate R
	tmp(1,:,6) = cube(3,3:-1:1,6);
	tmp(2,:,6) = cube(2,3:-1:1,6);
	tmp(3,:,6) = cube(1,3:-1:1,6);
	
	%3rd col of F = 1st col of B (reverse)
	tmp(:,3,1) = cube(3:-1:1,1,2);
	tmp(:,1,2) = cube(3:-1:1,3,1);
	%3rd col of D = 3rd col of U
	tmp(:,3,4) = cube(:,3,3);
	tmp(:,3,3) = cube(:,3,4);
	
elseif op_mov == 'F-'
	%Front Layer Motion - Counter-Clockwise - 90
	%Rotate F
	tmp(1,:,1) = cube(:,3,1)';
	tmp(2,:,1) = cube(:,2,1)';
	tmp(3,:,1) = cube(:,1,1)';
	%3rd col of L = 3rd row of U (reverse)
	tmp(:,3,5) = cube(3,3:-1:1,3)';
	%3rd row of U = 1st col of R
	tmp(3,:,3) = cube(:,1,6)';
	%1st col of R = 1st row of D (reverse)
	tmp(:,1,6) = cube(1,3:-1:1,4)';
	%1st row of D = 3rd Col of L
	tmp(1,:,4) = cube(:,3,5)';
	
elseif op_mov == 'B-'
	%Back Layer Motion - Counter-Clockwise - 90
	%Rotate B
	tmp(1,:,2) = cube(:,3,2)';
	tmp(2,:,2) = cube(:,2,2)';
	tmp(3,:,2) = cube(:,1,2)';
	%1st col of L = 3rd row of D
	tmp(:,1,5) = cube(3,:,4)';
	%1st row of U = 1st col of L (reverse)
	tmp(1,:,3) = cube(3:-1:1,1,5)';
	%3rd col of R = 1st row of U
	tmp(:,3,6) = cube(1,:,3)';
	%3rd row of D = 3rd Col of R (reverse)
	tmp(3,:,4) = cube(3:-1:1,3,6)';
	
elseif op_mov == 'U-'
	%Upper Layer Motion - Counter-Clockwise - 90
	%Rotate U
	tmp(1,:,3) = cube(:,3,3)';
	tmp(2,:,3) = cube(:,2,3)';
	tmp(3,:,3) = cube(:,1,3)';
	%1st row of B = 1st row of R
	tmp(1,:,2) = cube(1,:,6);
	%1st row of R = 1st row of F
	tmp(1,:,6) = cube(1,:,1);
	%1st row of F = 1st row of L
	tmp(1,:,1) = cube(1,:,5);
	%1st row of L = 1st row of B
	tmp(1,:,5) = cube(1,:,2);
	
elseif op_mov == 'D-'
	%Down Layer Motion - Counter-Clockwise - 90
	%Rotate D
	tmp(1,:,4) = cube(:,3,4)';
	tmp(2,:,4) = cube(:,2,4)';
	tmp(3,:,4) = cube(:,1,4)';
	%3rd row of B = 3rd row of L
	tmp(3,:,2) = cube(3,:,5);
	%3rd row of R = 3rd row of B
	tmp(3,:,6) = cube(3,:,2);
	%3rd row of F = 3rd row of R
	tmp(3,:,1) = cube(3,:,6);
	%3rd row of L = 3rd row of F
	tmp(3,:,5) = cube(3,:,1);
	
elseif op_mov == 'L-'
	%Left Layer Motion - Counter-Clockwise - 90
	%Rotate L
	tmp(1,:,5) = cube(:,3,5)';
	tmp(2,:,5) = cube(:,2,5)';
	tmp(3,:,5) = cube(:,1,5)';
	%1st col of U = 1st col of F
	tmp(:,1,3) = cube(:,1,1);
	%1st col of F = 1st col of D
	tmp(:,1,1) = cube(:,1,4);
	%1st col of D = 3rd col of B (reverse)
	tmp(:,1,4) = cube(3:-1:1,3,2);
	%3rd col of B = 1st col of U (reverse)
	tmp(:,3,2) = cube(3:-1:1,1,3);
	
elseif op_mov == 'R-'
	%Right Layer Motion - Counter-Clockwise - 90
	%Rotate R
	tmp(1,:,6) = cube(:,3,6)';
	tmp(2,:,6) = cube(:,2,6)';
	tmp(3,:,6) = cube(:,1,6)';
	%3rd col of D = 3rd col of F
	tmp(:,3,4) = cube(:,3,1);
	%3rd col of F = 3rd col of U
	tmp(:,3,1) = cube(:,3,3);
	%3rd col of U = 1st col of B (reverse)
	tmp(:,3,3) = cube(3:-1:1,1,2);
	%1st col of B = 3rd col of D (reverse)
	tmp(:,1,2) = cube(3:-1:1,3,4);
	
else
	error('Wrong Motion Operation = "%s"', op_mov)
end

cube_after = tmp;
end
