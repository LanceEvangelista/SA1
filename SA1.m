%% part 1. sig op
% a.

Fs = 2000;
t = 0:1/Fs:0.1-1/Fs;


x1 = 0.7*cos(2*pi*(75)*t);
x2 = 0.1*cos(2*pi*(50)*t);
x3 = 0.4*cos(2*pi*(25)*t);

y1 = x1 + x2 + x3;

subplot(4,1,1)
plot(t,x1)
title x1

subplot(4,1,2)
plot(t,x2)
title x2

subplot(4,1,3)
plot(t,x3)
title x3

subplot(4,1,4)
plot(t,y1)
title y(t)


%% b.& c.
% S1

g1 = cos(2*pi*(500)*t); 

s1 = (y1 + 3).*(g1);
s1f = fft(s1,1024);
w = ((0:511)/512)*(Fs/2);

subplot(1,2,1)
plot(w,abs(s1f(1:512)));
title S1

% S2

p1 = 3*cos(2*pi*(500)*t);

s2 = (y1).*(p1);
s2f = fft(s2,1024);
w = ((0:511)/512)*(Fs/2);

subplot(1,2,2)
plot(w,abs(s2f(1:512)));
title S2

%% d. AVG POWER

Ty1 = 1/25;
Tp1 = 1/500;

y1pwr = (1/Ty1)*(sum(y1))^2;
p1pwr = (1/Tp1)*(sum(p1))^2;
s1pwr = (1/Ty1)*(sum(s1))^2;
s2pwr = (1/Ty1)*(sum(s2))^2;

%% f. fftshift

fs1 = fftshift(s1f);
subplot(1,2,1)
plot(-511:512,abs(fs1))

fs2 = fftshift(s2f);
subplot(1,2,2)
plot(-512:511,abs(fs2))

%% part 2. LCCDE



