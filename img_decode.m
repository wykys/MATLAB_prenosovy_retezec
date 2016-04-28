function [ rgb ] = img_decode( jas, rj_small, gj_small )
% funkce dekoduje komprimovany obrazek
% jas ... jas obrazku matice 200*200
% rj_small ... matice 50*50 pomìr øervené ku jasu
% gj_small ... matice 50*50 pomìr zelené ku jasu


% pøevod dat s kanalovych hodnot na pocitaci

jas = double(jas);
rj_small = double(rj_small) ;
gj_small = double(gj_small);

jas = jas .* (3 * 2^2);
rj_small = rj_small ./ 2^6;
gj_small = gj_small ./ 2^6;

% vytvoøení velkých matic 200*200
iy=-3;
for y=1:50
    iy = iy+4;
    ix = -3;
    for x=1:50
        ix = ix+4;
        rj_big(iy:iy+3,ix:ix+3) = ones(4,4) .* rj_small(y,x);
        gj_big(iy:iy+3,ix:ix+3) = ones(4,4) .* gj_small(y,x);
    end
end

bj_big = 1 - rj_big - gj_big;

r = uint8(rj_big .* jas);
g = uint8(gj_big .* jas);
b = uint8(bj_big .* jas);

rgb = cat(3, r,g,b);
imwrite(rgb, 'vystup3.bmp')


end

