close all
clearvars
clc

load("Lab2.mat");
theta = pi/3; %incident angle of wavefronts
c = 1500; %speed of propagation in the medium (m/s)
d = .1; %array element spacing (m)

fw = 6000; %frequency of waves (Hz)
fs = 96000; %sampling frequency (Hz)

tau = d*cos(theta)/c; %(s)
phi = 2*pi*fw*tau; %(radians)

n = 1:length(x_clean);
comp_clean(n) = sum(x_clean(:,n));

N = size(comp_clean,2);
X = fft(comp_clean);

w = 2*pi .* n;
w = w ./ N;
w = w - pi;

mag_X = abs(X);
phase_X = angle(X);

figure; plot(w,fftshift(mag_X));
title("Magnitude of DFT of Clean Sum)");
xlabel("\omega (rad/sec)"); ylabel("abs(fft(x))");

figure; plot(w,fftshift(phase_X));
title("Phase of DFT(x)");
xlabel("\omega (rad/sec)"); ylabel("angle(fft(x))");

k = 0:4; %number of array elements and therefore number of time delays away
clean_shifted = [x_clean(1,:) + k(5)*tau; x_clean(2,:) + k(4)*tau; x_clean(3,:) + k(3)*tau; x_clean(4,:) + k(2)*tau; x_clean(5,:) + k(1)*tau];
comp_cleanshifted(n) = sum(clean_shifted(:,n));

Y = fft(comp_cleanshifted);

mag_Y = abs(Y);
phase_Y = angle(Y);

figure; plot(w,fftshift(mag_Y));
title("Magnitude of DFT of Shifted Clean Sum");
xlabel("\omega (rad/sec)"); ylabel("abs(fft(y))");

figure; plot(w,fftshift(phase_Y));
title("Phase of DFT(y)");
xlabel("\omega (rad/sec)"); ylabel("angle(fft(y))");





sum_noisy(n) = sum(x_noisy(:,n));