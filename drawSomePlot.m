close all;
clear all;
clc;
a = load('../GA_A.mat');
b = load('../GA_B.mat');
c = load('../GA_C.mat');
figure('Name','Best value','NumberTitle','off')
plot(1:1000,a.unpoko.eachBetterCosts,1:1000,b.unpoko.eachBetterCosts,1:1000,c.unpoko.eachBetterCosts,'LineWidth',2);
legend('A','B','C');
xlabel('iteration');
ylabel('Cost');
grid on;
