clear;
clc;
L1 = Link('d', 89.459, 'a', 0, 'alpha', pi/2);%Link 类函数
L2 = Link('d', 0, 'a', -425, 'alpha', 0);
L3 = Link('d', 0, 'a', -392.25, 'alpha', 0);
L4 = Link('d', 109.15, 'a', 0, 'alpha', pi/2);
L5 = Link('d', 94.65, 'a', 0, 'alpha', -pi/2);
L6 = Link('d', 82.3, 'a', 0, 'alpha', 0);
robot=SerialLink([L1,L2,L3,L4,L5,L6]);   %SerialLink 类函数
robot.name = 'UR-5 robot';
robot.teach();
robot.display();  %Link 类函数
theta=[0 0 0 0 0 0];
robot.plot(theta);   %SerialLink 类函数
