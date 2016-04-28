function [ jas, rj_small, gj_small ] = demodulator_8PSK( signal )
% fce se signálu vytváøí nejprve bitstream a poté jej dekoduje na jas a
% pomìry øervené a zelené ku jasu

phi_r = angle(signal);
phi = radtodeg(phi_r);

for i=1:length(phi)
   if (phi(i) >= 0 ) && (phi(i) < 45)
       phi(i) = 22.5;
   elseif (phi(i) >= 45 ) && (phi(i) < 90)
       phi(i) = 67.5;
   elseif (phi(i) >= 90 ) && (phi(i) < 135)
       phi(i) = 112.5;
   elseif (phi(i) >= 135 ) && (phi(i) < 180)
       phi(i) = 157.5;
   elseif (phi(i) >= -180 ) && (phi(i) < -135)
       phi(i) = -157.5;
   elseif (phi(i) >= -135 ) && (phi(i) < -90)
       phi(i) = -112.5;
   elseif (phi(i) >= -90 ) && (phi(i) < -45)
       phi(i) = -67.5;
   else
       phi(i) = -22.5;
   end
end

bitstream = [];

for i=1:length(phi)
    p = int8( phi(i) / 22.5 );
    switch(p)
       case int8(-7)
           bitstream = [bitstream 0 0 0];       
       case int8(-5)
           bitstream = [bitstream 0 0 1];
       case int8(-3)
           bitstream = [bitstream 0 1 0];
       case int8(-1)
           bitstream = [bitstream 0 1 1];
       case int8(1)
           bitstream = [bitstream 1 0 0];
       case int8(3)
           bitstream = [bitstream 1 0 1];
       case int8(5)
           bitstream = [bitstream 1 1 0];
       case int8(7)
           bitstream = [bitstream 1 1 1];  
   end
end

bitstream = reshape(bitstream, 6, [])';
datastream = [];

for i=1:size(bitstream, 1)
   datastream = [datastream convert_6b_to_num(bitstream(i,:))];
end

jas = datastream(1:40000);
rj_small = datastream(40001:42500);
gj_small = datastream(42501:45000);

jas = reshape(jas, 200,200);
rj_small = reshape(rj_small, 50,50);
gj_small = reshape(gj_small, 50,50);


end

