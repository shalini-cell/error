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