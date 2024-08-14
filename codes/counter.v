
module up_down_counter (
    input clk,
    input reset,
    input up_down, // 1 for up, 0 for down
    output reg [3:0] counter
);

always @(posedge clk or posedge reset) begin
    if (reset) begin
        counter <= 4'b0000;
    end else begin
        if (up_down) begin
            counter <= counter + 1;
        end else begin
            counter <= counter - 1;
        end
    end
end

endmodule
