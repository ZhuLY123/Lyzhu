%六轴机械臂工作空间计算
clc;
clear;
format short;%保留精度
%角度转换
du=pi/180;  %度
radian=180/pi; %弧度
%% 模型导入
%机械臂为六自由度机械臂
clear L;
%角度转换
du=pi/180;     %度
radian=180/pi; %弧度
%关节长度
L1=89.459; L2=425; L3=392.25; L4=109.15; L5=82.3;
L(1) = Link( 'd',L1  ,  'a',0,   'alpha',pi/2, 'offset',0   );
L(2) = Link( 'd',0   ,  'a',-L2, 'alpha',0   , 'offset',0   );
L(3) = Link( 'd',0   ,  'a',-L3, 'alpha',0   , 'offset',0   );
L(4) = Link( 'd',L4  ,  'a',0 ,  'alpha',pi/2, 'offset',0   );
L(5) = Link( 'd',94.65,  'a',0,  'alpha',-pi/2 , 'offset',0);
L(6) = Link( 'd',L5  ,  'a',0,   'alpha',0   ,  'offset',0   );
plotopt = {'noraise', 'nowrist', 'nojaxes', 'delay',0};
tool_char=[1 0 0 0;
           0 1 0 0;
           0 0 1 0;
           0 0 0 1];
six_link=SerialLink(L,'name','UR-5','tool',tool_char);
%% 求取工作空间
    %关节角限位
    q1_s=-180; q1_end=180;
    q2_s=0;    q2_end=90;
    q3_s=-90;  q3_end=90;
    q4_s=-180; q4_end=180;
    q5_s=-90;  q5_end=90;
    q6_s=0;    q6_end=360;
    %设置step
    step=10;%计算步距
    step1= (q1_end -q1_s) / step;
    step2= (q2_end -q2_s) / step;
    step3= (q3_end -q3_s) / step;
    step4= (q4_end -q4_s) / step;
    step5= (q5_end -q5_s) / step;
    step6= (q6_end -q6_s) / step;
    %计算工作空间
    tic;%tic1
    i=1;
    T = zeros(3,1);
    T_x = zeros(1,step1*step2*step3*step4*step5);
    T_y = zeros(1,step1*step2*step3*step4*step5);
    T_z = zeros(1,step1*step2*step3*step4*step5);  
    for  q1=q1_s:step:q1_end
        for  q2=q2_s:step:q2_end
              for  q3=q3_s:step:q3_end
                  for  q4=q4_s:step:q4_end
                      for q5=q5_s:step:q5_end
                              T=six_link.fkine([q1*du q2*du q3*du q4*du q5*du 0]).t;%正向运动学仿真函数
                              T_x(1,i) = T(1); 
                              T_y(1,i) = T(2); 
                              T_z(1,i) = T(3); 
                              i=i+1;

                      end

                 end

             end

        end 

    end
    disp(['循环运行时间：',num2str(toc)]); 
    t1=clock;  
%% 绘制工作空间
figure('name','六轴机械臂工作空间')
hold on
plotopt = {'noraise', 'nowrist', 'nojaxes', 'delay',0};
six_link.plot([0 0 0 0 0 0], plotopt{:});
plot3(T_x,T_y,T_z,'r.','MarkerSize',3);
disp(['绘制工作空间运行时间：',num2str(etime(clock,t1))]);  
%获取X,Y,Z空间坐标范围
Point_range=[min(T_x) max(T_x) min(T_y) max(T_y) min(T_z) max(T_z)]
hold off