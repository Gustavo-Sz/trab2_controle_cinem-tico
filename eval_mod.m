
wn = 2*pi/10;
last = 0;
syms ki
k = [1 1;1 1;1 1]; % Linhas : trajetorias, Colunas: Controle (1: com feedforward, 2: sem feedforward).

for ctrl = [0.0 1.0]
    ff = ctrl
    repeat = true;
    last = 0;
    for i = 1:3
        n = i;
        repeat = true;
        while repeat
            last = 0;
            fprintf("Primeira simulação com ff="+ ff+" e n ="+ n +"\n");
            out = sim("kinctrlkinova", 3);
            mod = [1:size(out.x.time,1)];
            l = 1;
            for t = out.jinv.time(:).'
                switch n
                    case 1
                        mod(l) = max(abs(out.jinv.data(:,:,l)*(ff*[wn*0.1*sin(wn*t);0 ;wn*0.1*cos(wn*t) ] + k(n,ff+1)*out.err.data(l,:)')));
                    case 2 
                        mod(l) = max(abs(out.jinv.data(:,:,l)*(ff*[ -wn*0.1*sin(wn*t);-wn*0.1*sin(wn*t)+wn*0.1*cos(wn*t);wn*0.1*cos(wn*t)] + k(n,ff+1)*out.err.data(l,:)')));
                    case 3 
                        mod(l) = max(abs(out.jinv.data(:,:,l)*(ff*[0.08*(wn*cos(wn*t)+4*wn*cos(4*wn*t));0;0.08*(-wn*sin(wn*t)-4*wn*sin(4*wn*t))] + k(n,ff+1)*out.err.data(l,:)')));   
                end
                if mod(l) > last
                   t_max = t;
                   l_max = l;
                   last = mod(l);
                end
               l = l+1;
            end
            switch n
                case 1
                   [~,j] = max(abs(out.jinv.data(:,:,l_max)*(ff*[-wn*0.1*sin(wn*t_max);0 ;wn*0.1*cos(wn*t_max)] + k(n,ff+1)*out.err.data(l_max,:)')));
                    k_opt = solve(abs(out.jinv.data(j,:,l_max)*(ff*[-wn*0.1*sin(wn*t_max);0 ;wn*0.1*cos(wn*t_max)]+ki*out.err.data(l_max,:)'))==3);
                case 2
                   [~,j] =max(abs(out.jinv.data(:,:,l_max)*(ff*[ -wn*0.1*sin(wn*t_max);-wn*0.1*sin(wn*t_max)+wn*0.1*cos(wn*t_max);wn*0.1*cos(wn*t_max)] + k(n,ff+1)*out.err.data(l_max,:)')));
                    k_opt = solve(abs(out.jinv.data(j,:,l_max)*(ff*[ -wn*0.1*sin(wn*t_max);-wn*0.1*sin(wn*t_max)+wn*0.1*cos(wn*t_max);wn*0.1*cos(wn*t_max)]+ki*out.err.data(l_max,:)'))==3);
                case 3
                    [~,j] = max(abs(out.jinv.data(:,:,l_max)*(ff*[0.08*(wn*cos(wn*t_max)+4*wn*cos(4*wn*t_max));0;0.08*(-wn*sin(wn*t_max)-4*wn*sin(4*wn*t_max))] + k(n,ff+1)*out.err.data(l_max,:)')));
                    k_opt = solve(abs(out.jinv.data(j,:,l_max)*(ff*[0.08*(wn*cos(wn*t_max)+4*wn*cos(4*wn*t_max));0;0.08*(-wn*sin(wn*t_max)-4*wn*sin(4*wn*t_max))]+ki*out.err.data(l_max,:)'))==3);
            end

            k(n,ff+1) = round(k_opt,8);
            fprintf("Maior valor 1a. sim ="+ mod(l_max)+", melhor k = "+ k(n,ff+1)+".\n");
            % segunda rodada, verificar se surgiu outro ponto ponto com velocidade maior que 3
            last = 3.0;
            
            fprintf("segunda simulação\n");
            out = sim("kinctrlkinova", 3);
            mod = [1:size(out.x.time,1)];
            l = 1;
            repeat = false;
            for t = out.jinv.time(:).'
                switch n
                    case 1
                        mod(l) = max(abs(out.jinv.data(:,:,l)*(ff*[wn*0.1*sin(wn*t);0 ;wn*0.1*cos(wn*t) ] + k(n,ff+1)*out.err.data(l,:)')));
                    case 2 
                        mod(l) = max(abs(out.jinv.data(:,:,l)*(ff*[ -wn*0.1*sin(wn*t);-wn*0.1*sin(wn*t)+wn*0.1*cos(wn*t);wn*0.1*cos(wn*t)] + k(n,ff+1)*out.err.data(l,:)')));
                    case 3 
                        mod(l) = max(abs(out.jinv.data(:,:,l)*(ff*[0.08*(wn*cos(wn*t)+4*wn*cos(4*wn*t));0;0.08*(-wn*sin(wn*t)-4*wn*sin(4*wn*t))] + k(n,ff+1)*out.err.data(l,:)')));  
                end
                
                if round(mod(l),8) > last
                   fprintf("Novo ponto acima de "+ last+" : "+ mod(l)+" (indice: "+ l + ")\n")
                   repeat = true;
                end
               l = l+1;
            end

        end
    end
end
    