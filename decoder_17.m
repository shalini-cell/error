function [dec_17]=decoder_17(negi,onei,twoi,x)
 
    oneib=~onei;
 twoib=~twoi;
 nx=zeros(1,18);
 nx(1)=~xor(x(1),negi);
 [dec_17(1),nx(2)]=decoder(nx(1),negi,oneib,twoib,x(2));
 
 [dec_17(2),nx(3)]=decoder(nx(2),negi,oneib,twoib,x(3));
 [dec_17(3),nx(4)]=decoder(nx(3),negi,oneib,twoib,x(4));
 [dec_17(4),nx(5)]=decoder(nx(4),negi,oneib,twoib,x(5));
 [dec_17(5),nx(6)]=decoder(nx(5),negi,oneib,twoib,x(6));
 [dec_17(6),nx(7)]=decoder(nx(6),negi,oneib,twoib,x(7));
 [dec_17(7),nx(8)]=decoder(nx(7),negi,oneib,twoib,x(8));
 [dec_17(8),nx(9)]=decoder(nx(8),negi,oneib,twoib,x(9));
 [dec_17(9),nx(10)]=decoder(nx(9),negi,oneib,twoib,x(10));
 [dec_17(10),nx(11)]=decoder(nx(10),negi,oneib,twoib,x(11));
 [dec_17(11),nx(12)]=decoder(nx(11),negi,oneib,twoib,x(12));
 [dec_17(12),nx(13)]=decoder(nx(12),negi,oneib,twoib,x(13));
 [dec_17(13),nx(14)]=decoder(nx(13),negi,oneib,twoib,x(14));
 [dec_17(14),nx(15)]=decoder(nx(14),negi,oneib,twoib,x(15));
 [dec_17(15),nx(16)]=decoder(nx(15),negi,oneib,twoib,x(16));
 [dec_17(16),nx(17)]=decoder(nx(16),negi,oneib,twoib,x(17));
 [dec_17(17),nx(18)]=decoder(nx(17),negi,oneib,twoib,x(17));
 %disp(nx);
end

function [pp,nxi] = decoder(nxj,n,ob,tb,xj)
    nxi=~(xor(xj,n));
    p=(nxj|tb);
   q= (nxi | ob);
   pp=~(p&q);
end