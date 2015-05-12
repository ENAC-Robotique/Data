clear all;
close all;
clc;

h=0:200;
L = (h.*h + (80+h).*(80+h))./(2*(80+h));
l = 80+h-L;

max(L.*L - l.*l - h.*h)

figure;
plot(h, L, 'r', h, l, 'b')
legend(["L";"l"])



P = [0;-100];
OM = [zeros(size(L));
      -l;
      zeros(size(L))];
alpha = atan2(h, l);

vec = [-cos(alpha);-sin(alpha)];
FM = vec .* dot(P*ones(size(L)), vec);
FM = [FM;
      zeros(size(L))];
M = cross(OM, FM);


figure;
plot(h, M(3,:));
