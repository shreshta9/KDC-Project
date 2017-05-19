function obstacle=obst(c, rad, node1, node2)
midpoint=(node1+node2)/2;
dist1=sqrt(rad^2+(distance(midpoint,node1))^2);
dist2=distance(c,node1);
if (dist2>dist1)
    obstacle=1;
else
    obstacle=0;
end
end