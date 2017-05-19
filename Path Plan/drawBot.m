function drawBot(pose)
% %for l1
% Xa=[pose(1)-6 pose(1)];
% Ya=[pose(2)-3*sqrt(10) pose(2)+6*sqrt(10)];
% Za=[pose(3) pose(3)];
% % line(Xa,Ya,Za,'Color','y');
% hold on
% %for l2
% Xb=[pose(1) pose(1)+6];
% Yb=[pose(2)+6*sqrt(10) pose(2)-3*sqrt(10)];
% Zb=[pose(3) pose(3)];
% % line(Xb,Yb,Zb,'Color','y');
% hold on
% %for l3
% Xc=[pose(1)+6 pose(1)-6];
% Yc=[pose(2)-3*sqrt(10) pose(2)-3*sqrt(10)];
% Zc=[pose(3) pose(3)];
% % line(Xc,Yc,Zc,'Color','y');
% fill3(Xa,Ya,Za,'r',Xb,Yb,Zb,'y',Xc,Yc,Zc,'y');
% hold on
t = (1/9:1/3:1)'*2*pi;
x = pose(1)+3*cos(t);
y = pose(2)+3*sin(t);
z = pose(3)+3*t*0;
fill3(x,y,z,'y')
end