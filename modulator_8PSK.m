function [ signal ] = modulator_8PSK( jas, rj_small, gj_small )
% moduluje vstupn� data pomoc� 8PSK modulace

% p�evod matice na vektor
jas = reshape(jas, 1, 200*200);
rj_small = reshape(rj_small, 1, 50*50);
gj_small = reshape(gj_small, 1, 50*50);

% vytvo�en� bitstreamu
bitstream = [];
for i=1:length(jas)
    bitstream =  [bitstream convert_6b_to_bitstream(jas(i))];
end
for i=1:length(rj_small)
    bitstream =  [bitstream convert_6b_to_bitstream(rj_small(i))];
end
for i=1:length(gj_small)
    bitstream =  [bitstream convert_6b_to_bitstream(gj_small(i))];
end


%vytvo�en� trojic bit�
numstream = [];
bitstream = reshape(bitstream, 3, [])';
for i=1:size(bitstream,1)
    numstream(i) = convert_6b_to_num([0 0 0 bitstream(i,:)]);
end

signal = [];

% vytvo�en� I a Q dat
for i=1:length(numstream)
    phi = 45*(numstream(i)-4)+22.5;    
    phi_r = degtorad(phi);
    Q = sin(phi_r);
    I = cos(phi_r);
    signal(i) = I+j*Q;
end

end

