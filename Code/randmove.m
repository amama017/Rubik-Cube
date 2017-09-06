function seq = randmove(n)
% generates sequence of n random moves
template = 'FBUDLR';
seq = cell(1,n);
tmp = round(5*rand(1,n)+1);
for i=1:n
	seq{i} = template(tmp(i));
end
