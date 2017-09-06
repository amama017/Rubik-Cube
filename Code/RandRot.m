function output=RandRot(cube)
%Choose a random orientation for the front face

randrot=round(3*rand()+1);
tmp = cube;

if randrot == 2
	%Rot 90 CW
	%Rotate F 90CW
	tmp(:,1,1) = cube(3,:,1)';
	tmp(:,2,1) = cube(2,:,1)';
	tmp(:,3,1) = cube(1,:,1)';
	%Rotate B 90CCW
	tmp(1,:,2) = cube(:,3,2)';
	tmp(2,:,2) = cube(:,2,2)';
	tmp(3,:,2) = cube(:,1,2)';
	%L Transpose & Reverse Order
	tmp(:,1,3) = cube(3,:,5)';
	tmp(:,2,3) = cube(2,:,5)';
	tmp(:,3,3) = cube(1,:,5)';
	%R Transpose & Reverse Order
	tmp(:,1,4) = cube(3,:,6)';
	tmp(:,2,4) = cube(2,:,6)';
	tmp(:,3,4) = cube(1,:,6)';
	%D Transpose & Reverse Order
	tmp(:,1,5) = cube(3,:,4)';
	tmp(:,2,5) = cube(2,:,4)';
	tmp(:,3,5) = cube(1,:,4)';
	%U Transpose & Reverse Order
	tmp(:,1,6) = cube(3,:,3)';
	tmp(:,2,6) = cube(2,:,3)';
	tmp(:,3,6) = cube(1,:,3)';
	
elseif randrot == 3
	%Rot 90 CCW
	%Rotate F 90 CCW
	tmp(1,:,1) = cube(:,3,1)';
	tmp(2,:,1) = cube(:,2,1)';
	tmp(3,:,1) = cube(:,1,1)';
	%Rotate B 90 CW
	tmp(:,1,2) = cube(3,:,2)';
	tmp(:,2,2) = cube(2,:,2)';
	tmp(:,3,2) = cube(1,:,2)';
	%R Transpose & Reverse Row
	tmp(1,:,3) = cube(:,3,6)';
	tmp(2,:,3) = cube(:,2,6)';
	tmp(3,:,3) = cube(:,1,6)';
	%L Transpose & Reverse Row
	tmp(1,:,4) = cube(:,3,5)';
	tmp(2,:,4) = cube(:,2,5)';
	tmp(3,:,4) = cube(:,1,5)';
	%U Transpose & Reverse Row
	tmp(1,:,5) = cube(:,3,3)';
	tmp(2,:,5) = cube(:,2,3)';
	tmp(3,:,5) = cube(:,1,3)';
	%D Transpose & Reverse Row
	tmp(1,:,6) = cube(:,3,4)';
	tmp(2,:,6) = cube(:,2,4)';
	tmp(3,:,6) = cube(:,1,4)';
	
elseif randrot == 4
	%Rot 180
	%Rotate F 180
	tmp(1,:,1) = cube(3,3:-1:1,1);
	tmp(2,:,1) = cube(2,3:-1:1,1);
	tmp(3,:,1) = cube(1,3:-1:1,1);
	%Rotate B 180
	tmp(1,:,2) = cube(3,3:-1:1,2);
	tmp(2,:,2) = cube(2,3:-1:1,2);
	tmp(3,:,2) = cube(1,3:-1:1,2);
	%D Reverse Row & Order
	tmp(3,:,3) = cube(1,3:-1:1,4);
	tmp(2,:,3) = cube(2,3:-1:1,4);
	tmp(1,:,3) = cube(3,3:-1:1,4);
	%U Reverse Row & Order
	tmp(3,:,4) = cube(1,3:-1:1,3);
	tmp(2,:,4) = cube(2,3:-1:1,3);
	tmp(1,:,4) = cube(3,3:-1:1,3);
	%Rotate R 180
	tmp(1,:,5) = cube(3,3:-1:1,6);
	tmp(2,:,5) = cube(2,3:-1:1,6);
	tmp(3,:,5) = cube(1,3:-1:1,6);
	%Rotate L 180
	tmp(1,:,6) = cube(3,3:-1:1,5);
	tmp(2,:,6) = cube(2,3:-1:1,5);
	tmp(3,:,6) = cube(1,3:-1:1,5);
	
end

output = tmp;