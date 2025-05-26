all_times = zeros([15, 21, 3]);

for X2sp = 18:32
    cva_file = fileread(sprintf('cva_SPT%d_p10_out.json', X2sp));
    cva_data = jsondecode(cva_file);
    all_times(X2sp-17, :, 1) = cva_data.ipopt_time;

    mkcva_file = fileread(sprintf('mkcva_SPT%d_p10_out.json', X2sp));
    mkcva_data = jsondecode(mkcva_file);
    all_times(X2sp-17, :, 2) = mkcva_data.ipopt_time;
    
    lstm_file = fileread(sprintf('lstm_SPT%d_p10_out.json', X2sp));
    lstm_data = jsondecode(lstm_file);
    all_times(X2sp-17, :, 3) = lstm_data.ipopt_time;
end

str = {'CVA', 'MKCVA', 'LSTM'};
figure; col = 'rkb'; sty = {'o-', 's-', '^-'};
for j = [2, 1, 3]
    md = median(all_times(:, :, j), 1);
    mx = max(all_times(:, :, j), [], 1);
    mn = min(all_times(:, :, j), [], 1);
    plot(1:21, md, sty{j}, 'Color', col(j), ...
        'LineWidth', 2, 'DisplayName', str{j}); hold on;
    fill([1:21, 21:-1:1], [mx, mn(end:-1:1)], col(j), ...
        'FaceAlpha', 0.2, 'EdgeColor', 'none', ...
        'HandleVisibility','off')
end
grid on; xlim([1 21]); yscale('log');
set(gcf,'Color', 'w'); legend('Location','northeast');
ylabel('IPOPT Runtime (sec)')
xlabel('Horizon Movement (min)')
