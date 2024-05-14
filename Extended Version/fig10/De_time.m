load time.mat
de_time=time(: , 2);
de_time=de_time*1000;
fps=1:2000;
fps=fps';

fps1=1:2000;
fps1=fps1';

err1= linspace(7,7,2000);
err2= linspace(4,4,2000);

histogram(de_time,4)
set(gca,'FontName','Times New Roman','FontSize',25);
xlabel('Decryption time (ms)','FontName','ËÎÌו','FontSize',25);
ylabel('image (fps)','FontName','ËÎÌו','FontSize',25);
set(gca,'ytick',0:500:2000)
axis([4 7,0 2000])



