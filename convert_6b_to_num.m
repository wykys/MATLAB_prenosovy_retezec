function [ vystup ] = convert_6b_to_num( vstup )
% pøevede 6 bitù na èíslo

vystup = 0;

for i=1:6
    vystup = vystup + vstup(i)*2^(6-i);
end

vystup = uint8(vystup);

end

