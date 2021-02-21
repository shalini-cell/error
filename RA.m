% % %% rcpfa II
function [sumI,carryI]=RA(a,b,c,f)
   tempI= ~(( a | b) & (~c));carryI=(tempI & f);  sumI=~(tempI & (~f));end
%% INAX3
%function [s,co]=RA(xi,yi,ci)
  % pi=xor(xi,yi);  gi=xi&yi;qi=pi&ci;co=qi|gi;s=~co;end
  %% IFA2
  
 %function [s,co]=RA(A,B,Ci) 
  %pi=B|Ci; co=A&pi; s=~co; end
  
%   % RCPFA I
%   function [s,co]=RA(Ai,Bi,Ci1,Fi)
%   Xi=~(Ci1|(Ai&Bi));Yi=~(Ci1&(Ai|Bi));s=~(Yi&(~Fi|Xi));co=(Xi|(Yi&Fi));end
 % rcpfa III
%  function [sumI,carryI]=RA(a,b,c,f)
%   tempI= ~(( a & b) | (~c));carryI=~(tempI | f);  sumI=~(tempI | (~f));end