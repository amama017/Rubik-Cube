%Get the Statistics for Cube fitness with respect to the number of rand
%moves
Rand_Stat = zeros(100,1);
Div_Stat = zeros(100,1);
%for all number of rand moves
parfor i=1:100
    sum = 0;
    Div_fit = zeros(100,1);
    %for all trials (100 run)
    for j=1:100
        %Generate Rand Cube with i rand moves
        cube = cubgen(i);
        %Get the Fitness of the rand cube
        Div_fit(j,1) = fitness(cube);
        sum = sum + Div_fit(j,1);
    end
    Rand_Stat(i,1) = sum/100;
    Div_Stat(i,1) = std(Div_fit);
end

plot(Div_Stat);
xlabel('Number of Random Moves','FontSize',12);
h = ylabel('STD of Cube Fitness','FontSize',12);
saveas(h,'Std_Rand','epsc');

plot(Rand_Stat);
xlabel('Number of Random Moves','FontSize',12);
h = ylabel('Mean of Cube Fitness','FontSize',12);
saveas(h,'Mean_Rand','epsc');