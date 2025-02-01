clc % Limpia cmd window
close all % Cierra las figuras
clear % Limpia las variables
format shortEng % Formato de ingeniería

datos = readtable('Datos_.csv');
t = datos.tiempo;
x = datos.x; xe = datos.xe;
y = datos.y; ye = datos.ye;
z = datos.z; ze = datos.ze;

%Figuras
figure(1); set(figure(1),'color','w')
set(gcf,'units','centimeters','position',[2 2 30 20])

% Plot Biomasa X,XE v Tiempo
subplot(2,2,1)
    grid on; hold on; box on;
    plot(t,x,'-','linewidth',1.5,'color',[0 0 1])
    plot(t,xe,'--','linewidth',1.5,'color',[1 0 0]); 
    xlim([0, 100]); xticks(0:10:100)
    ylim([0, 3.2]); yticks(0:0.5:3)
    L=legend('$x(t)$','$\hat{x}(t)$','location','northeast','orientation','horizontal');
    set(L,'interpreter','latex','fontsize',14)
    xlabel('$Tiempo$ $[horas]$', 'interpreter', 'latex', 'fontsize', 16)
    ylabel('$x(t):Biomasa$ $[g/L]$', 'interpreter', 'latex', 'fontsize', 16)
    %xlabel('time [$s$]','interpreter','latex')
    %ylabel('$x(t)$','interpreter','latex')
    set(gca, 'TickLabelInterpreter', 'latex','FontSize',14)
    xtickformat('$%g$')   
    ytickformat('$%g$')   

% Plot Glucose Y,YE v Tiempo
subplot(2,2,2)
    grid on; hold on; box on;
    plot(t,y,'-','linewidth',1.5,'color',[0 0 1])
    plot(t,ye,'--','linewidth',1.5,'color',[1 0 0]); 
    xlim([0, 100]); xticks(0:10:100)
    ylim([0, 22]); yticks(0:4:22)
    L=legend('$y(t)$','$\widehat{y}(t)$','location','northeast','orientation','horizontal');
    set(L,'interpreter','latex','fontsize',14)
    xlabel('$Tiempo$ $[horas]$', 'interpreter', 'latex', 'fontsize', 16)
    ylabel('$y(t):Glucosa$ $[g/L]$', 'interpreter', 'latex', 'fontsize', 16)
    %xlabel('time [$s$]','interpreter','latex')
    %ylabel('$y(t)$','interpreter','latex')
    set(gca, 'TickLabelInterpreter', 'latex','FontSize',14)
    xtickformat('$%g$')   
    ytickformat('$%g$')  

% Plot Ethanol Z,ZE v Tiempo
subplot(2,2,3)
    grid on; hold on; box on;
    plot(t,z,'-','linewidth',1.5,'color',[0 0 1])
    plot(t,ze,'--','linewidth',1.5,'color',[1 0 0]);
    xlim([0, 100]); xticks(0:10:100)
    ylim([0, 10]); yticks(0:2:10)
    L=legend('$z(t)$','$\widehat{z}(t)$','location','northeast','orientation','horizontal');
    set(L,'interpreter','latex','fontsize',14)
    xlabel('$Tiempo$ $[horas]$', 'interpreter', 'latex', 'fontsize', 16)
    ylabel('$z(t):Etanol$ $[g/L]$', 'interpreter', 'latex', 'fontsize', 16)
    %xlabel('time [$s$]','interpreter','latex')
    %ylabel('$z(t)$','interpreter','latex')
    set(gca, 'TickLabelInterpreter', 'latex','FontSize',14)
    xtickformat('$%g$')   
    ytickformat('$%g$')

% Plot  X,Y,Z v XE,YE,ZE
subplot(2,2,4)
    grid on; hold on; box on;
    plot3(x,y,z,'-','linewidth',1.5,'color',[0 0 1])
    plot3(xe,ye,ze,'--','linewidth',1.5,'color',[1 0 0]); 
    L=legend('$(x,y,z)$','$(\widehat{x},\widehat{y},\widehat{z})$','location','northeast','orientation','horizontal');
    set(L,'interpreter','latex','fontsize',14)
    xlabel('$x(t):Biomasa$ $[g/L]$','interpreter','latex')
    ylabel('$y(t):Glucosa$ $[g/L]$','interpreter','latex')
    zlabel('$z(t):Etanol$ $[g/L]$','interpreter','latex')
    set(gca, 'TickLabelInterpreter', 'latex','FontSize',14)
    xtickformat('$%g$')   
    ytickformat('$%g$')
    ztickformat('$%g$')


figure(2); set(figure(2),'color','w')
set(gcf,'units','centimeters','position',[2 2 30 20])

% Plot Errors 
% X v XE
subplot(2,2,1)
    grid on; hold on; box on;
    plot(x,xe,'-','linewidth',1.5,'color',[0 0 1])
    xlim([0, 3.5]); xticks(0:0.5:3)
    ylim([0, 3.5]); yticks(0:0.5:3)
    L=legend('$x(t)$','$\hat{x}(t)$','location','northwest');
    set(L,'interpreter','latex','fontsize',14)
    xlabel('$x(t)$','interpreter','latex')
    ylabel('$\widehat{x}(t)$','interpreter','latex')
    set(gca, 'TickLabelInterpreter', 'latex','FontSize',16)
    xtickformat('$%g$')   
    ytickformat('$%g$')   

% Y v YE
subplot(2,2,2)
    grid on; hold on; box on;
    plot(y,ye,'-','linewidth',1.5,'color',[1 0 0])
    xlim([0, 22]); xticks(0:4:22)
    ylim([0, 22]); yticks(0:4:22)
    L=legend('$y(t)$','$\hat{y}(t)$','location','northwest');
    set(L,'interpreter','latex','fontsize',14)
    xlabel('$y(t)$','interpreter','latex')
    ylabel('$\widehat{y}(t)$','interpreter','latex')
    set(gca, 'TickLabelInterpreter', 'latex','FontSize',16)
    xtickformat('$%g$')   
    ytickformat('$%g$')  

% Z v ZE
subplot(2,2,3)
    grid on; hold on; box on;
    plot(z,ze,'-','linewidth',1.5,'color',[0 0.5 0])
    xlim([0, 10]); xticks(0:2:10)
    ylim([0, 10]); yticks(0:2:10)
    L=legend('$z(t)$','$\hat{z}(t)$','location','northwest');
    set(L,'interpreter','latex','fontsize',14)
    xlabel('$z(t)$','interpreter','latex')
    ylabel('$\widehat{z}(t)$','interpreter','latex')
    set(gca, 'TickLabelInterpreter', 'latex','FontSize',16)
    xtickformat('$%g$')   
    ytickformat('$%g$')

% Plot Error v Tiempo
subplot(2,2,4)
    grid on; hold on; box on;
    plot(t,x-xe,'-','linewidth',1.5,'color',[0 0 1])
    plot(t,y-ye,'--','linewidth',1.5,'color',[1 0 0])
    plot(t,z-ze,'-.','linewidth',1.5,'color',[0 0.5 0])
    yticks(-4:2:4)
    L2=legend('$x(t)-\widehat{x}(t)$','$y(t)-\widehat{y}(t)$','$z(t)-\widehat{z}(t)$','location','southeast');
    set(L2,'interpreter','latex','fontsize',14)
    xlabel('Tiempo [$h$]','interpreter','latex')
    ylabel('$e(t)$','interpreter','latex')
    set(gca, 'TickLabelInterpreter', 'latex','FontSize',16)
    xtickformat('$%g$')   
    ytickformat('$%g$')

% Plot Histograma
figure(3); set(figure(3),'color','w')
set(gcf,'units','centimeters','position',[2 2 30 20])

% Histograma  X v XE
subplot(1,3,1)
    grid on; hold on; box on;
    histogram(x,19,'FaceColor',[0 0 1])
    histogram(xe,19,'FaceColor',[1 0 0])
    xlabel('$x(t):Biomasa$ $[g/L]$', 'Interpreter', 'latex', 'FontSize', 14);
    ylabel('Frecuencia', 'Interpreter', 'latex', 'FontSize', 14);
    L=legend('$x(t)$','$\hat{x}(t)$','location','northeast','orientation','horizontal');
    set(L,'interpreter','latex','fontsize',14)
    set(gca,'TickLabelInterpreter','latex','FontSize',16);
    ytickformat('$%g$')

% Histograma  Y v YE
subplot(1,3,2)
    grid on; hold on; box on;
    histogram(y(t <= 15),19,'FaceColor',[0 0 1])
    histogram(ye(t <= 15),19,'FaceColor',[1 0 0])
    xlabel('$y(t):Glucosa$ $[g/L]$', 'Interpreter', 'latex', 'FontSize', 14);
    ylabel('Frecuencia', 'Interpreter', 'latex', 'FontSize', 14);
    L=legend('$y(t)$','$\hat{y}(t)$','location','northeast','orientation','horizontal');
    set(L,'interpreter','latex','fontsize',14)
    set(gca,'TickLabelInterpreter','latex','FontSize',16);
    ytickformat('$%g$')

% Histograma  Z v ZE
subplot(1,3,3)
    grid on; hold on; box on;
    histogram(z,19,'FaceColor',[0 0 1])
    histogram(ze,19,'FaceColor',[1 0 0])
    xlabel('$z(t):Etanol$ $[g/L]$', 'Interpreter', 'latex', 'FontSize', 14);
    ylabel('Frecuencia', 'Interpreter', 'latex', 'FontSize', 14);
    L=legend('$z(t)$','$\hat{z}(t)$','location','northeast','orientation','horizontal');
    set(L,'interpreter','latex','fontsize',14)
    set(gca,'TickLabelInterpreter','latex','FontSize',16);
    ytickformat('$%g$')
    
% Plot Boxplot
figure(4); set(figure(4),'color','w')
set(gcf,'units','centimeters','position',[2 2 30 20])

% Boxplot  X v XE
subplot(1,3,1)
    grid on; hold on; box on;
    boxplot([x,xe],'Labels',{'$x(t)$','$\widehat{x}(t)$'})
    ylabel('$x(t):Biomasa$ $[g/L]$', 'Interpreter', 'latex', 'FontSize', 14);
    set(gca,'TickLabelInterpreter','latex','FontSize',16);
    % xtickformat('$%g$')   
    ytickformat('$%g$')

% Boxplot  Y v YE
subplot(1,3,2)
    grid on; hold on; box on;
    boxplot([y(t <= 15),ye(t <= 15)],'Labels',{'$y(t)$','$\widehat{y}(t)$'})
    ylabel('$y(t):Glucosa$ $[g/L]$', 'Interpreter', 'latex', 'FontSize', 14);
    set(gca,'TickLabelInterpreter','latex','FontSize',16);
    % xtickformat('$%g$')   
    ytickformat('$%g$')

% Boxplot  Z v ZE
subplot(1,3,3)
    grid on; hold on; box on;
    boxplot([z,ze],'Labels',{'$z(t)$','$\widehat{z}(t)$'})
    ylabel('$z(t):Etanol$ $[g/L]$', 'Interpreter', 'latex', 'FontSize', 14);
    set(gca,'TickLabelInterpreter','latex','FontSize',16);
    % xtickformat('$%g$')   
    ytickformat('$%g$')

% Cálculo de métricas para x, y, z
metrics = @(real, pred) struct(...
    'MAE', mean(abs(real - pred)), ...
    'RMSE', sqrt(mean((real - pred).^2)), ...
    'R2', 1 - sum((real - pred).^2) / sum((real - mean(real)).^2), ...
    'TheilsU', sqrt(sum((real - pred).^2)) / (sqrt(sum(real.^2)) + sqrt(sum(pred.^2))) ...
);

metrics_x = metrics(x, xe);
metrics_y = metrics(y, ye);
metrics_z = metrics(z, ze);

% Mostrar resultados
fprintf('Métricas para x:\n');
disp(metrics_x);

fprintf('Métricas para y:\n');
disp(metrics_y);

fprintf('Métricas para z:\n');
disp(metrics_z);



