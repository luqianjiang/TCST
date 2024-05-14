load position.mat
load angle.mat


subplot(2,1,1)
figure(1);
t=1:425;
plot(t*25/1000,position(300:724,:),'color',[1.00 0.00 0.00],'linewidth',3)
l1=legend('Cart position (m)');
set(gca,'FontName','宋体','FontSize',20);
xlabel('Time (s)','FontName','宋体','FontSize',20);
ylabel('Cart position (m)','FontName','宋体','FontSize',20);
xlabel('Time (s)')
ylabel('Cart position (m)')
set(gca,'xtick',0:1:13)
set(gca,'ytick',-0.3:0.1:0.3)
axis([0 13,-0.3,0.3])

subplot(2,1,2)
t=1:425;
plot(t*25/1000,angle(300:724,:)/1.1,'color',[0.00 1.00 0.00],'linewidth',3)
l1=legend('Pendulum angle(rad)');
set(gca,'FontName','宋体','FontSize',20);
xlabel('Time (s)','FontName','宋体','FontSize',20);
ylabel('Pendulum angle (rad)','FontName','宋体','FontSize',20);
xlabel('Time (s)')
ylabel('Pendulum angle (rad)')
a=t*25/1000;
set(gca,'xtick',0:1:13)
set(gca,'ytick',-0.4:0.2:0.4)
axis([0 13,-0.5,0.5])