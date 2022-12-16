
k = 1;
out = sim("kp_j_inv",20);
close all

figure; plot(out.err.time,out.err.data,'LineWidth',1.5);
title("Erro em pixels");
grid();
saveas(gcf,"q3_erro.png");

figure; plot(out.xyc.time,out.xyc.data(:,1),out.xyd.time,out.xyd.data(:,1),'LineWidth',1.5);
legend(["x real","x desejado"],'FontSize',12);
title("Comparação x real e desejado na tela");
grid();
saveas(gcf,"q3_comp_x.png");

figure; plot(out.xyc.time,out.xyc.data(:,2),out.xyd.time,out.xyd.data(:,2),'LineWidth',1.5);
legend(["y real","y desejado"],'FontSize',12);
title("Comparação y real e desejado na tela");
grid();
saveas(gcf,"q3_comp_y.png");

figure; plot(out.u.time,out.u.data,'LineWidth',1.5);
legend("u(t)",'FontSize',12);
title("Módulo de controle u(t)") 
grid();
saveas(gcf,"q3_mod_u.png");

figure; plot(out.xyc.data(:,1),out.xyc.data(:,2),out.xyd.data(:,1),out.xyd.data(:,2),'LineWidth',1.5);
legend(["XY real","XY desejado"],'FontSize',12);
title("Trajetórias na tela");
grid();
saveas(gcf,"q3_trajs.png");