/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : W-2024.09-SP3
// Date      : Thu Jul 17 09:54:38 2025
/////////////////////////////////////////////////////////////


module Bit_Stream ( clk, rst_n, din, lock, state );
  output [2:0] state;
  input clk, rst_n, din;
  output lock;
  wire   current_lock, n1, n2, n3, n4, n5, n6;
  wire   [2:0] current_state;
  wire   [2:0] next_state;

  SAEDRVT14_EO2_V1_0P75 U10 ( .A1(current_state[1]), .A2(current_state[0]), 
        .X(n5) );
  SAEDRVT14_AO32_1 U11 ( .A1(n2), .A2(n1), .A3(current_state[1]), .B1(n6), 
        .B2(din), .X(next_state[0]) );
  SAEDRVT14_FDPRBQ_V2_1 lock_reg ( .D(current_lock), .CK(clk), .RD(rst_n), .Q(
        lock) );
  SAEDRVT14_FDPRBQ_V2_1 current_lock_reg ( .D(next_state[2]), .CK(clk), .RD(
        rst_n), .Q(current_lock) );
  SAEDRVT14_FDPRBQ_V2_1 \state_reg[2]  ( .D(next_state[2]), .CK(clk), .RD(
        rst_n), .Q(state[2]) );
  SAEDRVT14_FDPRBQ_V2_1 \state_reg[1]  ( .D(next_state[1]), .CK(clk), .RD(
        rst_n), .Q(state[1]) );
  SAEDRVT14_FDPRBQ_V2LP_1 \state_reg[0]  ( .D(next_state[0]), .CK(clk), .RD(
        rst_n), .Q(state[0]) );
  SAEDRVT14_FDPRBQ_V2LP_1 \current_state_reg[2]  ( .D(next_state[2]), .CK(clk), 
        .RD(rst_n), .Q(current_state[2]) );
  SAEDRVT14_FDPRBQ_V2LP_1 \current_state_reg[0]  ( .D(next_state[0]), .CK(clk), 
        .RD(rst_n), .Q(current_state[0]) );
  SAEDRVT14_FDPRBQ_V2LP_1 \current_state_reg[1]  ( .D(next_state[1]), .CK(clk), 
        .RD(rst_n), .Q(current_state[1]) );
  SAEDRVT14_ND3B_0P75 U12 ( .A(current_state[1]), .B1(n2), .B2(
        current_state[2]), .X(n4) );
  SAEDRVT14_ND2_CDC_0P5 U13 ( .A1(n5), .A2(n1), .X(n3) );
  SAEDRVT14_INV_1P5 U14 ( .A(current_state[2]), .X(n1) );
  SAEDRVT14_AOI21_0P5 U15 ( .A1(current_state[2]), .A2(current_state[0]), .B(
        current_state[1]), .X(n6) );
  SAEDRVT14_INV_1P5 U16 ( .A(current_state[0]), .X(n2) );
  SAEDRVT14_AOI21_0P5 U17 ( .A1(n3), .A2(n4), .B(din), .X(next_state[1]) );
  SAEDRVT14_AN4_1 U18 ( .A1(current_state[1]), .A2(din), .A3(n1), .A4(
        current_state[0]), .X(next_state[2]) );
endmodule

