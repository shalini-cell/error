function [out]=radix4_8_RCPFAI_5(in1,in2)
    sum=zeros(3,13);
    prod=zeros(1,16);
    P=zeros(1,8);
    R=zeros(1,8);
    P=de2bi(abs(in1), 8);
    R=de2bi(abs(in2),8); 
    if(in1<0)
    P=~P;
    j=1;
       for k=1:1:8
           inputc(k)=xor(P(k),j);
           j=P(k)&j;
       end
       P=inputc;
     end
    if(in2<0)
    R=~R;
    j=1;
       for k=1:1:8
           inputc(k)=xor(R(k),j);
           j=R(k)&j;
       end
       R=inputc;
    end
    X(1,2:9)=P;
    %R=de2bi(in2,16);
    Y(1,2:9)=R;
    X(1,1)=0;
    Y(1,1)=0;
    PP=zeros(4,9);
    [negi(1),onei(1),twoi(1),cori(1)] = encoder(Y(1,1),Y(1,2),Y(1,3));
    [PP(1,:)]=decoder_9(negi(1),onei(1),twoi(1),X);
    [negi(2),onei(2),twoi(2),cori(2)] = encoder(Y(3),Y(4),Y(5));
    [PP(2,:)]=decoder_9(negi(2),onei(2),twoi(2),X);
    [sum(1,:)]= adder2_8_RA(PP(1,:),PP(2,:),cori(1),1);
    prod(1)=sum(1,1);
    prod(2)=sum(1,2);
    [negi(3),onei(3),twoi(3),cori(3)] = encoder(Y(5),Y(6),Y(7));
    [PP(3,:)]=decoder_9(negi(3),onei(3),twoi(3),X);
    [sum(2,:)]= adder2_8(sum(1,3:13),PP(3,:),cori(2),0);
    prod(3)=sum(2,1);
    prod(4)=sum(2,2);
    [negi(4),onei(4),twoi(4),cori(4)] = encoder(Y(7),Y(8),Y(9));
    [PP(4,:)]=decoder_9(negi(4),onei(4),twoi(4),X);
    [sum(3,:)]= adder2_8(sum(2,3:13),PP(4,:),cori(3),0);
    prod(5)=sum(3,1);
    prod(6)=sum(3,2);
    [prod(7:16)]=carry_propagation_8(sum(3,3:12),cori(4));
    out=bi2de(prod);
    %disp(prod);
   if(in1<0 && in2>0 || in1>0 && in2<0)
    prod=~prod;
    j=1;
       for k=1:1:16
           inputc(k)=xor(prod(k),j);
           j=prod(k)&j;
       end
       prod=inputc; 
       out=-bi2de(prod);
   end
end

function [sum]= adder2_8_RA(in1,in2,cor,s)
    cy=zeros(1,12);
    n1=~in2(9);
    if(s)
        n2=in1(9);
        n3=~in1(9);
    else
        n2=in1(10);
        n3=in1(11);
    end
    [sum(1),cy(1)]=ha(in1(1),cor);
    [sum(2),cy(2)]=ha(in1(2),cy(1));
    %f5=~(in1(5)&in2(3));
    f6=~(in1(5)&in2(3));
    f5=~(in1(4)&in2(2));
    f4=~(in1(3)&in2(1));
    f3=1;
    cy(6)=f6;
    [sum(5),cy(5)]=RA(in1(5),in2(3),cy(6),f5);
    [sum(4),cy(4)]=RA(in1(4),in2(2),cy(5),f4);
    [sum(3),cy(3)]=RA(in1(3),in2(1),cy(4),f3);
    
    
    
    [sum(6),cy(7)]=fa(in1(6),in2(4),cy(6));
    [sum(7),cy(8)]=fa(in1(7),in2(5),cy(7));
    [sum(8),cy(9)]=fa(in1(8),in2(6),cy(8));
    [sum(9),cy(10)]=fa(in1(9),in2(7),cy(9));
    [sum(10),cy(11)]=fa(n2,in2(8),cy(10));
    [sum(11),cy(12)]=fa(n3,n1,cy(11));
    [sum(12),sum(13)]=fa(1,0,cy(12));
end

function [sum]=carry_propagation_8(in1,cor)
    cy=zeros(1,11);
    [sum(1),cy(1)]=ha(in1(1),cor);
    [sum(2),cy(2)]=ha(in1(2),cy(1));
    [sum(3),cy(3)]=ha(in1(3),cy(2));
    [sum(4),cy(4)]=ha(in1(4),cy(3));
    [sum(5),cy(5)]=ha(in1(5),cy(4));
    [sum(6),cy(6)]=ha(in1(6),cy(5));
    [sum(7),cy(7)]=ha(in1(7),cy(6));
    [sum(8),cy(8)]=ha(in1(8),cy(7));
    [sum(9),cy(9)]=ha(in1(9),cy(8));
    [sum(10),cy(10)]=ha(in1(10),cy(9)); 
end


function [sum]= adder2_8(in1,in2,cor,s)
    cy=zeros(1,11);
    n1=~in2(9);
    if(s)
        n2=in1(9);
        n3=~in1(9);
    else
        n2=in1(10);
        n3=in1(11);
    end
    [sum(1),cy(1)]=ha(in1(1),cor);
    [sum(2),cy(2)]=ha(in1(2),cy(1));
    [sum(3),cy(3)]=fa(in1(3),in2(1),cy(2));
    [sum(4),cy(4)]=fa(in1(4),in2(2),cy(3));
    [sum(5),cy(5)]=fa(in1(5),in2(3),cy(4));
    [sum(6),cy(6)]=fa(in1(6),in2(4),cy(5));
    [sum(7),cy(7)]=fa(in1(7),in2(5),cy(6));
    [sum(8),cy(8)]=fa(in1(8),in2(6),cy(7));
    [sum(9),cy(9)]=fa(in1(9),in2(7),cy(8));
    [sum(10),cy(10)]=fa(n2,in2(8),cy(9));
    [sum(11),cy(11)]=fa(n3,n1,cy(10));
    [sum(12),sum(13)]=fa(1,0,cy(11));
end

% rcpfa III
 function [sumI,carryI]=RA(a,b,c,f)
  tempI= ~(( a & b) | (~c));carryI=~(tempI | f);  sumI=~(tempI | (~f));end
% % %% rcpfa II
% function [sumI,carryI]=RA(a,b,c,f)
%    tempI= ~(( a | b) & (~c));carryI=(tempI & f);  sumI=~(tempI & (~f));end

% %% RCPFA I
%    function [s,co]=RA(Ai,Bi,Ci1,Fi)
%    Xi=~(Ci1|(Ai&Bi));Yi=~(Ci1&(Ai|Bi));s=~(Yi&(~Fi|Xi));co=(Xi|(Yi&Fi));end