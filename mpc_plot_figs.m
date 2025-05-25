X2sp = 32; ylimX2 = [24 38]; ylimF2 = [44 60];
%X2sp = 28; ylimX2 = [24 32]; ylimF2 = [44 60];
%X2sp = 18; ylimX2 = [16 26]; ylimF2 = [39 55];

colloc_pts = [0, 0.155051, 0.644949, 1, 1.155051, 1.644949, ...
              2, 2.155051, 2.644949, 3, 3.155051, 3.644949, ...
              4, 4.155051, 4.644949, 5, 5.155051, 5.644949, ...
              6, 6.155051, 6.644949, 7, 7.155051, 7.644949, ...
              8, 8.155051, 8.644949, 9, 9.155051, 9.644949, 10];

cva_file = fileread(sprintf('cva_SPT%d_p10_out.json', X2sp));
cva_data = jsondecode(cva_file);

mkcva_file = fileread(sprintf('mkcva_SPT%d_p10_out.json', X2sp));
mkcva_data = jsondecode(mkcva_file);

lstm_file = fileread(sprintf('lstm_SPT%d_p10_out.json', X2sp));
lstm_data = jsondecode(lstm_file);

str = {'(a) CVA', '(b) MKCVA', '(c) LSTM'};
all_data = {cva_data, mkcva_data, lstm_data};
dark_g = [0.3216, 0.6549, 0.2118];
close all;
t = 0:30;

clf; f = figure(1);
tiledlayout(6, 3, 'TileSpacing', 'compact', ...
        'TileIndexing','columnmajor');
set(gcf, 'Color', 'w');
fontsize(f, 8, 'points')

ctr = 1;

for k = 1:3 % Iterate on each model

    for j = [5, 11, 21] % Iterate on each horizon

        mdl_ipopt = (reshape(all_data{k}.ipopt_save(j, :), 3, [])'-0.5)...
                    .*[100, 100, 20] + [208, 194.7, 50];
        mdl_save = reshape(all_data{k}.mdl_save(j, :), 3, []);

        nexttile;
        fill([j-1, j-1, j+9, j+9], [15 50 50 15], 'k', ...
            'FaceAlpha', 0.05, 'LineStyle','none', ...
            'DisplayName', 'Prediction Horizon'); 
        hold on;
        plot(t([1 end]), [1 1]*X2sp,'r--', 'DisplayName','Setpoint');
        plot(colloc_pts+j-1, all_data{k}.dae_save(:, 3, j),'s-', ...
            'MarkerSize',2,'MarkerFaceColor',dark_g,'Color',dark_g,...
            'LineWidth',1.2,'DisplayName','DAE Prediction');
        plot(t(j+(0:10)), mdl_save(3, :),'bx-','LineWidth',1, ...
            'MarkerSize',4,'DisplayName','Surrogate Prediction');
        plot(t(1:j), all_data{k}.y_noisy_save(1:j, 3), ...
            'Color', 0.5*[1 1 1], 'Marker','p','MarkerFaceColor', ...
            0.5*[1 1 1],'DisplayName','Noisy DAE Elapsed');
        plot(t(1:j), all_data{k}.y_pyomo_save(1:j, 3), 'ko-', ...
            'MarkerFaceColor','k','MarkerSize',2, ...
            'DisplayName','DAE Elapsed');
        ylabel('X2 (%)'); box on; grid on; 
        xlim([0 30]); ylim(ylimX2);

        if j == 5, title(sprintf('%s-MPC', str{k}), 'FontSize', 12); end
        if k == 3 && j == 5
            legend('-DynamicLegend','Location','eastoutside'); 
        end

        nexttile;
        last_u = all_data{k}.u_save(j, 3);
        fill([j-1, j-1, j+9, j+9], [40 60 60 40], 'k', ...
            'FaceAlpha', 0.05, 'LineStyle','none', ...
            'DisplayName', 'Prediction Horizon'); 
        hold on;
        stairs(t(j+(0:10)), [last_u; mdl_ipopt([1:end, end], 3)],'m', ...
            'LineWidth',1,'DisplayName','Predicted Moves');
        stairs(t(1:j), all_data{k}.u_save(1:j, 3),'k', ...
            'LineWidth',1,'DisplayName','Elapsed Moves');
        ylabel('F3 (kg/min)');  box on; grid on;
        xlim([0 30]); ylim(ylimF2); 
        if k == 3 && j == 5
            legend('-DynamicLegend','Location','eastoutside');
        end
    end
    xlabel('Time (min)');
end

a = annotation('textbox', [0.15 0.93 0 0], 'HorizontalAlignment', ...
               'left','string', 'Horizon: 4 to 14 min',...
               'LineStyle','none', 'FitBoxToText','on');
set(a,'FontWeight', 'Bold','FontSize',10, 'Color','r')

a = annotation('textbox', [0.15 0.645 0 0], 'HorizontalAlignment',...
               'left','string', 'Horizon: 10 to 20 min',...
               'LineStyle','none', 'FitBoxToText','on');
set(a,'FontWeight', 'Bold','FontSize',10,'Color','r')

a = annotation('textbox', [0.15 0.36 0 0], 'HorizontalAlignment',...
               'left', 'string', 'Horizon: 20 to 30 min',...
               'LineStyle','none', 'FitBoxToText','on');
set(a,'FontWeight', 'Bold','FontSize',10,'Color','r')