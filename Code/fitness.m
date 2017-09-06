function f=fitness(cube)
%Calculate Herd's fitness

Q1 = 0;
Q2 = 0;
Q3 = 0;

%for each face the difference between each facelet and the center "Q1"
for i=1:6
	for j=1:3
		for k=1:3
			if cube(k,j,i) ~= cube (2,2,i)
				Q1 = Q1 + 1;
			end
		end
	end
end

%for all 12 edges the difference between the facelets in edge and the center "Q2"
edge = zeros(2,3,12);
edge(:,:,1) = [[1,2,1];[3,2,3]]; %1st edge (F,U)
edge(:,:,2) = [[3,2,1];[1,2,4]]; %2nd edge (F,D)
edge(:,:,3) = [[2,1,1];[2,3,5]]; %3rd edge (F,L)
edge(:,:,4) = [[2,3,1];[2,1,6]]; %4th edge (F,R)
edge(:,:,5) = [[1,2,2];[1,2,3]]; %5th edge (B,U)
edge(:,:,6) = [[3,2,2];[3,2,4]]; %6th edge (B,D)
edge(:,:,7) = [[2,3,2];[2,1,5]]; %7th edge (B,L)
edge(:,:,8) = [[2,1,2];[2,3,6]]; %8th edge (B,R)
edge(:,:,9) = [[2,1,3];[1,2,5]]; %9th edge (U,L)
edge(:,:,10) = [[2,3,3];[1,2,6]]; %10th edge (U,R)
edge(:,:,11) = [[2,1,4];[3,2,5]]; %11st edge (D,L)
edge(:,:,12) = [[2,3,4];[3,2,6]]; %12nd edge (D,R)
for i=1:12
	face1 = edge(1,3,i);
	face2 = edge(2,3,i);
	if (cube(2,2,face1) ~= cube(edge(1,1,i),edge(1,2,i),edge(1,3,i))) ...
			|| (cube(2,2,face2) ~= cube(edge(2,1,i),edge(2,2,i),edge(2,3,i)))
		Q2 = Q2 + 4;
	end
end

%for all 8 corners the difference between the facelets in corner and the center "Q3"
corner = zeros(3,3,8);
corner(:,:,1) = [[1,1,1];[3,1,3];[1,3,5]]; %1st corner (F,U,L)
corner(:,:,2) = [[1,3,1];[3,3,3];[1,1,6]]; %2nd corner (F,U,R)
corner(:,:,3) = [[3,1,1];[1,1,4];[3,3,5]]; %3rd corner (F,D,L)
corner(:,:,4) = [[3,3,1];[1,3,4];[3,1,6]]; %4th corner (F,D,R)
corner(:,:,5) = [[1,3,2];[1,1,3];[1,1,5]]; %5th corner (B,U,L)
corner(:,:,6) = [[1,1,2];[1,3,3];[1,3,6]]; %6th corner (B,U,R)
corner(:,:,7) = [[3,3,2];[3,1,4];[3,1,5]]; %7th corner (B,D,L)
corner(:,:,8) = [[3,1,2];[3,3,4];[3,3,6]]; %8th corner (B,D,R)
for i=1:8
    face1 = corner(1,3,i);
	face2 = corner(2,3,i);
	face3 = corner(3,3,i);
    if (cube(2,2,face1) ~= cube(corner(1,1,i),corner(1,2,i),corner(1,3,i))) ...
            || (cube(2,2,face2) ~= cube(corner(2,1,i),corner(2,2,i),corner(2,3,i))) ...
            || (cube(2,2,face3) ~= cube(corner(3,1,i),corner(3,2,i),corner(3,3,i)))
        Q3 = Q3 + 6;
    end
end

%fitness is its sum
f = Q1 + Q2 + Q3;