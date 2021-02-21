function [prod] = array_16_4(input1,input2)
    
     %A=zeros(1,16);
     %B=zeros(1,16);
%      A=de2bi(abs(input1),16);
%      B=de2bi(abs(input2),16);
%     %% Sign Bit
    % if input1<0
     %     A(1,16)=1;
     %end
    % if input2<0 
    %      B(1,16)=1;
    % end
     I=dec2q(abs(input1),14,2,'bin'); 
      L=dec2q(abs(input2),14,2,'bin');
        A=de2bi(I,16);
            B=de2bi(L ,16);
      %% Partial products   
      P=zeros(32,32);
      
      for i=1:16
          for j=1:16
              P(i,j)=B(1,i)&A(1,j);
          end
      end
      
      S=zeros(32,32);
      C=zeros(32,32);
      FINAL=zeros(1,32);
    %  FINAL(1,31)=xor(B(1,16),A(1,16));
   f6=~(P(1,7)&P(2,6));
   f5=~(P(1,6)&P(2,5));
   f4=~(P(1,5)&P(2,4));
   f3=~(P(1,4)&P(2,3));
   f2=~(P(1,3)&P(2,2));
   f1=~(P(1,2)&P(2,1));
   C(1,7)=f6;
    FINAL(1,1)=P(1,1);
     [S(1,2)]=HA(P(1,2),P(2,1));
      [S(1,7),C(1,6)]=RA(P(1,7),P(2,6),C(1,7),f5);
      [S(1,6),C(1,5)]=RA(P(1,6),P(2,5),C(1,6),f4);
      [S(1,5),C(1,4)]=RA(P(1,5),P(2,4),C(1,5),f3);
      [S(1,4),C(1,3)]=RA(P(1,4),P(2,3),C(1,4),f2);
      [S(1,3),C(1,2)]=RA(P(1,3),P(2,2),C(1,3),f1);
      
      [S(1,8),C(1,8)]=FA(P(1,8),P(2,7),C(1,7));
      [S(1,9),C(1,9)]=FA(P(1,9),P(2,8),C(1,8));
      [S(1,10),C(1,10)]=FA(P(1,10),P(2,9),C(1,9));
      [S(1,11),C(1,11)]=FA(P(1,11),P(2,10),C(1,10));
      [S(1,12),C(1,12)]=FA(P(1,12),P(2,11),C(1,11));
      [S(1,13),C(1,13)]=FA(P(1,13),P(2,12),C(1,12));
      [S(1,14),C(1,14)]=FA(P(1,14),P(2,13),C(1,13));
      [S(1,15),C(1,15)]=FA(P(1,15),P(2,14),C(1,14));
      [S(1,16),C(1,16)]=FA(P(1,16),P(2,15),C(1,15));
      [S(1,17),C(1,17)]=HA(P(2,16),C(1,16));
      %%
    
      FINAL(1,2)=S(1,2);
      
      f5=~(S(1,7)&P(3,5));
      f4=~(S(1,6)&P(3,4) );
      f3=~(S(1,5)&P(3,3));
       f2=~(S(1,4)&P(3,2));
        f1=~(S(1,3)&P(3,1));
      C(2,7)=f5;
      [S(2,3),C(2,3)]=HA(S(1,3),P(3,1));
      [S(2,7),C(2,6)]=RA(S(1,7),P(3,5),C(2,7),f4);
      [S(2,6),C(2,5)]=RA(S(1,6),P(3,4),C(2,6),f3);
      [S(2,5),C(2,4)]=RA(S(1,5),P(3,3),C(2,5),f2);
      [S(2,4),C(2,3)]=RA(S(1,4),P(3,2),C(2,4),f1);
      
      [S(2,8),C(2,8)]=FA(S(1,8),P(3,6),C(2,7));
      [S(2,9),C(2,9)]=FA(S(1,9),P(3,7),C(2,8));
      [S(2,10),C(2,10)]=FA(S(1,10),P(3,8),C(2,9));
      [S(2,11),C(2,11)]=FA(S(1,11),P(3,9),C(2,10));
      [S(2,12),C(2,12)]=FA(S(1,12),P(3,10),C(2,11));
      [S(2,13),C(2,13)]=FA(S(1,13),P(3,11),C(2,12));
      [S(2,14),C(2,14)]=FA(S(1,14),P(3,12),C(2,13));
      [S(2,15),C(2,15)]=FA(S(1,15),P(3,13),C(2,14));
      [S(2,16),C(2,16)]=FA(S(1,16),P(3,14),C(2,15));
      [S(2,17),C(2,17)]=FA(S(1,17),P(3,15),C(2,16));
      [S(2,18),C(2,18)]=FA(C(1,17),P(3,16),C(2,17));
      %%
      
      FINAL(1,3)=S(2,3);
     
      
      f4=~(S(2,7)&P(4,4));
      f3=~(S(2,6)&P(4,3));
      f2=~(S(2,5)&P(4,2)); 
      f1=~(S(2,4)&P(4,1));
      
      
      C(3,7)=f4;
      [S(3,4),C(3,4)]=HA(S(2,4),P(4,1));
      [S(3,7),C(3,6)]=RA(S(2,7),P(4,4),C(3,7),f3);
      [S(3,6),C(3,5)]=RA(S(2,6),P(4,3),C(3,6),f2);
      [S(3,5),C(3,4)]=RA(S(2,5),P(4,2),C(3,5),f1);
      
      [S(3,8),C(3,8)]=FA(S(2,8),P(4,5),C(3,7));
      [S(3,9),C(3,9)]=FA(S(2,9),P(4,6),C(3,8));
      [S(3,10),C(3,10)]=FA(S(2,10),P(4,7),C(3,9));
      [S(3,11),C(3,11)]=FA(S(2,11),P(4,8),C(3,10));
      [S(3,12),C(3,12)]=FA(S(2,12),P(4,9),C(3,11));
      [S(3,13),C(3,13)]=FA(S(2,13),P(4,10),C(3,12));
      [S(3,14),C(3,14)]=FA(S(2,14),P(4,11),C(3,13));
      [S(3,15),C(3,15)]=FA(S(2,15),P(4,12),C(3,14));
      [S(3,16),C(3,16)]=FA(S(2,16),P(4,13),C(3,15));
      [S(3,17),C(3,17)]=FA(S(2,17),P(4,14),C(3,16));
      [S(3,18),C(3,18)]=FA(S(2,18),P(4,15),C(3,17));
      [S(3,19),C(3,19)]=FA(C(2,18),P(4,16),C(3,18));
    %%
    
        FINAL(1,4)=S(3,4);
        
      [S(4,5),C(4,5)]=HA(S(3,5),P(5,1));
      %for i=1:13
       %   [S(4,i+5),C(4,i+5)]=FA(S(3,i+5),P(5,i+1),C(4,i+4));
      %end
      
      f3=~(S(3,7)&P(5,3));
      f2=~(S(3,6)&P(5,2));
      f1=~(S(3,5)&P(5,1));
      
      C(4,7)=f3;
     
     
     [S(4,7),C(4,6)]=RA(S(3,7),P(5,3),C(4,7),f2);
     [S(4,6),C(4,5)]=RA(S(3,6),P(5,2),C(4,6),f1);
     
     [S(4,8),C(4,8)]=FA(S(3,8),P(5,4),C(4,7));
     [S(4,9),C(4,9)]=FA(S(3,9),P(5,5),C(4,8));
     [S(4,10),C(4,10)]=FA(S(3,10),P(5,6),C(4,9));
     [S(4,11),C(4,11)]=FA(S(3,11),P(5,7),C(4,10));
     [S(4,12),C(4,12)]=FA(S(3,12),P(5,8),C(4,11));
     [S(4,13),C(4,13)]=FA(S(3,13),P(5,9),C(4,12));
     [S(4,14),C(4,14)]=FA(S(3,14),P(5,10),C(4,13));
     [S(4,15),C(4,15)]=FA(S(3,15),P(5,11),C(4,14));
     [S(4,16),C(4,16)]=FA(S(3,16),P(5,12),C(4,15));
     [S(4,17),C(4,17)]=FA(S(3,17),P(5,13),C(4,16));
     [S(4,18),C(4,18)]=FA(S(3,18),P(5,14),C(4,17));
     [S(4,19),C(4,19)]=FA(S(3,19),P(5,15),C(4,18));
     [S(4,20),C(4,20)]=FA(C(3,19),P(5,16),C(4,19));
     %%
     
      FINAL(1,5)=S(4,5);
      
      f2=~(S(4,7)&P(6,2));
      f1=~(S(4,6)&P(6,1));
      
      C(5,7)=f2;
      
     [S(5,6),C(5,6)]=HA(S(4,6),P(6,1)); 
     [S(5,7),C(5,6)]=RA(S(4,7),P(6,2),C(5,7),f1);
     [S(5,8),C(5,8)]=FA(S(4,8),P(6,3),C(5,7));
     [S(5,9),C(5,9)]=FA(S(4,9),P(6,4),C(5,8));
     [S(5,10),C(5,10)]=FA(S(4,10),P(6,5),C(5,9));
     [S(5,11),C(5,11)]=FA(S(4,11),P(6,6),C(5,10));
     [S(5,12),C(5,12)]=FA(S(4,12),P(6,7),C(5,11));
     [S(5,13),C(5,13)]=FA(S(4,13),P(6,8),C(5,12));
     [S(5,14),C(5,14)]=FA(S(4,14),P(6,9),C(5,13));
     [S(5,15),C(5,15)]=FA(S(4,15),P(6,10),C(5,14));
     [S(5,16),C(5,16)]=FA(S(4,16),P(6,11),C(5,15));
     [S(5,17),C(5,17)]=FA(S(4,17),P(6,12),C(5,16));
     [S(5,18),C(5,18)]=FA(S(4,18),P(6,13),C(5,17));
     [S(5,19),C(5,19)]=FA(S(4,19),P(6,14),C(5,18));
     [S(5,20),C(5,20)]=FA(S(4,20),P(6,15),C(5,19));
     [S(5,21),C(5,21)]=FA(C(4,20),P(6,16),C(5,20));
     %%
     
     FINAL(1,6)=S(5,6);
        
     [S(6,7),C(6,7)]=HA(S(5,7),P(7,1)); 
     [S(6,8),C(6,8)]=FA(S(5,8),P(7,2),C(6,7));
     [S(6,9),C(6,9)]=FA(S(5,9),P(7,3),C(6,8));
     [S(6,10),C(6,10)]=FA(S(5,10),P(7,4),C(6,9));
     [S(6,11),C(6,11)]=FA(S(5,11),P(7,5),C(6,10));
     [S(6,12),C(6,12)]=FA(S(5,12),P(7,6),C(6,11));
     [S(6,13),C(6,13)]=FA(S(5,13),P(7,7),C(6,12));
     [S(6,14),C(6,14)]=FA(S(5,14),P(7,8),C(6,13));
     [S(6,15),C(6,15)]=FA(S(5,15),P(7,9),C(6,14));
     [S(6,16),C(6,16)]=FA(S(5,16),P(7,10),C(6,15));
     [S(6,17),C(6,17)]=FA(S(5,17),P(7,11),C(6,16));
     [S(6,18),C(6,18)]=FA(S(5,18),P(7,12),C(6,17));
     [S(6,19),C(6,19)]=FA(S(5,19),P(7,13),C(6,18));
     [S(6,20),C(6,20)]=FA(S(5,20),P(7,14),C(6,19));
     [S(6,21),C(6,21)]=FA(S(5,21),P(7,15),C(6,20));
     [S(6,22),C(6,22)]=FA(C(5,21),P(7,16),C(6,21));
     %%
     
     FINAL(1,7)=S(6,7);
     
     [S(7,8),C(7,8)]=HA(S(6,8),P(8,1)); 
     [S(7,9),C(7,9)]=FA(S(6,9),P(8,2),C(7,8));
     [S(7,10),C(7,10)]=FA(S(6,10),P(8,3),C(7,9));
     [S(7,11),C(7,11)]=FA(S(6,11),P(8,4),C(7,10));
     [S(7,12),C(7,12)]=FA(S(6,12),P(8,5),C(7,11));
     [S(7,13),C(7,13)]=FA(S(6,13),P(8,6),C(7,12));
     [S(7,14),C(7,14)]=FA(S(6,14),P(8,7),C(7,13));
     [S(7,15),C(7,15)]=FA(S(6,15),P(8,8),C(7,14));
     [S(7,16),C(7,16)]=FA(S(6,16),P(8,9),C(7,15));
     [S(7,17),C(7,17)]=FA(S(6,17),P(8,10),C(7,16));
     [S(7,18),C(7,18)]=FA(S(6,18),P(8,11),C(7,17));
     [S(7,19),C(7,19)]=FA(S(6,19),P(8,12),C(7,18));
     [S(7,20),C(7,20)]=FA(S(6,20),P(8,13),C(7,19));
     [S(7,21),C(7,21)]=FA(S(6,21),P(8,14),C(7,20));
     [S(7,22),C(7,22)]=FA(S(6,22),P(8,15),C(7,21));
     [S(7,23),C(7,23)]=FA(C(6,22),P(8,16),C(7,22));
     %%
     
    FINAL(1,8)=S(7,8);
     
     
     
      [S(8,9),C(8,9)]=HA(S(7,9),P(9,1));
      for i=1:14
         [S(8,i+9),C(8,i+9)]=FA(S(7,i+9),P(9,i+1),C(8,i+8));
      end
     [S(8,24),C(8,24)]=FA(C(7,23),P(9,16),C(8,23));
     %%
     
     FINAL(1,9)=S(8,9);
     
     
     
      [S(9,10),C(9,10)]=HA(S(8,10),P(10,1));
      for i=1:14
         [S(9,i+10),C(9,i+10)]=FA(S(8,i+10),P(10,i+1),C(9,i+9));
      end
     [S(9,25),C(9,25)]=FA(C(8,24),P(10,16),C(9,24));
     %%
     
     FINAL(1,10)=S(9,10);
     
      [S(10,11),C(10,11)]=HA(S(9,11),P(11,1));
      for i=1:14
         [S(10,i+11),C(10,i+11)]=FA(S(9,i+11),P(11,i+1),C(10,i+10));
      end
     [S(10,26),C(10,26)]=FA(C(9,25),P(11,16),C(10,25));
     %%
     
     FINAL(1,11)=S(10,11);
     
     
     [S(11,12),C(11,12)]=HA(S(10,12),P(12,1));
      for i=1:14
         [S(11,i+12),C(11,i+12)]=FA(S(10,i+12),P(12,i+1),C(11,i+11));
      end
     [S(11,27),C(11,27)]=FA(C(10,26),P(12,16),C(11,26));
     
     %%
     
     FINAL(1,12)=S(11,12);
     
     
     [S(12,13),C(12,13)]=HA(S(11,13),P(13,1));
      for i=1:14
         [S(12,i+13),C(12,i+13)]=FA(S(11,i+13),P(13,i+1),C(12,i+12));
      end
     [S(12,28),C(12,28)]=FA(C(11,27),P(13,16),C(12,27));
     %%
     
      FINAL(1,13)=S(12,13);
      
      
      [S(13,14),C(13,14)]=HA(S(12,14),P(14,1));
      for i=1:14
         [S(13,i+14),C(13,i+14)]=FA(S(12,i+14),P(14,i+1),C(13,i+13));
      end
     [S(13,29),C(13,29)]=FA(C(12,28),P(14,16),C(13,28));
     %%
     
     
      FINAL(1,14)=S(13,14);
      %for i=14:29 
       %disp(S(13,i));  end 
   %disp(C(13,29));
      
      [S(14,15),C(14,15)]=HA(S(13,15),P(15,1));
      for i=1:14
         [S(14,i+15),C(14,i+15)]=FA(S(13,i+15),P(15,i+1),C(14,i+14));
      end
     [S(14,30),C(14,30)]=FA(C(13,29),P(15,16),C(14,29));
     %%
     
     FINAL(1,15)=S(14,15);
      
      [S(15,16),C(15,16)]=HA(S(14,16),P(16,1));
      for i=1:14
         [S(15,i+16),C(15,i+16)]=FA(S(14,i+16),P(16,i+1),C(15,i+15));
      end
     [S(15,31),C(15,31)]=FA(C(14,30),P(16,16),C(15,30));
     %%
     
     FINAL(1,16)=S(15,16);
      for i=17:1:31
          FINAL(1,i)=S(15,i);
      end
      FINAL(1,32)=C(15,31);
      %disp(FINAL);
      
     prod=bi2de(FINAL);
     prod=prod/16;
     %disp(prod);
     if input1<0 && input2>0 || input1>0 && input2 <0
         %disp(1);
         prod=prod*(-1);
         %disp(prod);
     end
     
end