function [dec_9]=decoder_9(negi,onei,twoi,x)
 
    oneib=~onei;
 twoib=~twoi;
 nx=zeros(1,10);
 nx(1)=~xor(x(1),negi);
 [dec_9(1),nx(2)]=decoder(nx(1),negi,oneib,twoib,x(2));
 [dec_9(2),nx(3)]=decoder(nx(2),negi,oneib,twoib,x(3));
 [dec_9(3),nx(4)]=decoder(nx(3),negi,oneib,twoib,x(4));
 [dec_9(4),nx(5)]=decoder(nx(4),negi,oneib,twoib,x(5));
 [dec_9(5),nx(6)]=decoder(nx(5),negi,oneib,twoib,x(6));
 [dec_9(6),nx(7)]=decoder(nx(6),negi,oneib,twoib,x(7));
 [dec_9(7),nx(8)]=decoder(nx(7),negi,oneib,twoib,x(8));
 [dec_9(8),nx(9)]=decoder(nx(8),negi,oneib,twoib,x(9));
 [dec_9(9),nx(10)]=decoder(nx(9),negi,oneib,twoib,x(9));
 %disp(nx);
end

function [pp,nxi] = decoder(nxj,n,ob,tb,xj)
    nxi=~(xor(xj,n));
    p=(nxj|tb);
   q= (nxi | ob);
   pp=~(p&q);
end