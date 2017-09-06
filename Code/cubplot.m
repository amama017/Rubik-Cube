function cubplot(R)
% Plots the cube-state.

Rbackup = R;
d = size(R,1);

%Figure Parameters
DefaultCam = [33.12 11.73 10.74];
DefaultView = [109.5,17.5];
campos = DefaultCam;
view   = DefaultView;
set(gcf,'Name','Rubik')

%Facelet Colors
map =   [255   0   0;...          %red
           0   0 255;...          %blue    
         255 165   0;...          %orange  
           0 255   0;...          %green
         255 255 255;...          %white
         255 255   0;...          %yellow
         190 190 190]/255;        %gray

%Draw cube verticies		 
S = cubcoord(d);
hold off

%Fill each facelet with its color
for i=1:6
    for j = 1:d^2
        s = S(:,:,i);
        r = R(:,:,i);
        fill3(s{j}(:,1),s{j}(:,2),s{j}(:,3),map(r(j),:))
        hold on
    end
end
axis([-1 1 -1 1 -1 1]*d/sqrt(2))
set(gca,'CameraPosition',campos,'View',view);
axis off
axis square
hold off

end

function S = cubcoord(d)
% Returns the vertex coordinates of each facelet in the cube.

S = cell(d,d,6);
faces = 'FBUDLR';

for i = 1:6                 %for all faces
    s = S(:,:,i);
    c = zeros(4,3);
    face = faces(i);
    switch face
        case 'F'
            c(:,1) = d;
            for j = 1:d^2
                s{j} = c;
                s{j}(:,2) = [0 0 1 1] + (ceil(j/d)-1);
                s{j}(:,3) = [d d-1 d-1 d] - mod(j-1,d);
                s{j} = s{j}-d/2;
            end
        case 'R'
            c(:,2) = d;
            for j = 1:d^2
                s{j} = c;
                s{j}(:,3) = [d d-1 d-1 d] - mod(j-1,d);
                s{j}(:,1) = [d d d-1 d-1] - (ceil(j/d)-1);
                s{j} = s{j}-d/2;
            end 
        case 'B'
            c(:,1) = 0;
            for j = 1:d^2
                s{j} = c;
                s{j}(:,2) = [d d d-1 d-1] - (ceil(j/d)-1);
                s{j}(:,3) = [d d-1 d-1 d] - mod(j-1,d);   
                s{j} = s{j}-d/2;
            end
        case 'L'
            c(:,2) = 0;
            for j = 1:d^2
                s{j} = c;
                s{j}(:,3) = [d d-1 d-1 d] - mod(j-1,d);
                s{j}(:,1) = [0 0 1 1] + (ceil(j/d)-1);
                s{j} = s{j}-d/2;
            end           
        case 'U'
            c(:,3) = d;
            for j = 1:d^2
                s{j} = c;
                s{j}(:,2) = [0 0 1 1] + (ceil(j/d)-1);
                s{j}(:,1) = [0 1 1 0] + mod(j-1,d);
                s{j} = s{j}-d/2;
            end
        case 'D'
            c(:,3) = 0;
            for j = 1:d^2
                s{j} = c;
                s{j}(:,2) = [0 0 1 1] + (ceil(j/d)-1);
                s{j}(:,1) = [d d-1 d-1 d] - mod(j-1,d);
                s{j} = s{j}-d/2;
            end
    end
    S(:,:,i) = s;
end

end