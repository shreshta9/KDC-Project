n=100;
nodes_x=rand(1,n);
nodes_y=rand(1,n);
scatter(nodes_x, nodes_y,'.');
hold on
scatter(nodes_x(1), nodes_y(1),'X');
scatter(nodes_x(n), nodes_y(n),'O');
hold on
nodes=[nodes_x',nodes_y'];
distance=zeros(1,n);
nn=[];
curr=[];

%Draw the Tree
for i=1:1:n
    dist=[];
    k=1;
    curr=[nodes(i,1) nodes(i,2)];
    while k<=(n-i)
     for j=i+1:1:n
    dist(1,k)=sqrt((nodes(i,1)-nodes(j,1))^2 + (nodes(i,2)-nodes(j,2))^2);
    fprintf('Distance Calculations for node(%d-%d) = %f \n',i,j,dist(1,k));
    k=k+1;
    d=min(dist);
    end
    fprintf('Minimum Distance for node (%d) = %f\n',i,d);
    for j=i+1:1:n
        if(d==sqrt((nodes(i,1)-nodes(j,1))^2 + (nodes(i,2)-nodes(j,2))^2))
            nn=[nodes(j,1) nodes(j,2)];
        end
    end
    x=[curr(1,1) nn(1,1)];
    y=[curr(1,2) nn(1,2)];
    line(x,y);
    hold on
    end
end
hold off

%Get the optimum path
