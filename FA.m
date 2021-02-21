function [ sum, carry ] = FA( a,b,c )
temp = xor(a,b);
sum = xor(temp,c);
carry = (a & b) | (b & c) | (c & a);

end
