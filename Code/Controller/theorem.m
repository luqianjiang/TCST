clc
clear all

%% 系统参数
A=[0 0 1 0;
   0 0 0 1;
   0 0 0 0;
   0 29.4 0 0];
B=[0;0;1;3];
D=eye(4);
E=[0.4 0 0 0;
   0 0.82 0 0;
   0 0 0 0;
   0 0 0 0];
%% 第三章时延设置
d1=0.026;
d2=0.054;%d2=0.062; 
tao=0.005;%tao=0.012;
d3=d2+tao;
d12=d2-d1;
d13=d3-d1;
u1=0.9;   % 时延d(t)的变化率
u2=0.1;   % 时延t(t)的变化率


%% 其他相关参数设置
e1=0.01;
e2=0.75;
e3=1.2;
e4=0.022;

Q=[0.01 0 0 0;
   0 0.05 0 0;
   0 0 0.01 0;
   0 0 0 0.01];
R=0.01;

%% 初始化LMI
    setlmis([]);
%% 定义变量
    X=lmivar(1,[4,1]);
    Q1=lmivar(1,[4,1]);
    Q2=lmivar(1,[4,1]);
    Q3=lmivar(1,[4,1]);
    Q4=lmivar(1,[4,1]);
    Q5=lmivar(1,[4,1]);
    Q6=lmivar(1,[4,1]);
    Q7=lmivar(1,[4,1]);
    Z1=lmivar(1,[4,1]);
    Z2=lmivar(1,[4,1]);
    Z3=lmivar(1,[4,1]);
    Z4=lmivar(1,[4,1]);
    Lambda=lmivar(1,[1,1]);
    Y=lmivar(2,[1,4]);

%% 添加项
% 添加线性矩阵不等式
%     lmiterm([1 1 14 X],1,1);
%     lmiterm([1 1 15 -Y],1,1);
%     lmiterm([1 14 14 0],-Q);
%     lmiterm([1 15 15 0],-R);

    lmiterm([1 1 1 X],A,1,'s');
    lmiterm([1 1 1 Q1],1,1);
    lmiterm([1 1 1 Q2],1,1);
    lmiterm([1 1 1 Q3],1,1);
    lmiterm([1 1 1 Q4],1,1);
    lmiterm([1 1 1 Q5],1,1);
    lmiterm([1 1 1 Q6],1,1);
    lmiterm([1 1 1 Q7],1,1);
    lmiterm([1 1 1 Z1],-1,1);
    lmiterm([1 1 1 Z3],-1,1);
    lmiterm([1 1 1 Lambda],1,D*D');
    lmiterm([1 1 2 Z1],1,1);
    lmiterm([1 1 5 Z3],1,1);
    lmiterm([1 1 7 Y],B,1);
    lmiterm([1 1 9 X],d1,A');
    lmiterm([1 1 9 Lambda],1,d1*D*D');
    lmiterm([1 1 10 X],d12,A');
    lmiterm([1 1 10 Lambda],1,d12*D*D');
    lmiterm([1 1 11 X],tao,A');
    lmiterm([1 1 11 Lambda],1,tao*D*D');
    lmiterm([1 1 12 X],d13,A');
    lmiterm([1 1 12 Lambda],1,d13*D*D');
    lmiterm([1 1 13 X],1,E');

    lmiterm([1 2 2 Q1],-1,1);
    lmiterm([1 2 2 Z1],-1,1);
    lmiterm([1 2 2 Z2],-1,1);
    lmiterm([1 2 2 Z4],-1,1);
    lmiterm([1 2 3 Z2],1,1);
    lmiterm([1 2 7 Z4],1,1);

    lmiterm([1 3 3 Q2],-(1-u1),1);
    lmiterm([1 3 3 Z2],-2,1);
    lmiterm([1 3 4 Z2],1,1);

    lmiterm([1 4 4 Q3],-1,1);
    lmiterm([1 4 4 Z2],-1,1);

    lmiterm([1 5 5 Q4],-(1-u2),1);
    lmiterm([1 5 5 Z3],-2,1);
    lmiterm([1 5 6 Z3],1,1);

    lmiterm([1 6 6 Q5],-1,1);
    lmiterm([1 6 6 Z3],-1,1);

    lmiterm([1 7 7 Z4],-2,1);
    lmiterm([1 7 8 Z4],1,1);
    lmiterm([1 7 9 -Y],d1,B');
    lmiterm([1 7 10 -Y],d12,B');
    lmiterm([1 7 11 -Y],tao,B');
    lmiterm([1 7 12 -Y],d13,B');

    lmiterm([1 8 8 Q7],-1,1);
    lmiterm([1 8 8 Z4],-1,1);


    lmiterm([1 9 9 X],-2*e1,1);
    lmiterm([1 9 9 Z1],e1*e1,1);
    lmiterm([1 9 9 Lambda],1,d1*d1*D*D');
    lmiterm([1 9 10 Lambda],1,d1*d12*D*D');
    lmiterm([1 9 11 Lambda],1,d1*tao*D*D');
    lmiterm([1 9 12 Lambda],1,d1*d13*D*D');

    lmiterm([1 10 10 X],-2*e2,1);
    lmiterm([1 10 10 Z2],e2*e2,1);
    lmiterm([1 10 10 Lambda],1,d12*d12*D*D');
    lmiterm([1 10 11 Lambda],1,d12*tao*D*D');
    lmiterm([1 10 12 Lambda],1,d12*d13*D*D');

    lmiterm([1 11 11 X],-2*e3,1);
    lmiterm([1 11 11 Z3],e3*e3,1);
    lmiterm([1 11 11 Lambda],1,tao*tao*D*D');
    lmiterm([1 11 12 Lambda],1,tao*d13*D*D');

    lmiterm([1 12 12 X],-2*e4,1);
    lmiterm([1 12 12 Z4],e4*e4,1);
    lmiterm([1 12 12 Lambda],1,d13*d13*D*D');

    lmiterm([1 13 13 Lambda],-1,eye(4));

% 添加正定矩阵限制
    lmiterm([-2 1 1 X],1,1);
    lmiterm([-3 1 1 Q1],1,1);
    lmiterm([-4 1 1 Q2],1,1);
    lmiterm([-5 1 1 Q3],1,1);
    lmiterm([-6 1 1 Q4],1,1);
    lmiterm([-7 1 1 Q5],1,1);
    lmiterm([-8 1 1 Q6],1,1);
    lmiterm([-9 1 1 Q7],1,1);
    lmiterm([-10 1 1 Z1],1,1);
    lmiterm([-11 1 1 Z2],1,1);
    lmiterm([-12 1 1 Z3],1,1);
    lmiterm([-13 1 1 Z4],1,1);
    lmiterm([-14 1 1 Lambda],1,1);

%% 获取LMI系统描述
lmisys=getlmis;
[tmin,xfeas] = feasp(lmisys);
tmin
Xmat=dec2mat(lmisys,xfeas,X);
Q1mat=dec2mat(lmisys,xfeas,Q1);
Q2mat=dec2mat(lmisys,xfeas,Q2);
Q3mat=dec2mat(lmisys,xfeas,Q3);
Q4mat=dec2mat(lmisys,xfeas,Q4);
Q5mat=dec2mat(lmisys,xfeas,Q5);
Q6mat=dec2mat(lmisys,xfeas,Q6);
Q7mat=dec2mat(lmisys,xfeas,Q7);
Z1mat=dec2mat(lmisys,xfeas,Z1);
Z2mat=dec2mat(lmisys,xfeas,Z2);
Z3mat=dec2mat(lmisys,xfeas,Z3);
Z4mat=dec2mat(lmisys,xfeas,Z4);
Ymat=dec2mat(lmisys,xfeas,Y);

%% 求取反馈控制率
K=Ymat*inv(Xmat)