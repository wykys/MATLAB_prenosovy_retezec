function [ jas, rj_small, gj_small ] = img_code( rgb)
% funkce pøevede matici reprezentující rgb data do tøí matic
% jas ... jas obrzku
% rja ... pomìr èervené ku jasu
% gja ... pomìr zelené ku jasu

r = double(rgb(:,:,1));
g = double(rgb(:,:,2));
b = double(rgb(:,:,3));
% celkovy jas
jas = r + g + b;
% vypicty pomeru
rja = r./jas;
gja = g./jas;
bja = 1 - rja - gja;

% testovaci vystup
r1 = uint8(rja .* jas);
g1 = uint8(gja .* jas);
b1 = uint8(bja .* jas);
rgb1 = cat(3, r1,g1,b1);
imwrite(rgb1, 'vystup1.bmp');

iy = 0;
for y=1:4:200
    ix = 0;
    iy = iy + 1;
    for x=1:4:200
        ix = ix+1;
        
        rj_small(iy,ix) = sum(sum(rja(y:y+3, x:x+3))) ./ 16;
        gj_small(iy,ix) = sum(sum(gja(y:y+3, x:x+3))) ./ 16;
        j_small(iy,ix) = sum(sum(jas(y:y+3, x:x+3))) ./ 16;
    end
end
% dopoèet 3. pomìrové matice pro otestování korektnosti výstupních dat
bj_small = 1 - rj_small - gj_small;
% výstup pro ovìøení fce
r2 = uint8(rj_small .* j_small);
g2 = uint8(gj_small .* j_small);
b2 = uint8(bj_small .* j_small);
rgb2 = cat(3, r2,g2,b2);
imwrite(rgb2, 'vystup2.bmp');

% uprava dat pro prenosovy kanal
jas = uint8(floor(jas ./ (3 * 2^2)));
rj_small = uint8(floor(rj_small .* 2^6));
gj_small = uint8(floor(gj_small .* 2^6));

end

