function [ Uniq_Cubes Uniq_fitness] = Unique_Cube( List_Cubes, fitness, List_Len, Uniq_Len )
%Sort & Remove Dublicate Cubes From List of Cubes

%Sort & Get Minimum
[fitness, index] = sort(fitness);
%cube_next_loop = List_Cubes(:,:,:,index(1:Uniq_Len));
%last_fitness = fitness(1:Uniq_Len);

Uniq_Cubes = zeros(3,3,6,Uniq_Len);
index_un = zeros(Uniq_Len,1);
Uniq_fitness = zeros(Uniq_Len,1);
i = 1;
j=2;
%Save Best Fitness in 1st index
Uniq_Cubes(:,:,:,i) = List_Cubes(:,:,:,index(i));
Uniq_fitness(i) = fitness(i);
index_un(i) = index(i);

while j<=Uniq_Len,
    if(Uniq_fitness(j-1) ~= fitness(i))
        %If fitness is different, then they are not equal
        Uniq_Cubes(:,:,:,j) = List_Cubes(:,:,:,index(i));
        Uniq_fitness(j) = fitness(i);
        index_un(j) = index(i);
        j=j+1;
        i=i+1;
    else
        while(isequal(Uniq_Cubes(:,:,:,j-1),List_Cubes(:,:,:,index(i))) && (i<=List_Len))
            %Increment the Iterator i till you find a different cube
            i=i+1;
        end
        if(i<=List_Len)
            %Check all previous unique cubes
            l=j-1;
            Unique = 1;
            while (l >= 1) && (Unique == 1) && (Uniq_fitness(l) == fitness(i))
                %Check Cubes with same fitness only
                if(isequal(Uniq_Cubes(:,:,:,j-1),List_Cubes(:,:,:,index(i))))
                    %if it is duplicate break
                    Unique = 0;
                else
                    Unique = 1;
                end
                l=l-1;
            end
            if(Unique == 1)
                %if it is Unique
                Uniq_Cubes(:,:,:,j) = List_Cubes(:,:,:,index(i));
                Uniq_fitness(j) = fitness(i);
                index_un(j) = index(i);
                j=j+1;
            end
            i=i+1;
        else
            %The Array is finshed && Unique Array is not
            %Reset the Array Iterator i
            i=2;
            l=2;
            while j<=Uniq_Len
                if (index_un(l) == index(i))
                    %if taken before
                    l=l+1;
                else
                    %if exists but not taken
                    Uniq_Cubes(:,:,:,j) = List_Cubes(:,:,:,index(i));
                    Uniq_fitness(j) = fitness(i);
                    j=j+1;
                end
                i=i+1;
            end
        end
    end
end

end
