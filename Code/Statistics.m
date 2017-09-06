%This Code runs the ES Algorithm several times per cube
%and generate statistics about the algorithm behaviour

list_mu = [10, 10, 10, 10, 20, 20, 50, 50, 5];
list_lamda = [100, 200, 500, 1000, 200, 500, 500, 1000, 500];
Res_Dir = 'Results\Cube';
Cube_Dir = 'Test_Cases\Cube';
Res_Mat = ['_Roulete_10_0100.mat'; '_Roulete_10_0200.mat'; ...
           '_Roulete_10_0500.mat'; '_Roulete_10_1000.mat'; ...
           '_Roulete_20_0200.mat'; '_Roulete_20_0500.mat'; ...
           '_Roulete_50_0500.mat'; '_Roulete_50_1000.mat'; '_Roulete_05_0500.mat'];

for fi=1:1
    %Load Cube
    cube = Loadcube(strcat(Cube_Dir,mat2str(fi),'.mat'));


%list_files = ['Results\Cube1_Roulete_10_0100.mat'; 'Results\Cube1_Roulete_10_0200.mat'; ...
 %             'Results\Cube1_Roulete_10_0500.mat'; 'Results\Cube1_Roulete_10_1000.mat'; ...
  %            'Results\Cube1_Roulete_20_0200.mat'; 'Results\Cube1_Roulete_20_0500.mat'; ...
   %           'Results\Cube1_Roulete_50_0500.mat'; 'Results\Cube1_Roulete_50_1000.mat'; 'Results\Cube1_Roulete_10_0500.mat'];
%j=9;
    for j=1:1

        %Define Properties
        num_runs = 100;                         %Number of Runs per Cube
        mu = list_mu(j);                     			%Selected parents
        lambda = list_lamda(j);							%Population size
        f = 145*ones(num_runs,1);
        gen_num = zeros(num_runs,1);
        
        %Run the ES 100 runs per cube
        parfor i=1:num_runs
            [Rsol,f(i),gen_num(i)]=app_manager(cube,mu,lambda);
            disp(['Run #' ,mat2str(i) ,' Have F=' ,mat2str(f(i)) ,' After ' ,mat2str(gen_num(i)) ,' Generations']);
        end;
        
        avg_f = sum(f)/num_runs;
        avg_gen = sum(gen_num)/num_runs;
        std_gen = std(gen_num);
        clc;
        disp(['Avg Fitness=' ,mat2str(avg_f) ,' Avg #Generations=' ,mat2str(avg_gen) ,' with Std=' ,mat2str(std_gen)]);
        
        [h_freq, h_points] = hist(gen_num,100);
        %bar (h_points, h_freq);
        
        Out_File = strcat(Res_Dir,mat2str(fi),Res_Mat(j,:));
        
        save(Out_File,'gen_num','avg_f','avg_gen','std_gen','lambda','h_freq','h_points');
    end
end