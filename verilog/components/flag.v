module flag(
    input       clk,
    input       reset,
    input       clear,
    input       set,
    output wire out);

   parameter RESET_SET = 0;

   reg pending;
   always @(posedge clk) begin
      pending <= reset ? (RESET_SET ? 1'b1 : 1'b0) :
                 clear ? 1'b0 :
                 set ? 1'b1 :
                 pending;
   end

   assign out = set || pending;
   
endmodule