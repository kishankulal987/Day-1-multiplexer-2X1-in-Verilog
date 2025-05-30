module MUX2x1_conditional(input [1:0]I,input s,output y);
assign y=s?I[1]:I[0];
endmodule

module MUX2X1_dataflow(input [1:0]I,input s,output y);
assign y=(I[0]&~s)|(I[1]&s);
endmodule

module  MUX2X1_gate(input [1:0]I,input s,output y);
wire ns,t0,t1;
not n1(ns,s);
and a1(t0,I[0],ns);
and a2(t1,I[1],s);
or o1(y,t0,t1);
endmodule

//testbench

module testbench();
reg [1:0]I;
reg s;
wire y_conditional;
wire y_dataflow;
wire y_gate;
MUX2x1_conditional m1(I,s,y_conditional);
MUX2X1_dataflow m2(I,s,y_dataflow);
MUX2X1_gate m3(I,s,y_gate);
initial begin
for (integer i=0;i<4;i=i+1)
    begin
    I=i;
    for(integer j=0;j<2;j=j+1)
        begin
        s=j;
        #10;
        $display("input I0=%b | I1=%b | s=%b | y_conditional=%b, y_dataflow=%b,y_gate=%b",I[0],I[1],s,y_conditional,y_dataflow,y_gate);
        end
    end
$finish;
end
endmodule

    
