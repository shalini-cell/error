module decoder_9(dec,negi,onei,twoi,mc);
output [8:0] dec;
input negi,onei,twoi;
input [7:0] mc;
wire [7:-1] x;
wire [7:-1] nx;
wire twoib,oneib;
assign x[7:0]=mc;
assign x[-1]=1'b0;
assign nx[-1]=~(x[-1]^negi);
assign twoib=~twoi;
assign oneib=~onei;
decoder_1 d1(dec[0],nx[0],nx[-1],twoib,x[0],negi,oneib);
decoder_1 d2(dec[1],nx[1],nx[0],twoib,x[1],negi,oneib);
decoder_1 d3(dec[2],nx[2],nx[1],twoib,x[2],negi,oneib);
decoder_1 d4(dec[3],nx[3],nx[2],twoib,x[3],negi,oneib);
decoder_1 d5(dec[4],nx[4],nx[3],twoib,x[4],negi,oneib);
decoder_1 d6(dec[5],nx[5],nx[4],twoib,x[5],negi,oneib);
decoder_1 d7(dec[6],nx[6],nx[5],twoib,x[6],negi,oneib);
decoder_1 d8(dec[7],nx[7],nx[6],twoib,x[7],negi,oneib);
decoder_1 d9(dec[8],nx[7],nx[7],twoib,x[7],negi,oneib);
endmodule

module decoder_1(pp,nx,nxn,tb,y,ni,ob);
output pp,nx;
input nxn,tb,y,ni,ob;
assign nx=~(y^ni);
assign pp=~((tb | nxn)& (nx | ob));
endmodule