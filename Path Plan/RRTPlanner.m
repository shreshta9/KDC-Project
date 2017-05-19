%%initial conditions
start=[1,1,1];
goal=[100,100,100];
maxdist=10;
maxsamples=4;
iter=1000;
cx=60; cy=60; cz=60;
c=[cx, cy, cz];
rad=20;

% %draw the obstacle
% [xsph,ysph,zsph] = sphere(30);
% surf(xsph*rad+cx, ysph*rad+cy, zsph*rad+cz)
% hold on

%%plotting initial and final positions
plot3(start(1),start(2),start(3),'X','Color','green');
hold on
plot3(goal(1),goal(2),goal(3),'O','Color','green');
hold on

%%start the RRT Planner
init_node=start;
drawBot(init_node);
for i=1:1:iter 
rvals=2*rand(maxsamples,1)-1;
elevation=asin(rvals);
azimuth=2*pi*rand(maxsamples,1);
radii=maxdist*(rand(maxsamples,1).^(1/3));
[xdist,ydist,zdist]=sph2cart(azimuth,elevation,radii);
nodes_x=init_node(1)+xdist;
nodes_y=init_node(2)+ydist;
nodes_z=init_node(3)+zdist;
plot3(nodes_x,nodes_y,nodes_z,'.');
hold on
nodes=[nodes_x,nodes_y,nodes_z];
%% for a 2D RRT
% t=2*pi*rand(4,1);
% r=maxdist*sqrt(rand(4,1));
% nodes_x=init_node(1)+r.*cos(t);
% nodes_y=init_node(2)+r.*sin(t);
% scatter(nodes_x,nodes_y,nodes_z,'.');

for j=1:1:maxsamples
%   if obst(c,rad,init_node,nodes(j,:))==0
%       break;
%   else 
  x=[init_node(1) nodes(j,1)];
  y=[init_node(2) nodes(j,2)];
  z=[init_node(3) nodes(j,3)];
  hold on
  line(x,y,z);
  hold on
  heur(j)=distance(init_node,nodes(j,:))+distance(goal,nodes(j,:));
%   end
end
  bestheur=min(heur);
  k=find(heur==bestheur);
  bestpathx=[init_node(1) nodes(k,1)];
  bestpathy=[init_node(2) nodes(k,2)];
  bestpathz=[init_node(3) nodes(k,3)];
  line(bestpathx,bestpathy,bestpathz,'Color','red');
  hold on
  init_node=nodes(k,:);
  if (distance(init_node,goal)<=maxdist)
      iter=i;
      x2=[init_node(1) goal(1)];
      y2=[init_node(2) goal(2)];
      z2=[init_node(3) goal(3)];
      drawBot(init_node);
      hold on
      line(x2,y2,z2,'Color','red'); 
      break;
  end
  if (i==iter)
      x1=[init_node(1) goal(1)];
      y1=[init_node(2) goal(2)];
      z1=[init_node(3) goal(3)];
      drawBot(init_node);
      hold on
      line(x1,y1,z1,'Color','red');
  end
  drawBot(init_node);
  drawBot(goal);
end
   
    
    
