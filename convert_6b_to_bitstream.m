function [ vystup ] = convert_6b_to_bitstream( vstup )
% p�evede 6b ��slo na bitstream od MSb po LSb
% nen� tu o�et�en vstup v�t�� ne� 63, tato vstupn� data se sme nemohou
% dostat
vstup = double(vstup);
vystup = [];
for e=5:-1:0
    tmp = floor(vstup / (2^e));
    vstup = vstup - tmp * (2^e);
    vystup = [vystup logical(tmp)];
end
end

