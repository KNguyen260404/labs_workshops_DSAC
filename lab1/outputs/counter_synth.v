/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : W-2024.09-SP3
// Date      : Thu Jul  3 15:23:00 2025
/////////////////////////////////////////////////////////////


module counter_DW01_inc_0 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;

  wire   [7:2] carry;

  SAEDRVT14_ADDH_0P5 U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  SAEDRVT14_ADDH_0P5 U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  SAEDRVT14_ADDH_0P5 U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  SAEDRVT14_ADDH_0P5 U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  SAEDRVT14_ADDH_0P5 U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  SAEDRVT14_ADDH_0P5 U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  SAEDRVT14_EO2_V1_0P75 U1 ( .A1(carry[7]), .A2(A[7]), .X(SUM[7]) );
  SAEDRVT14_INV_1P5 U2 ( .A(A[0]), .X(SUM[0]) );
endmodule


module counter ( clk, rst_n, en, q );
  output [7:0] q;
  input clk, rst_n, en;
  wire   N2, N3, N4, N5, N6, N7, N8, N9, n2, n3, n4, n5, n6, n7, n8, n9, n10;

  counter_DW01_inc_0 add_14 ( .A(q), .SUM({N9, N8, N7, N6, N5, N4, N3, N2}) );
  SAEDRVT14_FDPRBQ_V2LP_1 \q_reg[1]  ( .D(n8), .CK(clk), .RD(rst_n), .Q(q[1])
         );
  SAEDRVT14_FDPRBQ_V2LP_1 \q_reg[2]  ( .D(n7), .CK(clk), .RD(rst_n), .Q(q[2])
         );
  SAEDRVT14_FDPRBQ_V2LP_1 \q_reg[3]  ( .D(n6), .CK(clk), .RD(rst_n), .Q(q[3])
         );
  SAEDRVT14_FDPRBQ_V2LP_1 \q_reg[4]  ( .D(n5), .CK(clk), .RD(rst_n), .Q(q[4])
         );
  SAEDRVT14_FDPRBQ_V2LP_1 \q_reg[5]  ( .D(n4), .CK(clk), .RD(rst_n), .Q(q[5])
         );
  SAEDRVT14_FDPRBQ_V2LP_1 \q_reg[6]  ( .D(n3), .CK(clk), .RD(rst_n), .Q(q[6])
         );
  SAEDRVT14_FDPRBQ_V2LP_1 \q_reg[0]  ( .D(n9), .CK(clk), .RD(rst_n), .Q(q[0])
         );
  SAEDRVT14_FDPRBQ_V2LP_1 \q_reg[7]  ( .D(n2), .CK(clk), .RD(rst_n), .Q(q[7])
         );
  SAEDRVT14_AO22_1 U12 ( .A1(q[7]), .A2(n10), .B1(en), .B2(N9), .X(n2) );
  SAEDRVT14_INV_1P5 U13 ( .A(en), .X(n10) );
  SAEDRVT14_AO22_1 U14 ( .A1(q[0]), .A2(n10), .B1(N2), .B2(en), .X(n9) );
  SAEDRVT14_AO22_1 U15 ( .A1(q[6]), .A2(n10), .B1(N8), .B2(en), .X(n3) );
  SAEDRVT14_AO22_1 U16 ( .A1(q[5]), .A2(n10), .B1(N7), .B2(en), .X(n4) );
  SAEDRVT14_AO22_1 U17 ( .A1(q[4]), .A2(n10), .B1(N6), .B2(en), .X(n5) );
  SAEDRVT14_AO22_1 U18 ( .A1(q[3]), .A2(n10), .B1(N5), .B2(en), .X(n6) );
  SAEDRVT14_AO22_1 U19 ( .A1(q[2]), .A2(n10), .B1(N4), .B2(en), .X(n7) );
  SAEDRVT14_AO22_1 U20 ( .A1(q[1]), .A2(n10), .B1(N3), .B2(en), .X(n8) );
endmodule

