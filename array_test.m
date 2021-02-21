 
count = 0;
count1 = 0; 
count2 = 0;

for a = 1:255
   for b = 1:255
      %output1 = array_8_rcpfa_8(a,b);
%     output1=array_8_rcpfa_7(a,b);
%        output1=array_8_rcpfa_6(a,b);
        % output1=array_8_rcpfa_5(a,b);
          %output1=array_8_rcpfa(a,b);
          output1=radix4_8_RCPFAI_5(a,b);
       output2 = a*b;
       value = abs(output1 - output2);        
       count = count + value;
       count1 = count1 + (value/output2);
       count3=count/(a*b);
   end
end
 MRED = count1/(255*255)
 MED=count/(255*255)
 NMED=count/(254*254)/(255*255)
% % disp(MRED);
% disp(ER);
% disp(count);

