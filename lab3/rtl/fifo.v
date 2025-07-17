module fifo #(
    parameter DATASIZE = 8, 
    parameter DEPTH = 16,
    parameter PTR_WIDTH = 4
)
(
    output [DATASIZE-1:0] data_out,
    output fifo_full,
    output fifo_empty,
    output fifo_overflow_flag,
    output fifo_underflow_flag,
    input clk,
    input rst_n,
    input w_en,
    input r_en,
    input [DATASIZE-1:0] data_in
);
    wire [PTR_WIDTH:0] w_ptr, r_ptr;
    wire fifo_w_en, fifo_r_en;

    Write_pointer #(
        .DATASIZE(DATASIZE),
        .DEPTH(DEPTH),
        .PTR_WIDTH(PTR_WIDTH)
    ) write_pointer (
        .w_en(w_en),
        .rst_n(rst_n),
        .clk(clk),
        .fifo_full(fifo_full),
        .fifo_w_en(fifo_w_en),
        .w_ptr(w_ptr)
    );

    Read_pointer #(
        .DATASIZE(DATASIZE),
        .DEPTH(DEPTH),
        .PTR_WIDTH(PTR_WIDTH)
    ) read_pointer (
        .r_en(r_en),
        .rst_n(rst_n),
        .clk(clk),
        .fifo_empty(fifo_empty),
        .fifo_r_en(fifo_r_en),
        .r_ptr(r_ptr)
    );

    Memory_Array #(
        .DATASIZE(DATASIZE),
        .DEPTH(DEPTH),
        .PTR_WIDTH(PTR_WIDTH)
    ) memory_array (
        .clk(clk),
        .rst_n(rst_n),
        .fifo_w_en(fifo_w_en),
        .w_ptr(w_ptr),
        .r_ptr(r_ptr),
        .data_in(data_in),
        .data_out(data_out)
    );

    Memory_State #(
        .DATASIZE(DATASIZE),
        .DEPTH(DEPTH),
        .PTR_WIDTH(PTR_WIDTH)
    ) memory_state (
        .fifo_full(fifo_full),
        .fifo_empty(fifo_empty),
        .fifo_overflow_flag(fifo_overflow_flag),
        .fifo_underflow_flag(fifo_underflow_flag),
        .w_en(w_en),
        .r_en(r_en),
        .fifo_w_en(fifo_w_en),
        .fifo_r_en(fifo_r_en),
        .w_ptr(w_ptr),
        .r_ptr(r_ptr),
        .clk(clk),
        .rst_n(rst_n)
    );
endmodule
module Write_pointer #(
    parameter DATASIZE = 8, 
    parameter DEPTH = 16,
    parameter PTR_WIDTH = 4
)
(
    input w_en,
    input fifo_full,
    input clk,
    input rst_n,
    output reg [PTR_WIDTH:0] w_ptr,
    output wire fifo_w_en
);
    assign fifo_w_en = (~fifo_full) & w_en;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            w_ptr <= 0;
        else if (fifo_w_en)
            w_ptr <= w_ptr + 1;
    end
endmodule

module Read_pointer #(
    parameter DATASIZE = 8, 
    parameter DEPTH = 16,
    parameter PTR_WIDTH = 4
)
(
    input r_en,
    input fifo_empty,
    input clk,
    input rst_n,
    output reg [PTR_WIDTH:0] r_ptr,
    output wire fifo_r_en
);
    assign fifo_r_en = (~fifo_empty) & r_en;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            r_ptr <= 0;
        else if (fifo_r_en)
            r_ptr <= r_ptr + 1;
    end
endmodule

module Memory_Array #(
    parameter DATASIZE = 8, 
    parameter DEPTH = 16,
    parameter PTR_WIDTH = 4
)
(
    input wire clk,
    input wire rst_n,
    input wire fifo_w_en,
    input wire [PTR_WIDTH:0] w_ptr,
    input wire [PTR_WIDTH:0] r_ptr,
    input wire [DATASIZE-1:0] data_in,
    output wire [DATASIZE-1:0] data_out
);
    // Flattened memory array: DEPTH x DATASIZE = 128 bits total
    reg [DATASIZE*DEPTH-1:0] mem_flat;
    wire [PTR_WIDTH-1:0] w_addr = w_ptr[PTR_WIDTH-1:0];
    wire [PTR_WIDTH-1:0] r_addr = r_ptr[PTR_WIDTH-1:0];

    integer i;

    always @(posedge clk) begin
        if (fifo_w_en) begin
            for (i = 0; i < DEPTH; i = i + 1) begin
                if (i == w_addr)
                    mem_flat[i*DATASIZE +: DATASIZE] <= data_in;
            end
        end
    end

    assign data_out = mem_flat[r_addr*DATASIZE +: DATASIZE];
endmodule

module Memory_State #(
    parameter DATASIZE = 8, 
    parameter DEPTH = 16,
    parameter PTR_WIDTH = 4
)
(
    output reg fifo_full,
    output reg fifo_empty,
    output reg fifo_overflow_flag,
    output reg fifo_underflow_flag,
    input w_en,
    input r_en,
    input fifo_w_en,
    input fifo_r_en,
    input wire [PTR_WIDTH:0] w_ptr,
    input wire [PTR_WIDTH:0] r_ptr,
    input clk,
    input rst_n
);
    wire msb_diff, lsb_equal;
    wire fifo_overflow_set, fifo_underflow_set;

    assign msb_diff = w_ptr[PTR_WIDTH] ^ r_ptr[PTR_WIDTH];
    assign lsb_equal = (w_ptr[PTR_WIDTH-1:0] == r_ptr[PTR_WIDTH-1:0]);
    assign fifo_overflow_set = fifo_full & w_en;
    assign fifo_underflow_set = fifo_empty & r_en;

    always @(*) begin
        fifo_full  = msb_diff & lsb_equal;
        fifo_empty = (~msb_diff) & lsb_equal;
    end

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            fifo_overflow_flag <= 0;
        else if (fifo_overflow_set && !fifo_r_en)
            fifo_overflow_flag <= 1;
        else if (fifo_r_en)
            fifo_overflow_flag <= 0;
    end

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            fifo_underflow_flag <= 0;
        else if (fifo_underflow_set && !fifo_w_en)
            fifo_underflow_flag <= 1;
        else if (fifo_w_en)
            fifo_underflow_flag <= 0;
    end
endmodule



