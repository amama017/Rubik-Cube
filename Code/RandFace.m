function output=RandFace(cube)
%Choose a random face to be front

%Old Herdy's
%randface=round(5*rand()+1);
%Modified Herdy's
randface=FitRand(cube);

tmp = cube;
if randface == 2
	%Let Back be forward
	%B
	tmp(:,:,1) = cube(:,:,2);
	%F
	tmp(:,:,2) = cube(:,:,1);
	%U Reverse Row & Order
	tmp(3,:,3) = cube(1,3:-1:1,3);
	tmp(2,:,3) = cube(2,3:-1:1,3);
	tmp(1,:,3) = cube(3,3:-1:1,3);
	%D Reverse Row & Order
	tmp(3,:,4) = cube(1,3:-1:1,4);
	tmp(2,:,4) = cube(2,3:-1:1,4);
	tmp(1,:,4) = cube(3,3:-1:1,4);
	%R
	tmp(:,:,5) = cube(:,:,6);
	%L
	tmp(:,:,6) = cube(:,:,5);
	
elseif randface == 3
	%Let Upward be forward
	%U
	tmp(:,:,1) = cube(:,:,3);
	%D Reverse Row & Order
	tmp(3,:,2) = cube(1,3:-1:1,4);
	tmp(2,:,2) = cube(2,3:-1:1,4);
	tmp(1,:,2) = cube(3,3:-1:1,4);
	%B Reverse Row & Order
	tmp(3,:,3) = cube(1,3:-1:1,2);
	tmp(2,:,3) = cube(2,3:-1:1,2);
	tmp(1,:,3) = cube(3,3:-1:1,2);
	%F
	tmp(:,:,4) = cube(:,:,1);
	%L Transpose & Reverse Order
	tmp(:,1,5) = cube(3,:,5)';
	tmp(:,2,5) = cube(2,:,5)';
	tmp(:,3,5) = cube(1,:,5)';
	%R Transpose & Reverse Row
	tmp(1,:,6) = cube(:,3,6)';
	tmp(2,:,6) = cube(:,2,6)';
	tmp(3,:,6) = cube(:,1,6)';
	
elseif randface == 4
	%Let Downward be forward
	%D
	tmp(:,:,1) = cube(:,:,4);
	%U Reverse Row & Order
	tmp(3,:,2) = cube(1,3:-1:1,3);
	tmp(2,:,2) = cube(2,3:-1:1,3);
	tmp(1,:,2) = cube(3,3:-1:1,3);
	%F
	tmp(:,:,3) = cube(:,:,1);
	%B Reverse Row & Order
	tmp(3,:,4) = cube(1,3:-1:1,2);
	tmp(2,:,4) = cube(2,3:-1:1,2);
	tmp(1,:,4) = cube(3,3:-1:1,2);
	%L Transpose & Reverse Row
	tmp(1,:,5) = cube(:,3,5)';
	tmp(2,:,5) = cube(:,2,5)';
	tmp(3,:,5) = cube(:,1,5)';
	%R Transpose & Reverse Order
	tmp(:,1,6) = cube(3,:,6)';
	tmp(:,2,6) = cube(2,:,6)';
	tmp(:,3,6) = cube(1,:,6)';
	
elseif randface == 5
	%Let Left be forward
	%L
	tmp(:,:,1) = cube(:,:,5);
	%R
	tmp(:,:,2) = cube(:,:,6);
	%U Transpose & Reverse Row
	tmp(1,:,3) = cube(:,3,3)';
	tmp(2,:,3) = cube(:,2,3)';
	tmp(3,:,3) = cube(:,1,3)';
	%D Transpose & Reverse Order
	tmp(:,1,4) = cube(3,:,4)';
	tmp(:,2,4) = cube(2,:,4)';
	tmp(:,3,4) = cube(1,:,4)';
	%B
	tmp(:,:,5) = cube(:,:,2);
	%F
	tmp(:,:,6) = cube(:,:,1);
	
elseif randface == 6
	%Let Right be forward
	%R
	tmp(:,:,1) = cube(:,:,6);
	%L
	tmp(:,:,2) = cube(:,:,5);
	%U Transpose & Reverse Order
	tmp(:,1,3) = cube(3,:,3)';
	tmp(:,2,3) = cube(2,:,3)';
	tmp(:,3,3) = cube(1,:,3)';
	%D Transpose & Reverse Row
	tmp(1,:,4) = cube(:,3,4)';
	tmp(2,:,4) = cube(:,2,4)';
	tmp(3,:,4) = cube(:,1,4)';
	%F
	tmp(:,:,5) = cube(:,:,1);
	%B
	tmp(:,:,6) = cube(:,:,2);
	
end

output = tmp;