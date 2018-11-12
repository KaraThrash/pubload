

module oneadder(a,b,c,s,cout);
input a,b,c;
output s,cout;
wire w1, w2, w3, w4, s;


xor #1 g1(w1, a, b);
xor #1 g2(s, w1, c);
 and #1 g3(w2, c, b);
 and #1 g4(w3, c, a);
 and #1 g5(w4, a, b);
or #1 g6(cout, w2, w3, w4);
endmodule

module fulladder(x,y,s,cout,cin);
input [15:0] y;
input [15:0] x;
output [15:0] s;
input cin;
output cout;
wire c[15:0];

 oneadder f0 (x[0],y[0],cin,s[0],c[0]);
 oneadder f1 (x[1],y[1],c[0],s[1],c[1]);
 oneadder f2 (x[2],y[2],c[1],s[2],c[2]);
 oneadder f3 (x[3],y[3],c[2],s[3],c[3]);
oneadder f4 (x[4],y[4],c[3],s[4],c[4]);
 oneadder f5 (x[5],y[5],c[4],s[5],c[5]);
 oneadder f6 (x[6],y[6],c[5],s[6],c[6]);
 oneadder f7 (x[7],y[7],c[6],s[7],c[7]);
oneadder f8 (x[8],y[8],c[7],s[8],c[8]);
 oneadder f9 (x[9],y[9],c[8],s[9],c[9]);
 oneadder f10 (x[10],y[10],c[9],s[10],c[10]);
 oneadder f11 (x[11],y[11],c[10],s[11],c[11]);
oneadder f12 (x[12],y[12],c[12],s[12],c[12]);
 oneadder f13 (x[13],y[13],c[13],s[13],c[13]);
 oneadder f14 (x[14],y[14],c[14],s[14],c[14]);
 oneadder f15 (x[15],y[15],c[15],s[15],cout);
endmodule

module andmod(x,y,s,opcode);
input [15:0] y;
input [15:0] x;
input [2:0] opcode;
output [15:0] s;
and #1 a0(s[0],x[0],y[0]);
and #1 a1(s[1],x[1],y[1]);
and #1 a2(s[2],x[2],y[2]);
and #1 a3(s[3],x[3],y[3]);
and #1 a4(s[4],x[4],y[4]);
and #1 a5(s[5],x[5],y[5]);
and #1 a6(s[6],x[6],y[6]);
and #1 a7(s[7],x[7],y[7]);
and #1 a8(s[8],x[8],y[8]);
and #1 a9(s[9],x[9],y[9]);
and #1 a10(s[10],x[10],y[10]);
and #1 a11(s[11],x[11],y[11]);
and #1 a12(s[12],x[12],y[12]);
and #1 a13(s[13],x[13],y[13]);
and #1 a14(s[14],x[14],y[14]);
and #1 a15(s[15],x[15],y[15]);
endmodule

module ormod(x,y,s);
input [15:0] y;
input [15:0] x;
output [15:0] s;
or #1 a0(s[0],x[0],y[0]);
or #1 a1(s[1],x[1],y[1]);
or #1 a2(s[2],x[2],y[2]);
or #1 a3(s[3],x[3],y[3]);
or #1 a4(s[4],x[4],y[4]);
or #1 a5(s[5],x[5],y[5]);
or #1 a6(s[6],x[6],y[6]);
or #1 a7(s[7],x[7],y[7]);
or #1 a8(s[8],x[8],y[8]);
or #1 a9(s[9],x[9],y[9]);
or #1 a10(s[10],x[10],y[10]);
or #1 a11(s[11],x[11],y[11]);
or #1 a12(s[12],x[12],y[12]);
or #1 a13(s[13],x[13],y[13]);
or #1 a14(s[14],x[14],y[14]);
or #1 a15(s[15],x[15],y[15]);
endmodule




module subtract(x,y,s,cin);
input [15:0] y;
input [15:0] x;
output [15:0] s;
output [15:0]ycomp;
input [15:0]cin;
output [15:0]c;
input [15:0]yneg;
integer zero = 16'b0;
xor #1 (yneg[0],y[0],1);
xor #1 (yneg[1],y[1],1);
xor #1 (yneg[2],y[2],1);
xor #1 (yneg[3],y[3],1);
xor #1 (yneg[4],y[4],1);
xor #1 (yneg[5],y[5],1);
xor #1 (yneg[6],y[6],1);
xor #1 (yneg[7],y[7],1);
xor #1 (yneg[8],y[8],1);
xor #1 (yneg[9],y[9],1);
xor #1 (yneg[10],y[10],1);
xor #1 (yneg[11],y[11],1);
xor #1 (yneg[12],y[12],1);
xor #1 (yneg[13],y[13],1);
xor #1 (yneg[14],y[14],1);
xor #1 (yneg[15],y[15],1);
fulladder fulladd(yneg,zero,ycomp,c,cin);
fulladder fulladd2(x,ycomp,s,cout,zero);

endmodule

module muxselector(funcitonin,op0,op1,op2,soutput);
input [15:0] funcitonin;
input op0,op1,op2;
output [15:0] soutput;
and #1 s1(soutput[0],funcitonin[0],op0,op1,op2);
and #1 s1(soutput[1],funcitonin[1],op0,op1,op2);
and #1 s1(soutput[2],funcitonin[2],op0,op1,op2);
and #1 s1(soutput[3],funcitonin[3],op0,op1,op2);
and #1 s1(soutput[4],funcitonin[4],op0,op1,op2);
and #1 s1(soutput[5],funcitonin[5],op0,op1,op2);
and #1 s1(soutput[6],funcitonin[6],op0,op1,op2);
and #1 s1(soutput[7],funcitonin[7],op0,op1,op2);
and #1 s1(soutput[8],funcitonin[8],op0,op1,op2);
and #1 s1(soutput[9],funcitonin[9],op0,op1,op2);
and #1 s1(soutput[10],funcitonin[10],op0,op1,op2);
and #1 s1(soutput[11],funcitonin[11],op0,op1,op2);
and #1 s1(soutput[12],funcitonin[12],op0,op1,op2);
and #1 s1(soutput[13],funcitonin[13],op0,op1,op2);
and #1 s1(soutput[14],funcitonin[14],op0,op1,op2);
and #1 s1(soutput[15],funcitonin[15],op0,op1,op2);



endmodule

module aluIn(x,y,opcode,s);
input [15:0] y;
input [15:0] x;
input [2:0]opcode;
output [15:0] s;
wire extra;
wire [15:0]sltres;
wire [15:0]andres;
wire [15:0]orres;
wire [15:0]addres;
wire [15:0]subres;
wire [15:0]andres2;
wire [15:0]orres2;
wire [15:0]addres2;
wire [15:0]subres2;
output cout;

andmod and0(x,y,andres,opcode);
muxselector andmux(andres,~opcode[0],~opcode[1],~opcode[2],andres2);

ormod or0(x,y,orres);
muxselector ormux(orres,opcode[0],~opcode[1],~opcode[2],orres2);
fulladder addition(x,y,addres,cout,opcode[1]);
muxselector addmux(addres,~opcode[0],opcode[1],~opcode[2],addres2);
subtract fulladd(x,y,subres,opcode[2]);
and #1 slt(sltres[0],opcode[0],opcode[1],opcode[2],subres[8]);
muxselector submux(subres,~opcode[0],opcode[1],opcode[2],subres2);


or #1 aluresult(s[0],andres2[0],orres2[0],addres2[0],subres2[0],sltres[0]);
or #1 aluresult(s[1],andres2[1],orres2[1],addres2[1],subres2[1]);
or #1 aluresult(s[2],andres2[2],orres2[2],addres2[2],subres2[2]);
or #1 aluresult(s[3],andres2[3],orres2[3],addres2[3],subres2[3]);

or #1 aluresult(s[4],andres2[4],orres2[4],addres2[4],subres2[4]);
or #1  aluresult(s[5],andres2[5],orres2[5],addres2[5],subres2[5]);
or #1 aluresult(s[6],andres2[6],orres2[6],addres2[6],subres2[6]);
or #1 aluresult(s[7],andres2[7],orres2[7],addres2[7],subres2[7]);

or #1 aluresult(s[8],andres2[8],orres2[8],addres2[8],subres2[8]);
or #1 aluresult(s[9],andres2[9],orres2[9],addres2[9],subres2[9]);
or #1 aluresult(s[10],andres2[10],orres2[10],addres2[10],subres2[10]);
or #1 aluresult(s[11],andres2[11],orres2[11],addres2[11],subres2[11]);

or #1 aluresult(s[12],andres2[12],orres2[12],addres2[12],subres2[12]);
or #1 aluresult(s[13],andres2[13],orres2[13],addres2[13],subres2[13]);
or #1 aluresult(s[14],andres2[14],orres2[14],addres2[14],subres2[14]);
or #1 aluresult(s[15],andres2[15],orres2[15],addres2[15],subres2[15]);
endmodule 
