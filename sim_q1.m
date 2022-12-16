for i = [0,1]
    ff = i;
for j = [1,2,3]
    n = j;
    out = sim("kinctrlkinova",20);
close all

figure; plot(out.err.time,out.err.data,'LineWidth',1.5);
title("Erro (m)");
grid();
saveas(gcf,"q1_erro_n_"+ n +"_ff_"+ff+".png");

figure; plot(out.u.time,out.u.data,'LineWidth',1.5);
legend("u(t)",'FontSize',12);
title("Módulo de controle u(t)") 
grid();
saveas(gcf,"mod_u_"+ n +"_ff_"+ff+".png");

figure; plot(out.simxd.time,out.simxd.data(:,1),out.x.time,out.x.data,'LineWidth',1.5);
legend(["x desejado","x real"],'FontSize',12);
title("Comparação x");
grid();
saveas(gcf,"comp_x_n_"+ n +"_ff_"+ff+".png");

figure;plot(out.simxd.time,out.simxd.data(:,2),out.y.time,out.y.data,'LineWidth',1.5);
legend(["y desejado","y real"],'FontSize',12);
title("Comparação y ");
grid();
saveas(gcf,"comp_y_n_"+ n +"_ff_"+ff+".png");

figure;plot(out.simxd.time,out.simxd.data(:,3),out.z.time,out.z.data,'LineWidth',1.5);
legend(["z desejado","z real"],'FontSize',12);
title("Comparação z");
grid();
saveas(gcf,"comp_z_n_"+ n +"_ff_"+ff+".png");
end
end

% figure; plot(out.xyc.data(:,1),out.xyc.data(:,2),out.xyd.data(:,1),out.xyd.data(:,2),'LineWidth',1.5);
% legend(["XY real","XY desejado"],'FontSize',12);
% title("Trajetórias na tela");
% grid();
% saveas(gcf,"trajs_"+ n +"_ff_+"ff"+.pdf");