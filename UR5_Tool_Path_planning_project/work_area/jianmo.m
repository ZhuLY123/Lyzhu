
%机械臂为六自由度机械臂

clear L;

%角度转换

du=pi/180;     %度

radian=180/pi; %弧度
 
%关节长度

L1=89.459; L2=425; L3=392.25; L4=109.15; L5=82.3;


%% 字符串法建立模型,

q0=0;L0=0;%过渡关节

% hand = 'Rz(q1).Tz(L1).Ry(q2).Tz(L2).Ry(q3).Tz(L3).Rx(q4).Tx(L4).Ry(q5).Rz(q6).Tz(L5)';

% dhand = DHFactor(hand)

% six_hand =eval(dhand.command('hand'));

% plotopt = {'noraise', 'nowrist', 'nojaxes', 'delay',0};

% tool_dh=[1 0 0 0;

%          0 1 0 0;

%          0 0 1 0;

%          0 0 0 1];

% six_link=SerialLink(six_hand,'name','six hand','tool',tool_dh)

%% DH法建立模型,关节角，连杆偏移，连杆长度，连杆扭转角，关节类型（0转动，1移动）

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

 

%显示机械臂

figure(1)

hold on 

six_link.plot([0 0 0 0 0 0], plotopt{:});

hold off
