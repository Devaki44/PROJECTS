module LED_blink(
  input clk,
  input rst,
  output reg[15:0]LED);
  
  reg [25:0]count = 0 ;
  reg [3:0]led_index = 0 ;
  
  parameter CLK_FRE    = 50_000_000;
  parameter ONE_SECOND = CLK_FRE / 2;
  
  always @(posedge clk) begin
    if (rst) begin
      count     <= 0;
      led_index <= 0;
      LED       <= 16'b0;
    end 
    else begin
      if (count >= ONE_SECOND - 1) begin
        count     <= 0;
        led_index <= (led_index == 15) ? 0 : led_index + 1;
       	LED  	  <= 16'b0000_0000_0000_0001 << led_index ;
      end 
      else begin
        count <= count + 1;
      end
    end
  end
  endmodule
