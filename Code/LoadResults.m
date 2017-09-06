%This Code Load the ES Results for all Test Cubes

list_mu = [10, 10, 10, 10, 20, 20, 50, 50, 5];
list_lamda = [100, 200, 500, 1000, 200, 500, 500, 1000, 500];
Res_Dir = 'Results\Elitism_Roulete_Dup\Cube';
Res_Mat = ['_Roulete_10_0100.mat'; '_Roulete_10_0200.mat'; ...
           '_Roulete_10_0500.mat'; '_Roulete_10_1000.mat'; ...
           '_Roulete_20_0200.mat'; '_Roulete_05_0500.mat'; '_Roulete_20_0500.mat'; ...
           '_Roulete_50_0500.mat'; '_Roulete_50_1000.mat'];

Avg_Gen = zeros(20,9);
Median_Gen = zeros(20,9);
Std_Gen = zeros(20,9);

for fi=1:20
    for j=1:9
        %Load Cube Results
        load(strcat(Res_Dir,mat2str(fi),'\Cube',mat2str(fi),Res_Mat(j,:)));
        Avg_Gen(fi,j) = avg_gen;
        Median_Gen(fi,j) = median(gen_num);
        Std_Gen(fi,j) = std_gen;
    end
end