`timescale 1ns/1ns
`include "johnson.v"


module johnson_counter_tb;

reg clock;
reg reset;
wire [3:0] counter_state;

// Instantiate the Johnson counter module
johnson_counter dut (
    .clock(clock),
    .reset(reset),
    .counter_state(counter_state)
);

// Clock generation
initial begin
    clock = 0;
    forever #5 clock = ~clock;
end

// Reset generation
initial begin
    reset = 1;
    #10 reset = 0;
    #20 reset = 1;
    #30 reset = 0;
    // Add more reset pulses as needed
end

// Monitor for observing the counter state changes
always @(posedge clock) begin
    $display("Counter State: %b", counter_state);
end

endmodule
