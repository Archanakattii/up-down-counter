module tb_up_down_counter;

reg clk;
reg reset;
reg up_down;
wire [3:0] counter;

up_down_counter udc (
    .clk(clk),
    .reset(reset),
    .up_down(up_down),
    .counter(counter)
);

// Clock generation
always begin
    #5 clk = ~clk; // 10ns period clock
end

initial begin
    // Initialize signals
    clk = 0;
    reset = 0;
    up_down = 0;

    // Apply reset
    reset = 1;
    #10;
    reset = 0;
    #10;

    // Test up counting
    up_down = 1;
    #100;

    // Test down counting
    up_down = 0;
    #100;

    // Apply reset again
    reset = 1;
    #10;
    reset = 0;

    // Finish simulation
    #20;
    $stop;
end

initial begin
    // Monitor the output
    $monitor("Time=%0t : reset=%b up_down=%b counter=%b", $time, reset, up_down, counter);
end

endmodule
