load time.mat
en_time=time(: , 1);
en_time=en_time*1000;
fps=1:2000;
fps=fps';

fps1=1:2000;
fps1=fps1';

err1= linspace(7,7,2000);
err2= linspace(4,4,2000);


histogram(en_time,4)
set(gca,'FontName','Times New Roman','FontSize',25);
xlabel('Encryption time (ms)','FontName','ËÎÌו','FontSize',25);
ylabel('image (fps)','FontName','ËÎÌו','FontSize',25);
set(gca,'ytick',0:200:1200)
axis([4 7,0 1200])

