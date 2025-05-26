clc; clear; close all;
train = [12.39	7.97	4.62	2.07	0.45	0.26	0.2	0.12;
         12.82	8.44	4.73	2	0.54	0.3	0.17	0.16;
         13.73	8.52	5.06	2.19	0.49	0.31	0.18	0.09;
         12.51	8.13	5.09	2.1	0.45	0.36	0.17	0.09;
         12.87	8.58	4.8	2.03	0.52	0.29	0.2	0.09;
         13.55	8.95	5.15	2.05	0.44	0.29	0.2	0.11;
         12.96	8.6	4.89	1.97	0.51	0.32	0.17	0.1;
         13.03	8.58	4.9	2.19	0.45	0.34	0.19	0.09;
         13.12	8.41	5.01	2.09	0.52	0.3	0.18	0.1;
         13.06	8.67	4.91	2.25	0.51	0.36	0.2	0.11];

test = [8.49	6.66	4.77	2.74	1.83	0.98	0.41	0.32;
        8.99	7.18	5.07	2.88	2.22	1.43	0.44	0.33;
        9.4	7.06	4.97	3.03	2	1.25	0.49	0.37;
        9.24	6.64	5.03	2.95	2.09	1.36	0.5	0.33;
        9.26	7.06	4.93	2.75	2.28	1.45	0.58	0.34;
        9.19	6.93	5.14	2.98	1.86	1.38	0.58	0.35;
        9.46	7.22	5.22	2.78	1.99	1.38	0.51	0.32;
        9.24	7.08	5.14	2.99	2.15	1.38	0.54	0.37;
        9.13	7.08	5	2.93	2.44	1.46	0.45	0.38;
        9.22	7.24	5.07	3.15	2.18	1.62	0.67	0.41];

cols = {'Non-vectorized, Non-reduced', ...
        'Non-vectorized, 750 medoids', ...
        'Non-vectorized, 500 medoids', ...
        'Non-vectorized, 250 medoids', ...
        'Vectorized, Non-reduced', ...
        'Vectorized, 750 medoids', ...
        'Vectorized, 500 medoids', ...
        'Vectorized, 250 medoids'};


a = table('Size',[80 2],'VariableTypes', ...
    ["string", "double"], ...
    'VariableNames',["case","time"]);
ctr = 1;
for i = 1:8
    for j = 1:10
        a(ctr,"case") = cols(i);
        a(ctr,"time") = {train(j, i)};
        ctr = ctr + 1;
    end
end
b = table('Size',[80 2],'VariableTypes', ...
    ["string", "double"], ...
    'VariableNames',["case","time"]);
ctr = 1;
for i = 1:8
    for j = 1:10
        b(ctr,"case") = cols(i);
        b(ctr,"time") = {test(j, i)};
        ctr = ctr + 1;
    end
end
a.case = categorical(a.case, cols);
b.case = categorical(b.case, cols);

subplot(211);
boxchart(a.case, a.time,'Orientation','horizontal')
hold on; plot(mean(train), 1:8, 'om-', 'MarkerSize', 2, 'LineWidth',1.2);
grid on; box on; hold off;
xscale('log')
title('(a) Training Time');
xlim([0.05, 20]);
xlabel('Runtime (Seconds)');
subplot(212);
boxchart(b.case, b.time,'Orientation','horizontal')
hold on; plot(mean(test), 1:8, 'om-','MarkerSize', 2, 'LineWidth',1.2);
grid on; box on;
title('(b) Simulation Time')
xlim([0, 10])
xlabel('Runtime (Seconds)');
xticks(0:10)
set(gcf,'Color','w');

