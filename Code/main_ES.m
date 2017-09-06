function [cube_next_loop last_fitness] = main_ES(x,mu,lambda)
%the main loop of the ES algorithm.

generation = zeros(3,3,6,lambda);		%Generation
genfitness = 145*ones(lambda,1);		%Generation Fitness

step = mu/lambda;

fitness_sum = 0;

%Generate New Generation from mu parents
for i=1:lambda,
	  sel = floor((i-1)*step)+1;						%Select 1 of the mu parents
	  tmp = x(:,:,:,sel);
	  tmp = RandFace(tmp);								%Choose a Random Face
	  tmp = RandRot(tmp);								%Choose a Random Orientation
      %Old Herdy's Operations
	  randop = round(11*rand()+1);
	  generation(:,:,:,i) = Operation(tmp, randop);		%Apply a Random Operation
      %Modified Herdy's Operations
   	  %randop = round(29*rand()+1);
	  %generation(:,:,:,i) = Operation(tmp, randop);		%Apply a Random Operation
      genfitness(i) = fitness(generation(:,:,:,i));		%Compute Fitness
      fitness_sum = fitness_sum + genfitness(i);
end

% Perform Elitism Selection without Removing Duplicates
%Sort & Get Minimum
% [genfitness, index] = sort(genfitness);
% cube_next_loop = generation(:,:,:,index(1:mu));
% last_fitness = genfitness(1:mu);

% Perform Elitism Selection with Removing Duplicates
% [cube_next_loop, last_fitness] = Unique_Cube( generation, genfitness, lambda, mu );


% Perform Rolletwheel Selection
genfitness = sort(genfitness);

%Set the Selction Size (Remove worse)
Sel_Size = lambda/10;
fitness_sum = sum(genfitness(1:Sel_Size));

%Calculate the probability of each cube
array_of_fitness_prob = (145-genfitness(1:Sel_Size))/((145*Sel_Size)-fitness_sum);
for i=2:Sel_Size,
    array_of_fitness_prob(i) = array_of_fitness_prob(i-1) + array_of_fitness_prob(i);
end

selected_parents = ones(mu,1);  % array conatins the indecies of selected parents


% Applying Roulette Wheel Selection Method without removing duplicates
for i=1:mu,
   val = rand ;
   for j=1:Sel_Size,
       if val <= array_of_fitness_prob(j)
           selected_parents(i) = j;
           break;
       end    
   end
end

index_p = sort(selected_parents);
cube_next_loop = generation(:,:,:,index_p);
last_fitness = genfitness(index_p);