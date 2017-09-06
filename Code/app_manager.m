function [cube current_fitness, counteval] = app_manager(cube,mu,lambda)

%Stopping Criteria
stopeval = 200;
counteval = 0;
x = zeros(3,3,6,mu);

for i=1:mu,
	x(:,:,:,i) = cube;
end

current_fitness = fitness(cube);
while current_fitness > 0 && counteval < stopeval
    [x x_fitness] = main_ES(x,mu,lambda);
    current_fitness = x_fitness(1);
    counteval = counteval+1;
    if current_fitness > 0 && counteval == stopeval
        %If the Algorithm fall in local optimum reset the run
        for i=1:mu,
            x(:,:,:,i) = cube;
        end
        counteval = 0;
        current_fitness = fitness(cube);
    end
end

cube = x(:,:,:,1);