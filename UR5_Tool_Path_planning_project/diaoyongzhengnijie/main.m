clear;
clc;
%建立机器人模型
%       theta    d        a        alpha     offset
L1=Link([0       89.459   0        pi/2      0     ]); %定义连杆的D-H参数
L2=Link([0       0      -425       0         0     ]);
L3=Link([0       0      -392.25    0         0     ]);
L4=Link([0       109.15    0       pi/2      0     ]);
L5=Link([0       94.65     0       -pi/2      0     ]);
L6=Link([0       82.3      0        0         0     ]);
robot=SerialLink([L1 L2 L3 L4 L5 L6],'name','UR-5'); %连接连杆，机器人取名UR-5
theta=[pi/6,pi/6,pi/6,pi/6,0,0];%指定的关节角
p=robot.fkine(theta)%fkine正解函数，根据我们给定的关节角theta，求解出末端位姿p
q=robot.ikine(p)%ikine逆解函数，根据我们给定的末端位姿p，求解出关节角q
robot.display;
robot.plot(theta);