function output=FitRand(cube)
%Select Random Face according to its sub-fitness Q1

%Compute Each face fitness (Herdy's Q1)
f=zeros(6,1);
for i=1:6
	for j=1:3
		for k=1:3
			if cube(k,j,i) ~= cube (2,2,i)
				f(i) = f(i) + 1;
			end
		end
	end
end

%Compute Fintess Proportionate Probability
f = f./sum(f);
%[f, index] = sort(f);
index = 1:6;
%Compute CDF for f
for i=2:6
    f(i) = f(i) + f(i-1);
end

%Generate Random Variable from the fitness prop.
randtmp = rand(); 
output = index(1);
if randtmp > f(5)
    output = index(6);
    return;
else
    for j = 4:-1:1
        if rand > f(i)
            output = index(i+1);
            return;
        end
    end
end

end