function [sum]=carry_propagation(in1,cor)
    cy=zeros(1,19);
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
    [sum(11),cy(11)]=ha(in1(11),cy(10));
    [sum(12),cy(12)]=ha(in1(12),cy(11));
    [sum(13),cy(13)]=ha(in1(13),cy(12));
    [sum(14),cy(14)]=ha(in1(14),cy(13));
    [sum(15),cy(15)]=ha(in1(15),cy(14));
    [sum(16),cy(16)]=ha(in1(16),cy(15));
    [sum(17),cy(17)]=ha(in1(17),cy(16));
    [sum(18),cy(18)]=ha(in1(18),cy(17));
   
end