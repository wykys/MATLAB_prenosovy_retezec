% wykys
% Jan Vykydal
% xvykyd06
% VUTID: 186240

RGB = imread('mkid.bmp');

% kodovani obrazku
[jas, rj_small, gj_small] = img_code(RGB);

%modulator
signal = modulator_8PSK(jas, rj_small, gj_small);

%pøidání šumu
I = real(signal);
Q = imag(signal);

% koeficient šumu
SP = 0.2;
%zašumìní signálu
I = I + randn(1,length(I)) .* SP;
Q = Q + randn(1,length(Q)) .* SP;

% opìtovné složení kompexního signálu
signal = I + j*Q;

% demodulkace
[jas, rj_small, gj_small] = demodulator_8PSK(signal);

% dekodovani obrazku
img_decode(jas, rj_small, gj_small);

disp('STOP OK');

% znázornìní zašumìlého signálu
plot(I, Q, '.');
title('Gaussova rovina');
xlabel('I [V]');
ylabel('Q [V]');
grid on;

