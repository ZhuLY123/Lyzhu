function [ T06 ] = mystafkine( theta1, theta2, theta3, theta4, theta5, theta6 )
%UNTITLED3 此处显示有关此函数的摘要
%   此处显示详细说明

SDH=[theta1   89.459        0        pi/2;
     theta2   0             -425     0;
     theta3   0             -392.25  0;
     theta4   109.15        0        0;
     theta5   94.65         0       pi/2;
     theta6   82.3          0       -pi/2];
 %          theta d       a    alpha offset
SL1 = Link([0    89.459   0     pi/2   0],'standard');
SL2 = Link([0    0      -425    0      0],'standard');
SL3 = Link([0    0      -392.25    0   0],'standard');
SL4 = Link([0    109.15  0       0     0],'standard');
SL5 = Link([0    94.65   0      pi/2   0],'standard');
SL6 = Link([0    82.3    0    -pi/2    0],'standard');
 T01=[cos(SDH(1,1))   0                             sin(SDH(1,1))                  0;
      sin(SDH(1,1))   0                             -cos(SDH(1,1))                 0;
      0               1                             0                              SDH(1,2);
      0               0                             0                              1];
  
 T12=[cos(SDH(2,1))   -sin(SDH(2,1))                0                              SDH(2,3)*cos(SDH(2,1));
      sin(SDH(2,1))   cos(SDH(2,1))                 1                              SDH(2,3)*sin(SDH(2,1));
      0               0                             1                              0;
      0               0                             0                              1];
  
 T23=[cos(SDH(3,1))   -sin(SDH(3,1))                0                              SDH(3,3)*cos(SDH(3,1));
      sin(SDH(3,1))   cos(SDH(3,1))                 0                              SDH(3,3)*sin(SDH(3,1));
      0               0                             1                              0;
      0               0                             0                              1];
  
 T34=[cos(SDH(4,1))   0                            sin(SDH(4,1))                   0;
      sin(SDH(4,1))   0                            -cos(SDH(4,1))                  0;
      0               1                             0                              SDH(4,2);
      0               0                             0                              1];
  
 T45=[cos(SDH(5,1))   0                            -sin(SDH(5,1))                  0;
      sin(SDH(5,1))   0                            cos(SDH(5,1))                   0;
      0               -1                            0                              SDH(5,2);
      0               0                             0                              1];
  
 T56=[cos(SDH(6,1))  -sin(SDH(6,1))                 0                              0;
      sin(SDH(6,1))   cos(SDH(6,1))                 0                              0;
      0               0                             1                              SDH(6,2);
      0               0                             0                              1];
  

 T06=T01*T12*T23*T34*T45*T56;


end

