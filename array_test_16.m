 
count = 0;
count1 = 0; 
count2 = 0;

for a = 1:65535
   for b = 1:65535
      output1 = array_16_6(a,b);
%     output1=array_8_rcpfa_7(a,b);
%        output1=array_8_rcpfa_6(a,b);
        % output1=array_8_rcpfa_5(a,b);
          %output1=array_8_rcpfa(a,b);
       output2 = a*b;
       value = abs(output1 - output2);        
       count = count + value;
       count1 = count1 + (value/output2);
       count3=count/(a*b);
   end
end
 MRED = count1/(6000*6000)
 MED=count/(6000*6000)
 NMED=count/(5999*5999)/(6000*6000)
% % disp(MRED);
% disp(ER);
% disp(count);

