module Bit_Stream(
    input wire clk,
    input wire rst_n,
    input wire din,
    output reg lock,
    output reg [2:0] state
);

    // State encoding
    parameter pSTS_IDLE  = 3'd0,
              pSTS_S1_1  = 3'd1,
              pSTS_S2_0  = 3'd2,
              pSTS_S3_0  = 3'd3,
              pSTS_S4_1  = 3'd4;

    reg [2:0] current_state, next_state;
    reg current_lock, next_lock;

    // Sequential block
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            current_state <= pSTS_IDLE;
            current_lock <= 1'b0;
        end else begin
            current_state <= next_state;
            current_lock <= next_lock;
        end
    end

    // Combinational block
    always @(*) begin
        next_state = pSTS_IDLE;
        next_lock  = 1'b0;

        case (current_state)
            pSTS_IDLE: begin
                if (din) begin
                    next_state = pSTS_S1_1;
                    next_lock  = 1'b0;
                end else begin
                    next_state = current_state;
                    next_lock  = 1'b0;
                end
            end

            pSTS_S1_1: begin
                if (!din) begin
                    next_state = pSTS_S2_0;
                    next_lock  = 1'b0;
                end else begin
                    next_state = pSTS_S1_1;
                    next_lock  = 1'b0;
                end
            end

            pSTS_S2_0: begin
                if (!din) begin
                    next_state = pSTS_S3_0;
                    next_lock  = 1'b0;
                end else begin
                    next_state = pSTS_S1_1;
                    next_lock  = 1'b0;
                end
            end

            pSTS_S3_0: begin
                if (din) begin
                    next_state = pSTS_S4_1;
                    next_lock  = 1'b1;
                end else begin
                    next_state = pSTS_IDLE;
                    next_lock  = 1'b0;
                end
            end

            pSTS_S4_1: begin
                if (din) begin
                    next_state = pSTS_S1_1;
                    next_lock  = 1'b0;
                end else begin
                    next_state = pSTS_S2_0;
                    next_lock  = 1'b0;
                end
            end

            default: begin
                next_state = pSTS_IDLE;
                next_lock  = 1'b0;
            end
        endcase
    end

    // Output assignment
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            state <= pSTS_IDLE;
        else
            state <= next_state;
    end

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            lock <= 1'b0;
        else
            lock <= current_lock;
    end

endmodule


