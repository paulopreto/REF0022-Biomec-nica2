a1 = 3;
a2 = 3;
t1 = 0;
t2 = 6;

plot([t1, t2], [a1, a2], 'linewidth', 4)

integral1 = (t2-t1) * (a2 - 0)
integral1_trapz = trapz([t1,t2], [a1, a2])

hold on

b1 = 7;
b2 = 7;
t3 = 6;
t4 = 8;

plot([t3, t4], [b1, b2], 'linewidth', 4)
ylim([0, 8])

integral2 = (t4-t3) * (b2 - 0)
integral2_trapz = trapz([t3,t4], [b1, b2])

figure
t = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
pos = sin(t)
plot(t, pos)

integral3_trapz = trapz(t, pos)


figure 
tt = 0:.1:1000;
pos2 = sin(tt);
plot(tt, pos2)

integral4_trapz = trapz(tt, pos2)


