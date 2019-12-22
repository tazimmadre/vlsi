module tbench_top;
bit clk;
bit reset;

always #5 clk=~clk;

initial begin
    reset=1;
    #5 reset=0;
end

intf intf(clk,reset);
test t1(intf);
adder DUT(.clk(intf.clk),
        .reset(intf.reset),
        .valid(intf.valid),
        .a(intf.a),.b(intf.b),
        .c(intf.c));



initial begin 
    $dumpfile("dump.vcd"); $dumpvars;
  end


endmodule