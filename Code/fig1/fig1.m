load cut_1.mat
load cut_1_1.mat
load cut_2.mat
load cut_4.mat
load cut_4_1.mat
load cut_4_2.mat

load position_1.mat
load position_1_1.mat
load position_2.mat
load position_4.mat
load position_4_1.mat
load position_4_2.mat



subplot(2,1,1)
figure(1);
t1=1:59;
plot(t1*25/1000,cut_1,'-','color',[1.00 0.00 0.00],'linewidth',3)
hold on
t2=1:35;
plot(t2*25/1000,cut_1_1,'--','color',[0.00 1.00 0.00],'linewidth',3)
hold on
t3=1:32;
plot(t3*25/1000,cut_4_1,'-.','color',[0.00 0.00 1.00],'linewidth',3)
hold on
t4=1:40;
plot(t4*25/1000,cut_2(1:40,:),'-','color',[0.00 0.00 0.00],'linewidth',3)
set(gca, 'LineWidth',1)
set(gca,'FontName','Times New Roman','FontSize',24);
xlabel('Time (s)','FontName','Times New Roman','FontSize',24);
ylabel('Cart position (m)','FontName','Times New Roman','FontSize',24);
xlabel('Time (s)')
ylabel('Cart position (m)')
a=t1*25/1000;
set(gca,'xtick',0:1:13)
set(gca,'ytick',-0.1:0.1:0.1)
axis([0 1.5,-0.1,0.10001])

subplot(2,1,2)
t1=1:59;
plot(t1*25/1000,position_1*2,'-','color',[1.00 0.00 0.00],'linewidth',3)
hold on
t2=1:35;
plot(t2*25/1000,position_1_1,'--','color',[0.00 1.00 0.00],'linewidth',3)
hold on
t3=1:32;
plot(t3*25/1000,position_4_1,'-.','color',[0.00 0.00 1.00],'linewidth',3)
hold on
t4=1:40;
plot(t4*25/1000,position_2(1:40,:),'-','color',[0.00 0.00 0.00],'linewidth',3)
set(gca, 'LineWidth',1)
set(gca,'FontName','Times New Roman','FontSize',24);
xlabel('Time (s)','FontName','Times New Roman','FontSize',24);
ylabel('Pendulum angle (rad)','FontName','Times New Roman','FontSize',24);
xlabel('Time (s)')
ylabel('Pendulum angle (rad)')
a=t1*25/1000;
set(gca,'xtick',0:1:13)
set(gca,'ytick',-0.1:0.1:0.1)
axis([0 1.5,-0.1,0.13])



