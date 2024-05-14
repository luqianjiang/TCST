load position_01.mat
load angle_01.mat
load position_06.mat
load angle_06.mat
load K1_Encrypt_position_01.mat
load K1_Encrypt_angle_01.mat
load K1_Encrypt_position_02.mat
load K1_Encrypt_angle_02.mat
load K1_Encrypt_position_04.mat
load K1_Encrypt_angle_04.mat
load K1_Encrypt_position_05.mat
load K1_Encrypt_angle_05.mat
load K1_Encrypt_position_05_2.mat
load K1_Encrypt_angle_05_2.mat

load K1_Encrypt_speed_01.mat
load K1_Encrypt_angle_speed_01.mat
load K1_Encrypt_speed_02.mat
load K1_Encrypt_angle_speed_02.mat
load K1_Encrypt_speed_04.mat
load K1_Encrypt_angle_speed_04.mat
load K1_Encrypt_speed_05_2.mat
load K1_Encrypt_angle_speed_05_2.mat

K1_Encrypt_position_05_2(189)=K1_Encrypt_position_05_2(189)*2;

figure(1);
a=position_01(100:1083,:);
b=mean(a(:));
c=a-b;
t1=1:984;
plot(t1*25/1000,c,'-','color',[1.00 0.00 0.00],'linewidth',3)
hold on
t2=1:1151;
plot(t2*25/1000,K1_Encrypt_position_02,'--','color',[0.00 0.00 0.00],'linewidth',3)
hold on
t4=1:675;
plot(t4*25/1000,K1_Encrypt_position_04,':','color',[0.00 1.00 0.00],'linewidth',3)
hold on
t5=1:189;
plot(t5*25/1000,K1_Encrypt_position_05_2,'-','color',[0 0 1],'linewidth',3)
hold on
t6=1:105;
d=position_06;
e=mean(d(:));
f=d-e;
plot(t6*25/1000,f,'--','color',[0.63 0.13 0.94],'linewidth',3)
set(gca, 'LineWidth',1)
set(gca,'FontName','Times New Roman','FontSize',24);
xlabel('Time (s)','FontName','Times New Roman','FontSize',24);
ylabel('Cart position (m)','FontName','Times New Roman','FontSize',24);
xlabel('Time (s)')
ylabel('Cart position (m)')
a=t1*25/1000;
set(gca,'xtick',0:1:a(end)+1)
set(gca,'ytick',-0.3:0.1:0.3)
axis([0 13,-0.3,0.30001])

figure(2);
t1=1:984;
plot(t1*25/1000,K1_Encrypt_angle_01/2,'-','color',[1.00 0.00 0.00],'linewidth',3)
hold on
t2=1:1151;
plot(t2*25/1000,K1_Encrypt_angle_02,'--','color',[0.00 0.00 0.00],'linewidth',3)
hold on
t4=1:675;
plot(t4*25/1000,K1_Encrypt_angle_04,':','color',[0.00 1.00 0.00],'linewidth',3)
hold on
t5=1:189;
plot(t5*25/1000,K1_Encrypt_angle_05_2,'-','color',[0 0 1],'linewidth',3)
hold on
t6=1:96;
plot(t6*25/1000,angle_06(10:105,:),'--','color',[0.63 0.13 0.94],'linewidth',3)
set(gca, 'LineWidth',1)
set(gca,'FontName','Times New Roman','FontSize',24);
xlabel('Time (s)','FontName','Times New Roman','FontSize',24);
ylabel('Pendulum angle (rad)','FontName','Times New Roman','FontSize',24);
a=t1*25/1000;
set(gca,'xtick',0:1:a(end)+1)
set(gca,'ytick',-0.4:0.2:0.4)
axis([0 13,-0.5,0.4])

