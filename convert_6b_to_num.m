function [ vystup ] = convert_6b_to_num( vstup )
% p�evede 6 bit� na ��slo

vystup = 0;

for i=1:6
    vystup = vystup + vstup(i)*2^(6-i);
end

vystup = uint8(vystup);

end

