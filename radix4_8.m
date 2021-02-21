function [out]=radix4_8(in1,in2)
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
    [sum(1,:)]= adder2_8(PP(1,:),PP(2,:),cori(1),1);
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
   % disp(prod);
    % disp(sum(3,3:12));
    
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