function [ vystup ] = convert_6b_to_bitstream( vstup )
% pøevede 6b èíslo na bitstream od MSb po LSb
% není tu ošetøen vstup vìtší než 63, tato vstupní data se sme nemohou
% dostat
vstup = double(vstup);
vystup = [];
for e=5:-1:0
    tmp = floor(vstup / (2^e));
    vstup = vstup - tmp * (2^e);
    vystup = [vystup logical(tmp)];
end
end

