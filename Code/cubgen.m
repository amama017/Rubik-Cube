function R = cubgen(n)
%Generates Rubik's cube of 3x3x6 dimension.
%n is number of random moves applied to scramble the cube. 

d = 3;
R  = zeros(d,d,6);
% Set each face by colors from 1 to 6
R(:) = ceil((1:6*d^2)/d^2);

seq = randmove(n);
%%GENERATE APPROPRIATE OUTPUT
for i=1:n
	R = move(R,seq{i});
end