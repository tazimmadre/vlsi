class generator;

 transaction trans;

mailbox gen2driv;

event ended;

int repeat_count;   

function new(mailbox gen2driv);
    this.gen2driv=gen2driv;
endfunction


task main();
    repeat(repeat_count) begin
    trans = new();
    if( !trans.randomize() ) $fatal("Gen:: trans randomization failed");
        gen2driv.put(trans);
    end
    -> ended; //triggering indicatesthe end of generation
  endtask
endclass
