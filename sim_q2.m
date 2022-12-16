k2=1;
k3=1;

out = sim("nullspace_kinctrlkinova",20);
close all

figure; plot(out.err.time,out.err.data,'LineWidth',1.5);
title("Erro (m)");
grid();
saveas(gcf,"q2_erro.png");

figure; plot(out.x.time,out.x.data,out.y.time,out.y.data,out.z.time,out.z.data,'LineWidth',1.5);
legend(["x","y","z"],'FontSize',12);
title("Posição do efetuador") 
grid();
saveas(gcf,"q2_pos.png");

figure; plot(out.u.time,out.u.data,'LineWidth',1.5);
title("Módulo de controle u(t) ((J(\theta))^+ K(x_d - x))",'Interpreter','tex') 
grid();
saveas(gcf,"q2_mod_u_1.png");

figure; plot(out.taus.time,out.taus.data,'LineWidth',1.5);
legend(["{\tau_1}","{\tau_2}","{\tau_3}","{\tau_4}","{\tau_5}","{\tau_6}","{\tau_7}"],'FontSize',12);
title("Módulo dos torques nas juntas") 
grid();
saveas(gcf,"q2_taus.png");

figure; plot(out.u2.time,out.u2.data,'LineWidth',1.5);
title("Módulo de controle u(t) (J^# u )",'Interpreter','tex') 
grid();
saveas(gcf,"q2_mod_u_2.png");

figure; plot(out.qs.time,out.qs.data,'LineWidth',1.5);
legend(["{\theta_1}","{\theta_2}","{\theta_3}","{\theta_4}","{\theta_5}","{\theta_6}","{\theta_7}"],'FontSize',12);
title("Valores dos ângulos das juntas \theta(t)",'Interpreter','tex') 
grid();
saveas(gcf,"q2_thetas.png");
