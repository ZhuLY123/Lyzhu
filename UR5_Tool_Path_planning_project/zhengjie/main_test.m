clear;
clc;
%建立机器人模型
%          theta d       a      alpha offset
SL1 = Link([0    89.459   0     pi/2   0],'standard');
SL2 = Link([0    0        -425    0      0],'standard');
SL3 = Link([0    0        -392.25     0   0],'standard');
SL4 = Link([0    109.15  0       0     0],'standard');
SL5 = Link([0    94.65   0      pi/2   0],'standard');
SL6 = Link([0    82.3    0    -pi/2    0],'standard');
starobot = SerialLink([SL1 SL2 SL3 SL4 SL5 SL6],'name','standard');
stat06 = starobot.fkine([0,0,0,0,0,0]);%工具箱正解函数
stamyt06 = mystafkine1(0,0,0,0,0,0);%手写正解函数

