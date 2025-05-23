close all;
compare_sysid1 = load('compare_models.mat').evap_compare_sysID;
compare_sysid2 = load('compare_models.mat').tanks_compare_sysID;

% For the Evaporator Case Study
compare_sysid1.mdl_name = categorical(compare_sysid1.mdl_name, ...
                                     ["CVA", "MKCVA", "LSTM"], ...
                                     Ordinal=true);

% For the Three Tanks Case Study
compare_sysid2.mdl_name = categorical(compare_sysid2.mdl_name, ...
                                     ["CVA", "MKCVA", "LSTM"], ...
                                     Ordinal=true);
t1 = stack(compare_sysid1, 2:4); % Evaporator
t2 = stack(compare_sysid2, 2:4); % Three Tanks
f = figure;

subplot(211); % Evaporator
boxchart(t1{:, 1}, t1{:, 3}*100, "GroupByColor", t1{:, 2}, ...
    'BoxWidth',0.75);
title('(a) Newell-Lee Evaporator')
ylabel('Accuracy (R^2)'); ylim([60, 100]); box on; grid on;
legend('Interpolation Tests', 'Extrapolation Tests (25% larger)', ...
    'Extrapolation Tests (50% larger)', 'Location','southwest');

subplot(212); % Three Tanks
boxchart(t2{:, 1}, t2{:, 3}*100, "GroupByColor", t2{:, 2}, ...
    'BoxWidth',0.75);
title('(b) Three Tanks System')
ylabel('Accuracy (R^2)'); ylim([60, 100]); box on; grid on;
set(gcf, 'Color', 'w'); fontsize(f, 12, 'points');