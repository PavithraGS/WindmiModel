+clear;
clc

tauLossTable = readtable('tauloss.txt')
figure (1)
xlabel("Energy levels");
ylabel('Tauloss')
hold on;
labels = ["a" "b" "c" "d" "e" "f" "g" "h" "i" "j" "k"];
for i = 2:12
    plot(tauloss(:,1),tauloss(:,i),'*-','DisplayName',labels(i-1));
end
plot(tauloss(:,1),tauloss(:,end),'-','LineWidth',3,'DisplayName','Mean','LineWidth',1.5);
legend;
grid on;

load tdelay.txt
figure (2)
xlabel("Energy levels");
ylabel('TDelay')
hold on;
for i = 2:12
    plot(tdelay(:,1),tdelay(:,i),'*-','DisplayName',labels(i-1));
end
plot(tdelay(:,1),tdelay(:,end),'-','LineWidth',3,'DisplayName','Mean','LineWidth',1.5);
legend;
grid on;

load tauloss_wo_ol.txt
%plot(tdelay_wo_ol(:,1),tdelay_wo_ol(:,2:10),'*-');
figure (3)
xlabel("Energy levels");
ylabel('Tauloss')
hold on
for i = 2:10
    plot(tauloss_wo_ol(:,1),tauloss_wo_ol(:,i),'*-','DisplayName',labels(i-1));
end
plot(tauloss_wo_ol(:,1),tauloss_wo_ol(:,end),'-','LineWidth',3,'DisplayName','Mean','LineWidth',1.5);
legend;
grid on;

load tdelay_wo_ol.txt
%plot(tdelay_wo_ol(:,1),tdelay_wo_ol(:,2:10),'*-');
hold on
figure (4)
xlabel("Energy levels");
ylabel('TDelay')
hold on;
for i = 2:11
    plot(tdelay_wo_ol(:,1),tdelay_wo_ol(:,i),'*-','DisplayName',labels(i-1));
end
plot(tdelay_wo_ol(:,1),tdelay_wo_ol(:,end),'-', 'LineWidth',3,'DisplayName','Mean','LineWidth',1.5);
legend;
grid on;
