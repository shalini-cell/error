function [negi,onei,twoi,cori] = encoder(y1,y2,y3)
negi=y3;
onei=xor(y1,y2);
p=(~y3)&(y2)&(y1);
q=(y3)&(~y2)&(~y1);
twoi=p|q;
e=(~y1)|(~y2) ;
cori=e & y3;
end
    