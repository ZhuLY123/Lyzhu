clear;
clc;
%����������ģ��
%       theta    d        a        alpha     offset
L1=Link([0       89.459   0        pi/2      0     ]); %�������˵�D-H����
L2=Link([0       0      -425       0         0     ]);
L3=Link([0       0      -392.25    0         0     ]);
L4=Link([0       109.15    0       pi/2      0     ]);
L5=Link([0       94.65     0       -pi/2      0     ]);
L6=Link([0       82.3      0        0         0     ]);
robot=SerialLink([L1 L2 L3 L4 L5 L6],'name','UR-5'); %�������ˣ�������ȡ��UR-5
theta=[pi/6,pi/6,pi/6,pi/6,0,0];%ָ���Ĺؽڽ�
p=robot.fkine(theta)%fkine���⺯�����������Ǹ����Ĺؽڽ�theta������ĩ��λ��p
q=robot.ikine(p)%ikine��⺯�����������Ǹ�����ĩ��λ��p�������ؽڽ�q
robot.display;
robot.plot(theta);