%         [CVA,     MKCVA,  LSTM] 
iae_p10 = [39.7858	43.8643	44.479;  % For prediction horizon = 10
           33.2483	36.0866	36.8681;
           28.2053	28.5287	29.8072;
           24.1252	22.0698	23.528;
           21.0784	15.1895	17.72;
           19.5904	10.3915	12.2714;
           14.001	6.0473	6.9407;
           8.1254	2.853	1.8319;
           8.2405	6.5512	6.6441;
           10.5767	9.6347	15.4322;
           17.9868	13.1089	19.9975;
           29.8223	18.497	27.0255;
           42.3577	24.4259	34.1799;
           54.6607	31.503	41.1776;
           69.184	39.5185	48.9198];

iae_p5 = [41.6923	45.909	46.6563; % For prediction horizon = 5
          36.4841	38.4308	37.9126;
          32.3262	31.8539	29.2248;
          29.3341	24.4692	22.5787;
          26.3183	17.3764	17.0664;
          21.5591	12.0909	11.2331;
          16.3195	7.4076	7.3272;
          10.3884	4.0512	4.7437;
          9.0908	7.3454	10.9808;
          10.485	11.1994	19.4996;
          22.4823	13.9586	27.3668;
          36.9922	18.714	35.1269;
          51.7319	26.0237	41.4967;
          68.0534	33.8193	46.0395;
          86.1183	43.183	56.5008];

t = 18:32; close all;

% Plots for Pred. Hor. = 5
plot(t, iae_p5(:, 1), 'o-.','Color', [1 0 0], 'MarkerFaceColor', ...
    [1 0 0], 'MarkerSize', 4, 'LineWidth', 0.5, ...
    'DisplayName','(Pred. Hor. = 5)  CVA-MPC');
hold on;
plot(t, iae_p5(:, 3), '^-.', 'Color', [0 0 1], 'MarkerFaceColor', ...
    [0 0 1], 'MarkerSize', 4, 'LineWidth', 0.5, ...
    'DisplayName','(Pred. Hor. = 5)  LSTM-MPC');
plot(t, iae_p5(:, 2), 's-.','Color', [0 0 0], 'MarkerFaceColor', ...
    [0 0 0], 'MarkerSize', 5, 'LineWidth', 0.5, ...
    'DisplayName','(Pred. Hor. = 5)  MKCVA-MPC');

% Plots for Pred. Hor. = 10
plot(t, iae_p10(:, 1), 'ro-','MarkerFaceColor', 'r', 'MarkerSize', 4,...
    'LineWidth', 1.5, 'DisplayName','(Pred. Hor. = 10) CVA-MPC');
plot(t, iae_p10(:, 3), 'b^-','MarkerFaceColor', 'b', 'MarkerSize', 4,...
    'LineWidth', 1.5, 'DisplayName','(Pred. Hor. = 10) LSTM-MPC');
plot(t, iae_p10(:, 2), 'ks-','MarkerFaceColor', 'k', 'MarkerSize', 5,...
    'LineWidth', 1.5, 'DisplayName','(Pred. Hor. = 10) MKCVA-MPC');

plot([25 25],[0 90], 'k--', 'DisplayName','Nominal CV value')
ylabel('IAE (Integral of Absolute Error)');
xlabel('CV Setpoint'); xlim([17 33]);
legend('-DynamicLegend','Location','northwest');
grid on; box on; set(gcf, 'Color', 'w');