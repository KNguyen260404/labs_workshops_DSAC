/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : W-2024.09-SP3
// Date      : Thu Jul 17 10:36:42 2025
/////////////////////////////////////////////////////////////


module Write_pointer_DATASIZE8_DEPTH16_PTR_WIDTH4 ( w_en, fifo_full, clk, 
        rst_n, w_ptr, fifo_w_en );
  output [4:0] w_ptr;
  input w_en, fifo_full, clk, rst_n;
  output fifo_w_en;
  wire   N2, N3, N4, N5, N6, n1, n2, n3, n4, n5, n6, \add_99/carry[4] ,
         \add_99/carry[3] , \add_99/carry[2] ;

  SAEDRVT14_FDPRBQ_V2LP_1 \w_ptr_reg[4]  ( .D(n2), .CK(clk), .RD(rst_n), .Q(
        w_ptr[4]) );
  SAEDRVT14_FDPRBQ_V2LP_1 \w_ptr_reg[2]  ( .D(n4), .CK(clk), .RD(rst_n), .Q(
        w_ptr[2]) );
  SAEDRVT14_FDPRBQ_V2LP_1 \w_ptr_reg[1]  ( .D(n5), .CK(clk), .RD(rst_n), .Q(
        w_ptr[1]) );
  SAEDRVT14_FDPRBQ_V2LP_1 \w_ptr_reg[0]  ( .D(n6), .CK(clk), .RD(rst_n), .Q(
        w_ptr[0]) );
  SAEDRVT14_FDPRBQ_V2LP_1 \w_ptr_reg[3]  ( .D(n3), .CK(clk), .RD(rst_n), .Q(
        w_ptr[3]) );
  SAEDRVT14_ADDH_0P5 \add_99/U1_1_2  ( .A(w_ptr[2]), .B(\add_99/carry[2] ), 
        .CO(\add_99/carry[3] ), .S(N4) );
  SAEDRVT14_ND2B_U_0P5 U3 ( .A(fifo_full), .B(w_en), .X(n1) );
  SAEDRVT14_AO22_1 U4 ( .A1(N5), .A2(fifo_w_en), .B1(w_ptr[3]), .B2(n1), .X(n3) );
  SAEDRVT14_AO22_1 U5 ( .A1(N3), .A2(fifo_w_en), .B1(w_ptr[1]), .B2(n1), .X(n5) );
  SAEDRVT14_AO22_1 U6 ( .A1(N2), .A2(fifo_w_en), .B1(w_ptr[0]), .B2(n1), .X(n6) );
  SAEDRVT14_INV_1P5 U7 ( .A(w_ptr[0]), .X(N2) );
  SAEDRVT14_ADDH_0P5 U8 ( .A(w_ptr[1]), .B(w_ptr[0]), .CO(\add_99/carry[2] ), 
        .S(N3) );
  SAEDRVT14_ADDH_0P5 U9 ( .A(w_ptr[3]), .B(\add_99/carry[3] ), .CO(
        \add_99/carry[4] ), .S(N5) );
  SAEDRVT14_INV_PS_1 U10 ( .A(n1), .X(fifo_w_en) );
  SAEDRVT14_AO22_1 U11 ( .A1(N6), .A2(fifo_w_en), .B1(w_ptr[4]), .B2(n1), .X(
        n2) );
  SAEDRVT14_AO22_1 U12 ( .A1(N4), .A2(fifo_w_en), .B1(w_ptr[2]), .B2(n1), .X(
        n4) );
  SAEDRVT14_EO2_V1_0P75 U13 ( .A1(\add_99/carry[4] ), .A2(w_ptr[4]), .X(N6) );
endmodule


module Read_pointer_DATASIZE8_DEPTH16_PTR_WIDTH4 ( r_en, fifo_empty, clk, 
        rst_n, r_ptr, fifo_r_en );
  output [4:0] r_ptr;
  input r_en, fifo_empty, clk, rst_n;
  output fifo_r_en;
  wire   N2, N3, N4, N5, N6, n1, n2, n3, n4, n5, n6, \add_122/carry[4] ,
         \add_122/carry[3] , \add_122/carry[2] ;

  SAEDRVT14_ND2B_U_0P5 U9 ( .A(fifo_empty), .B(r_en), .X(n1) );
  SAEDRVT14_FDPRBQ_V2LP_1 \r_ptr_reg[4]  ( .D(n2), .CK(clk), .RD(rst_n), .Q(
        r_ptr[4]) );
  SAEDRVT14_FDPRBQ_V2LP_1 \r_ptr_reg[3]  ( .D(n3), .CK(clk), .RD(rst_n), .Q(
        r_ptr[3]) );
  SAEDRVT14_FDPRBQ_V2LP_1 \r_ptr_reg[2]  ( .D(n4), .CK(clk), .RD(rst_n), .Q(
        r_ptr[2]) );
  SAEDRVT14_FDPRBQ_V2LP_1 \r_ptr_reg[0]  ( .D(n6), .CK(clk), .RD(rst_n), .Q(
        r_ptr[0]) );
  SAEDRVT14_FDPRBQ_V2LP_1 \r_ptr_reg[1]  ( .D(n5), .CK(clk), .RD(rst_n), .Q(
        r_ptr[1]) );
  SAEDRVT14_ADDH_0P5 \add_122/U1_1_3  ( .A(r_ptr[3]), .B(\add_122/carry[3] ), 
        .CO(\add_122/carry[4] ), .S(N5) );
  SAEDRVT14_INV_1P5 U3 ( .A(n1), .X(fifo_r_en) );
  SAEDRVT14_ADDH_0P5 U4 ( .A(r_ptr[1]), .B(r_ptr[0]), .CO(\add_122/carry[2] ), 
        .S(N3) );
  SAEDRVT14_AO22_1 U5 ( .A1(N4), .A2(fifo_r_en), .B1(r_ptr[2]), .B2(n1), .X(n4) );
  SAEDRVT14_AO22_1 U6 ( .A1(N5), .A2(fifo_r_en), .B1(r_ptr[3]), .B2(n1), .X(n3) );
  SAEDRVT14_AO22_1 U7 ( .A1(N6), .A2(fifo_r_en), .B1(r_ptr[4]), .B2(n1), .X(n2) );
  SAEDRVT14_AO22_1 U8 ( .A1(N3), .A2(fifo_r_en), .B1(r_ptr[1]), .B2(n1), .X(n5) );
  SAEDRVT14_AO22_1 U10 ( .A1(N2), .A2(fifo_r_en), .B1(r_ptr[0]), .B2(n1), .X(
        n6) );
  SAEDRVT14_INV_1P5 U11 ( .A(r_ptr[0]), .X(N2) );
  SAEDRVT14_ADDH_0P5 U12 ( .A(r_ptr[2]), .B(\add_122/carry[2] ), .CO(
        \add_122/carry[3] ), .S(N4) );
  SAEDRVT14_EO2_V1_0P75 U13 ( .A1(\add_122/carry[4] ), .A2(r_ptr[4]), .X(N6)
         );
endmodule


module Memory_Array_DATASIZE8_DEPTH16_PTR_WIDTH4 ( clk, rst_n, fifo_w_en, 
        w_ptr, r_ptr, data_in, data_out );
  input [4:0] w_ptr;
  input [4:0] r_ptr;
  input [7:0] data_in;
  output [7:0] data_out;
  input clk, rst_n, fifo_w_en;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127, n128, n159, n160, n161, n162, n163,
         n164, n165, n166, n167, n168, n169, n170, n171, n172, n173, n174,
         n175, n176, n177, n178, n179, n180, n181, n182, n183, n184, n185,
         n186, n187, n188, n189, n190, n191, n192, n193, n194, n195, n196,
         n197, n198, n199, n200, n201, n202, n203, n204, n205, n206, n207,
         n208, n209, n210, n211, n212, n213, n214, n215, n216, n217, n218,
         n219, n220, n221, n222, n223, n224, n225, n226, n227, n228, n229,
         n230, n231, n232, n233, n234, n235, n236, n237, n238, n239, n240,
         n241, n242, n243, n244, n245, n246, n247, n248, n249, n250, n251,
         n252, n253, n254, n255, n256, n257, n258, n259, n260, n261, n262,
         n263, n264, n265, n266, n267, n268, n269, n270, n271, n272, n273,
         n274, n275, n276, n277, n278, n279, n280, n281, n282, n283, n284,
         n285, n286, n287, n288, n289, n290, n291, n292, n293, n294, n295,
         n296, n297, n298, n299, n300, n301, n302, n303, n304, n305, n306,
         n307, n308, n309, n310, n311, n312, n313, n314, n315, n316, n317,
         n318, n319, n320, n321, n322, n323, n324, n325, n326, n327, n328,
         n329, n330, n331, n332, n333, n334, n335, n336, n337, n338, n339,
         n340, n341, n342, n343, n344, n345, n346, n347, n348, n349, n350,
         n351, n352, n353, n354, n355, n356, n357, n358, n359, n360, n361,
         n362, n363, n364, n365, n366, n367, n368, n369, n370, n371, n372,
         n373, n374, n375, n376, n377, n378, n379, n380, n381, n382, n383,
         n384, n385, n386, n387, n388, n389, n390, n391, n392, n393, n394,
         n395, n396, n397, n398, n399, n400, n401, n402, n403, n404, n129,
         n130, n131, n132, n133, n134, n135, n136, n137, n138, n139, n140,
         n141, n142, n143, n144, n145, n146, n147, n148, n149, n150, n151,
         n152, n153, n154, n155, n156, n157, n158, n405, n406;

  SAEDRVT14_OR4_1 U270 ( .A1(n187), .A2(n188), .A3(n189), .A4(n190), .X(n186)
         );
  SAEDRVT14_OR4_1 U271 ( .A1(n199), .A2(n200), .A3(n201), .A4(n202), .X(n185)
         );
  SAEDRVT14_OR4_1 U272 ( .A1(n205), .A2(n206), .A3(n207), .A4(n208), .X(n204)
         );
  SAEDRVT14_OR4_1 U273 ( .A1(n209), .A2(n210), .A3(n211), .A4(n212), .X(n203)
         );
  SAEDRVT14_OR4_1 U274 ( .A1(n215), .A2(n216), .A3(n217), .A4(n218), .X(n214)
         );
  SAEDRVT14_OR4_1 U275 ( .A1(n219), .A2(n220), .A3(n221), .A4(n222), .X(n213)
         );
  SAEDRVT14_OR4_1 U276 ( .A1(n225), .A2(n226), .A3(n227), .A4(n228), .X(n224)
         );
  SAEDRVT14_OR4_1 U277 ( .A1(n229), .A2(n230), .A3(n231), .A4(n232), .X(n223)
         );
  SAEDRVT14_OR4_1 U278 ( .A1(n235), .A2(n236), .A3(n237), .A4(n238), .X(n234)
         );
  SAEDRVT14_OR4_1 U279 ( .A1(n239), .A2(n240), .A3(n241), .A4(n242), .X(n233)
         );
  SAEDRVT14_OR4_1 U280 ( .A1(n245), .A2(n246), .A3(n247), .A4(n248), .X(n244)
         );
  SAEDRVT14_OR4_1 U281 ( .A1(n249), .A2(n250), .A3(n251), .A4(n252), .X(n243)
         );
  SAEDRVT14_OR4_1 U282 ( .A1(n255), .A2(n256), .A3(n257), .A4(n258), .X(n254)
         );
  SAEDRVT14_OR4_1 U283 ( .A1(n259), .A2(n260), .A3(n261), .A4(n262), .X(n253)
         );
  SAEDRVT14_OR4_1 U284 ( .A1(n265), .A2(n266), .A3(n267), .A4(n268), .X(n264)
         );
  SAEDRVT14_OR4_1 U285 ( .A1(n269), .A2(n270), .A3(n271), .A4(n272), .X(n263)
         );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[55]  ( .D(n332), .CK(clk), .QN(n73) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[54]  ( .D(n331), .CK(clk), .QN(n74) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[53]  ( .D(n330), .CK(clk), .QN(n75) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[52]  ( .D(n329), .CK(clk), .QN(n76) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[49]  ( .D(n326), .CK(clk), .QN(n79) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[48]  ( .D(n325), .CK(clk), .QN(n80) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[51]  ( .D(n328), .CK(clk), .QN(n77) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[50]  ( .D(n327), .CK(clk), .QN(n78) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[127]  ( .D(n404), .CK(clk), .QN(n1) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[126]  ( .D(n403), .CK(clk), .QN(n2) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[125]  ( .D(n402), .CK(clk), .QN(n3) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[124]  ( .D(n401), .CK(clk), .QN(n4) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[123]  ( .D(n400), .CK(clk), .QN(n5) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[122]  ( .D(n399), .CK(clk), .QN(n6) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[47]  ( .D(n324), .CK(clk), .QN(n81) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[46]  ( .D(n323), .CK(clk), .QN(n82) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[45]  ( .D(n322), .CK(clk), .QN(n83) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[44]  ( .D(n321), .CK(clk), .QN(n84) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[75]  ( .D(n352), .CK(clk), .QN(n53) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[74]  ( .D(n351), .CK(clk), .QN(n54) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[73]  ( .D(n350), .CK(clk), .QN(n55) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[72]  ( .D(n349), .CK(clk), .QN(n56) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[121]  ( .D(n398), .CK(clk), .QN(n7) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[120]  ( .D(n397), .CK(clk), .QN(n8) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[7]  ( .D(n284), .CK(clk), .QN(n121) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[6]  ( .D(n283), .CK(clk), .QN(n122) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[5]  ( .D(n282), .CK(clk), .QN(n123) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[4]  ( .D(n281), .CK(clk), .QN(n124) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[3]  ( .D(n280), .CK(clk), .QN(n125) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[2]  ( .D(n279), .CK(clk), .QN(n126) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[1]  ( .D(n278), .CK(clk), .QN(n127) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[0]  ( .D(n277), .CK(clk), .QN(n128) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[39]  ( .D(n316), .CK(clk), .QN(n89) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[38]  ( .D(n315), .CK(clk), .QN(n90) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[37]  ( .D(n314), .CK(clk), .QN(n91) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[36]  ( .D(n313), .CK(clk), .QN(n92) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[35]  ( .D(n312), .CK(clk), .QN(n93) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[34]  ( .D(n311), .CK(clk), .QN(n94) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[33]  ( .D(n310), .CK(clk), .QN(n95) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[32]  ( .D(n309), .CK(clk), .QN(n96) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[23]  ( .D(n300), .CK(clk), .QN(n105) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[22]  ( .D(n299), .CK(clk), .QN(n106) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[21]  ( .D(n298), .CK(clk), .QN(n107) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[20]  ( .D(n297), .CK(clk), .QN(n108) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[19]  ( .D(n296), .CK(clk), .QN(n109) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[18]  ( .D(n295), .CK(clk), .QN(n110) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[17]  ( .D(n294), .CK(clk), .QN(n111) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[16]  ( .D(n293), .CK(clk), .QN(n112) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[43]  ( .D(n320), .CK(clk), .QN(n85) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[42]  ( .D(n319), .CK(clk), .QN(n86) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[41]  ( .D(n318), .CK(clk), .QN(n87) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[40]  ( .D(n317), .CK(clk), .QN(n88) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[79]  ( .D(n356), .CK(clk), .QN(n49) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[78]  ( .D(n355), .CK(clk), .QN(n50) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[77]  ( .D(n354), .CK(clk), .QN(n51) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[76]  ( .D(n353), .CK(clk), .QN(n52) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[63]  ( .D(n340), .CK(clk), .QN(n65) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[62]  ( .D(n339), .CK(clk), .QN(n66) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[61]  ( .D(n338), .CK(clk), .QN(n67) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[60]  ( .D(n337), .CK(clk), .QN(n68) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[59]  ( .D(n336), .CK(clk), .QN(n69) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[58]  ( .D(n335), .CK(clk), .QN(n70) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[57]  ( .D(n334), .CK(clk), .QN(n71) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[56]  ( .D(n333), .CK(clk), .QN(n72) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[111]  ( .D(n388), .CK(clk), .QN(n17) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[110]  ( .D(n387), .CK(clk), .QN(n18) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[109]  ( .D(n386), .CK(clk), .QN(n19) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[108]  ( .D(n385), .CK(clk), .QN(n20) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[107]  ( .D(n384), .CK(clk), .QN(n21) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[106]  ( .D(n383), .CK(clk), .QN(n22) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[105]  ( .D(n382), .CK(clk), .QN(n23) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[104]  ( .D(n381), .CK(clk), .QN(n24) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[119]  ( .D(n396), .CK(clk), .QN(n9) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[118]  ( .D(n395), .CK(clk), .QN(n10) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[117]  ( .D(n394), .CK(clk), .QN(n11) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[116]  ( .D(n393), .CK(clk), .QN(n12) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[115]  ( .D(n392), .CK(clk), .QN(n13) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[114]  ( .D(n391), .CK(clk), .QN(n14) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[113]  ( .D(n390), .CK(clk), .QN(n15) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[112]  ( .D(n389), .CK(clk), .QN(n16) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[103]  ( .D(n380), .CK(clk), .QN(n25) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[102]  ( .D(n379), .CK(clk), .QN(n26) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[101]  ( .D(n378), .CK(clk), .QN(n27) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[100]  ( .D(n377), .CK(clk), .QN(n28) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[99]  ( .D(n376), .CK(clk), .QN(n29) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[98]  ( .D(n375), .CK(clk), .QN(n30) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[97]  ( .D(n374), .CK(clk), .QN(n31) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[96]  ( .D(n373), .CK(clk), .QN(n32) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[87]  ( .D(n364), .CK(clk), .QN(n41) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[86]  ( .D(n363), .CK(clk), .QN(n42) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[85]  ( .D(n362), .CK(clk), .QN(n43) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[84]  ( .D(n361), .CK(clk), .QN(n44) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[83]  ( .D(n360), .CK(clk), .QN(n45) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[82]  ( .D(n359), .CK(clk), .QN(n46) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[81]  ( .D(n358), .CK(clk), .QN(n47) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[80]  ( .D(n357), .CK(clk), .QN(n48) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[71]  ( .D(n348), .CK(clk), .QN(n57) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[70]  ( .D(n347), .CK(clk), .QN(n58) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[69]  ( .D(n346), .CK(clk), .QN(n59) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[68]  ( .D(n345), .CK(clk), .QN(n60) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[67]  ( .D(n344), .CK(clk), .QN(n61) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[66]  ( .D(n343), .CK(clk), .QN(n62) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[65]  ( .D(n342), .CK(clk), .QN(n63) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[64]  ( .D(n341), .CK(clk), .QN(n64) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[95]  ( .D(n372), .CK(clk), .QN(n33) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[94]  ( .D(n371), .CK(clk), .QN(n34) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[93]  ( .D(n370), .CK(clk), .QN(n35) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[92]  ( .D(n369), .CK(clk), .QN(n36) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[91]  ( .D(n368), .CK(clk), .QN(n37) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[90]  ( .D(n367), .CK(clk), .QN(n38) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[89]  ( .D(n366), .CK(clk), .QN(n39) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[88]  ( .D(n365), .CK(clk), .QN(n40) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[31]  ( .D(n308), .CK(clk), .QN(n97) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[30]  ( .D(n307), .CK(clk), .QN(n98) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[29]  ( .D(n306), .CK(clk), .QN(n99) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[28]  ( .D(n305), .CK(clk), .QN(n100) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[27]  ( .D(n304), .CK(clk), .QN(n101) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[26]  ( .D(n303), .CK(clk), .QN(n102) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[25]  ( .D(n302), .CK(clk), .QN(n103) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[24]  ( .D(n301), .CK(clk), .QN(n104) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[15]  ( .D(n292), .CK(clk), .QN(n113) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[14]  ( .D(n291), .CK(clk), .QN(n114) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[13]  ( .D(n290), .CK(clk), .QN(n115) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[12]  ( .D(n289), .CK(clk), .QN(n116) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[11]  ( .D(n288), .CK(clk), .QN(n117) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[10]  ( .D(n287), .CK(clk), .QN(n118) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[9]  ( .D(n286), .CK(clk), .QN(n119) );
  SAEDRVT14_FDPQB_V2LP_1 \mem_flat_reg[8]  ( .D(n285), .CK(clk), .QN(n120) );
  SAEDRVT14_INV_1P5 U2 ( .A(n179), .X(n142) );
  SAEDRVT14_INV_1P5 U3 ( .A(n166), .X(n133) );
  SAEDRVT14_INV_1P5 U4 ( .A(n162), .X(n134) );
  SAEDRVT14_ND2_CDC_0P5 U5 ( .A1(n177), .A2(n165), .X(n179) );
  SAEDRVT14_ND2_CDC_0P5 U6 ( .A1(n175), .A2(n160), .X(n174) );
  SAEDRVT14_ND2_CDC_0P5 U7 ( .A1(n175), .A2(n165), .X(n178) );
  SAEDRVT14_ND2_CDC_0P5 U8 ( .A1(n175), .A2(n171), .X(n182) );
  SAEDRVT14_ND2_CDC_0P5 U9 ( .A1(n175), .A2(n168), .X(n180) );
  SAEDRVT14_AN2_1 U10 ( .A1(n172), .A2(n151), .X(n161) );
  SAEDRVT14_ND2_CDC_0P5 U11 ( .A1(n177), .A2(n160), .X(n176) );
  SAEDRVT14_ND2_CDC_0P5 U12 ( .A1(n165), .A2(n163), .X(n166) );
  SAEDRVT14_ND2_CDC_0P5 U13 ( .A1(n163), .A2(n160), .X(n162) );
  SAEDRVT14_ND2_CDC_0P5 U14 ( .A1(n177), .A2(n171), .X(n184) );
  SAEDRVT14_ND2_CDC_0P5 U15 ( .A1(n177), .A2(n168), .X(n181) );
  SAEDRVT14_ND2_CDC_0P5 U16 ( .A1(n275), .A2(n149), .X(n194) );
  SAEDRVT14_ND2_CDC_0P5 U17 ( .A1(n273), .A2(n149), .X(n192) );
  SAEDRVT14_ND2_CDC_0P5 U18 ( .A1(n276), .A2(n149), .X(n193) );
  SAEDRVT14_OR2_MM_0P5 U19 ( .A1(n149), .A2(n274), .X(n195) );
  SAEDRVT14_INV_1P5 U20 ( .A(n130), .X(n148) );
  SAEDRVT14_OAI22_0P75 U21 ( .A1(n406), .A2(n173), .B1(n131), .B2(n72), .X(
        n333) );
  SAEDRVT14_OAI22_0P75 U22 ( .A1(n405), .A2(n173), .B1(n131), .B2(n71), .X(
        n334) );
  SAEDRVT14_OAI22_0P75 U23 ( .A1(n158), .A2(n173), .B1(n131), .B2(n70), .X(
        n335) );
  SAEDRVT14_OAI22_0P75 U24 ( .A1(n157), .A2(n173), .B1(n131), .B2(n69), .X(
        n336) );
  SAEDRVT14_OAI22_0P75 U25 ( .A1(n156), .A2(n173), .B1(n131), .B2(n68), .X(
        n337) );
  SAEDRVT14_OAI22_0P75 U26 ( .A1(n155), .A2(n173), .B1(n131), .B2(n67), .X(
        n338) );
  SAEDRVT14_OAI22_0P75 U27 ( .A1(n154), .A2(n173), .B1(n131), .B2(n66), .X(
        n339) );
  SAEDRVT14_OAI22_0P75 U28 ( .A1(n153), .A2(n173), .B1(n131), .B2(n65), .X(
        n340) );
  SAEDRVT14_AN2_1 U29 ( .A1(w_ptr[0]), .A2(n172), .X(n163) );
  SAEDRVT14_OAI22_0P75 U30 ( .A1(n406), .A2(n174), .B1(n147), .B2(n64), .X(
        n341) );
  SAEDRVT14_OAI22_0P75 U31 ( .A1(n405), .A2(n174), .B1(n147), .B2(n63), .X(
        n342) );
  SAEDRVT14_OAI22_0P75 U32 ( .A1(n158), .A2(n174), .B1(n147), .B2(n62), .X(
        n343) );
  SAEDRVT14_OAI22_0P75 U33 ( .A1(n157), .A2(n174), .B1(n147), .B2(n61), .X(
        n344) );
  SAEDRVT14_OAI22_0P75 U34 ( .A1(n156), .A2(n174), .B1(n147), .B2(n60), .X(
        n345) );
  SAEDRVT14_OAI22_0P75 U35 ( .A1(n155), .A2(n174), .B1(n147), .B2(n59), .X(
        n346) );
  SAEDRVT14_OAI22_0P75 U36 ( .A1(n154), .A2(n174), .B1(n147), .B2(n58), .X(
        n347) );
  SAEDRVT14_OAI22_0P75 U37 ( .A1(n153), .A2(n174), .B1(n147), .B2(n57), .X(
        n348) );
  SAEDRVT14_OAI22_0P75 U38 ( .A1(n406), .A2(n178), .B1(n146), .B2(n48), .X(
        n357) );
  SAEDRVT14_OAI22_0P75 U39 ( .A1(n405), .A2(n178), .B1(n146), .B2(n47), .X(
        n358) );
  SAEDRVT14_OAI22_0P75 U40 ( .A1(n158), .A2(n178), .B1(n146), .B2(n46), .X(
        n359) );
  SAEDRVT14_OAI22_0P75 U41 ( .A1(n157), .A2(n178), .B1(n146), .B2(n45), .X(
        n360) );
  SAEDRVT14_OAI22_0P75 U42 ( .A1(n156), .A2(n178), .B1(n146), .B2(n44), .X(
        n361) );
  SAEDRVT14_OAI22_0P75 U43 ( .A1(n155), .A2(n178), .B1(n146), .B2(n43), .X(
        n362) );
  SAEDRVT14_OAI22_0P75 U44 ( .A1(n154), .A2(n178), .B1(n146), .B2(n42), .X(
        n363) );
  SAEDRVT14_OAI22_0P75 U45 ( .A1(n153), .A2(n178), .B1(n146), .B2(n41), .X(
        n364) );
  SAEDRVT14_OAI22_0P75 U46 ( .A1(n406), .A2(n182), .B1(n144), .B2(n16), .X(
        n389) );
  SAEDRVT14_OAI22_0P75 U47 ( .A1(n405), .A2(n182), .B1(n144), .B2(n15), .X(
        n390) );
  SAEDRVT14_OAI22_0P75 U48 ( .A1(n158), .A2(n182), .B1(n144), .B2(n14), .X(
        n391) );
  SAEDRVT14_OAI22_0P75 U49 ( .A1(n157), .A2(n182), .B1(n144), .B2(n13), .X(
        n392) );
  SAEDRVT14_OAI22_0P75 U50 ( .A1(n156), .A2(n182), .B1(n144), .B2(n12), .X(
        n393) );
  SAEDRVT14_OAI22_0P75 U51 ( .A1(n155), .A2(n182), .B1(n144), .B2(n11), .X(
        n394) );
  SAEDRVT14_OAI22_0P75 U52 ( .A1(n154), .A2(n182), .B1(n144), .B2(n10), .X(
        n395) );
  SAEDRVT14_OAI22_0P75 U53 ( .A1(n153), .A2(n182), .B1(n144), .B2(n9), .X(n396) );
  SAEDRVT14_OAI22_0P75 U54 ( .A1(n406), .A2(n179), .B1(n142), .B2(n40), .X(
        n365) );
  SAEDRVT14_OAI22_0P75 U55 ( .A1(n405), .A2(n179), .B1(n142), .B2(n39), .X(
        n366) );
  SAEDRVT14_OAI22_0P75 U56 ( .A1(n158), .A2(n179), .B1(n142), .B2(n38), .X(
        n367) );
  SAEDRVT14_OAI22_0P75 U57 ( .A1(n157), .A2(n179), .B1(n142), .B2(n37), .X(
        n368) );
  SAEDRVT14_OAI22_0P75 U58 ( .A1(n156), .A2(n179), .B1(n142), .B2(n36), .X(
        n369) );
  SAEDRVT14_OAI22_0P75 U59 ( .A1(n155), .A2(n179), .B1(n142), .B2(n35), .X(
        n370) );
  SAEDRVT14_OAI22_0P75 U60 ( .A1(n154), .A2(n179), .B1(n142), .B2(n34), .X(
        n371) );
  SAEDRVT14_OAI22_0P75 U61 ( .A1(n153), .A2(n179), .B1(n142), .B2(n33), .X(
        n372) );
  SAEDRVT14_NR2_MM_0P5 U62 ( .A1(w_ptr[0]), .A2(n183), .X(n175) );
  SAEDRVT14_OAI22_0P75 U63 ( .A1(n406), .A2(n180), .B1(n145), .B2(n32), .X(
        n373) );
  SAEDRVT14_OAI22_0P75 U64 ( .A1(n405), .A2(n180), .B1(n145), .B2(n31), .X(
        n374) );
  SAEDRVT14_OAI22_0P75 U65 ( .A1(n158), .A2(n180), .B1(n145), .B2(n30), .X(
        n375) );
  SAEDRVT14_OAI22_0P75 U66 ( .A1(n157), .A2(n180), .B1(n145), .B2(n29), .X(
        n376) );
  SAEDRVT14_OAI22_0P75 U67 ( .A1(n156), .A2(n180), .B1(n145), .B2(n28), .X(
        n377) );
  SAEDRVT14_OAI22_0P75 U68 ( .A1(n155), .A2(n180), .B1(n145), .B2(n27), .X(
        n378) );
  SAEDRVT14_OAI22_0P75 U69 ( .A1(n154), .A2(n180), .B1(n145), .B2(n26), .X(
        n379) );
  SAEDRVT14_OAI22_0P75 U70 ( .A1(n153), .A2(n180), .B1(n145), .B2(n25), .X(
        n380) );
  SAEDRVT14_OAI22_0P75 U71 ( .A1(n406), .A2(n164), .B1(n137), .B2(n112), .X(
        n293) );
  SAEDRVT14_OAI22_0P75 U72 ( .A1(n405), .A2(n164), .B1(n137), .B2(n111), .X(
        n294) );
  SAEDRVT14_OAI22_0P75 U73 ( .A1(n158), .A2(n164), .B1(n137), .B2(n110), .X(
        n295) );
  SAEDRVT14_OAI22_0P75 U74 ( .A1(n157), .A2(n164), .B1(n137), .B2(n109), .X(
        n296) );
  SAEDRVT14_OAI22_0P75 U75 ( .A1(n156), .A2(n164), .B1(n137), .B2(n108), .X(
        n297) );
  SAEDRVT14_OAI22_0P75 U76 ( .A1(n155), .A2(n164), .B1(n137), .B2(n107), .X(
        n298) );
  SAEDRVT14_OAI22_0P75 U77 ( .A1(n154), .A2(n164), .B1(n137), .B2(n106), .X(
        n299) );
  SAEDRVT14_OAI22_0P75 U78 ( .A1(n153), .A2(n164), .B1(n137), .B2(n105), .X(
        n300) );
  SAEDRVT14_OAI22_0P75 U79 ( .A1(n406), .A2(n167), .B1(n136), .B2(n96), .X(
        n309) );
  SAEDRVT14_OAI22_0P75 U80 ( .A1(n405), .A2(n167), .B1(n136), .B2(n95), .X(
        n310) );
  SAEDRVT14_OAI22_0P75 U81 ( .A1(n158), .A2(n167), .B1(n136), .B2(n94), .X(
        n311) );
  SAEDRVT14_OAI22_0P75 U82 ( .A1(n157), .A2(n167), .B1(n136), .B2(n93), .X(
        n312) );
  SAEDRVT14_OAI22_0P75 U83 ( .A1(n156), .A2(n167), .B1(n136), .B2(n92), .X(
        n313) );
  SAEDRVT14_OAI22_0P75 U84 ( .A1(n155), .A2(n167), .B1(n136), .B2(n91), .X(
        n314) );
  SAEDRVT14_OAI22_0P75 U85 ( .A1(n154), .A2(n167), .B1(n136), .B2(n90), .X(
        n315) );
  SAEDRVT14_OAI22_0P75 U86 ( .A1(n153), .A2(n167), .B1(n136), .B2(n89), .X(
        n316) );
  SAEDRVT14_OAI22_0P75 U87 ( .A1(n159), .A2(n406), .B1(n138), .B2(n128), .X(
        n277) );
  SAEDRVT14_OAI22_0P75 U88 ( .A1(n159), .A2(n405), .B1(n138), .B2(n127), .X(
        n278) );
  SAEDRVT14_OAI22_0P75 U89 ( .A1(n159), .A2(n158), .B1(n138), .B2(n126), .X(
        n279) );
  SAEDRVT14_OAI22_0P75 U90 ( .A1(n159), .A2(n157), .B1(n138), .B2(n125), .X(
        n280) );
  SAEDRVT14_OAI22_0P75 U91 ( .A1(n159), .A2(n156), .B1(n138), .B2(n124), .X(
        n281) );
  SAEDRVT14_OAI22_0P75 U92 ( .A1(n159), .A2(n155), .B1(n138), .B2(n123), .X(
        n282) );
  SAEDRVT14_OAI22_0P75 U93 ( .A1(n159), .A2(n154), .B1(n138), .B2(n122), .X(
        n283) );
  SAEDRVT14_OAI22_0P75 U94 ( .A1(n159), .A2(n153), .B1(n138), .B2(n121), .X(
        n284) );
  SAEDRVT14_OAI22_0P75 U95 ( .A1(n156), .A2(n176), .B1(n143), .B2(n52), .X(
        n353) );
  SAEDRVT14_OAI22_0P75 U96 ( .A1(n155), .A2(n176), .B1(n143), .B2(n51), .X(
        n354) );
  SAEDRVT14_OAI22_0P75 U97 ( .A1(n154), .A2(n176), .B1(n143), .B2(n50), .X(
        n355) );
  SAEDRVT14_OAI22_0P75 U98 ( .A1(n153), .A2(n176), .B1(n143), .B2(n49), .X(
        n356) );
  SAEDRVT14_OAI22_0P75 U99 ( .A1(n406), .A2(n169), .B1(n132), .B2(n88), .X(
        n317) );
  SAEDRVT14_OAI22_0P75 U100 ( .A1(n405), .A2(n169), .B1(n132), .B2(n87), .X(
        n318) );
  SAEDRVT14_OAI22_0P75 U101 ( .A1(n158), .A2(n169), .B1(n132), .B2(n86), .X(
        n319) );
  SAEDRVT14_OAI22_0P75 U102 ( .A1(n157), .A2(n169), .B1(n132), .B2(n85), .X(
        n320) );
  SAEDRVT14_OAI22_0P75 U103 ( .A1(n405), .A2(n162), .B1(n134), .B2(n119), .X(
        n286) );
  SAEDRVT14_OAI22_0P75 U104 ( .A1(n406), .A2(n162), .B1(n134), .B2(n120), .X(
        n285) );
  SAEDRVT14_OAI22_0P75 U105 ( .A1(n158), .A2(n162), .B1(n134), .B2(n118), .X(
        n287) );
  SAEDRVT14_OAI22_0P75 U106 ( .A1(n157), .A2(n162), .B1(n134), .B2(n117), .X(
        n288) );
  SAEDRVT14_OAI22_0P75 U107 ( .A1(n156), .A2(n162), .B1(n134), .B2(n116), .X(
        n289) );
  SAEDRVT14_OAI22_0P75 U108 ( .A1(n155), .A2(n162), .B1(n134), .B2(n115), .X(
        n290) );
  SAEDRVT14_OAI22_0P75 U109 ( .A1(n154), .A2(n162), .B1(n134), .B2(n114), .X(
        n291) );
  SAEDRVT14_OAI22_0P75 U110 ( .A1(n153), .A2(n162), .B1(n134), .B2(n113), .X(
        n292) );
  SAEDRVT14_OAI22_0P75 U111 ( .A1(n406), .A2(n184), .B1(n140), .B2(n8), .X(
        n397) );
  SAEDRVT14_OAI22_0P75 U112 ( .A1(n405), .A2(n184), .B1(n140), .B2(n7), .X(
        n398) );
  SAEDRVT14_OAI22_0P5 U113 ( .A1(n405), .A2(n170), .B1(n135), .B2(n79), .X(
        n326) );
  SAEDRVT14_OAI22_0P75 U114 ( .A1(n158), .A2(n170), .B1(n135), .B2(n78), .X(
        n327) );
  SAEDRVT14_OAI22_0P75 U115 ( .A1(n157), .A2(n170), .B1(n135), .B2(n77), .X(
        n328) );
  SAEDRVT14_INV_1P5 U116 ( .A(w_ptr[1]), .X(n152) );
  SAEDRVT14_AN2_1 U117 ( .A1(w_ptr[2]), .A2(n152), .X(n168) );
  SAEDRVT14_NR2_MM_0P5 U118 ( .A1(n152), .A2(w_ptr[2]), .X(n165) );
  SAEDRVT14_NR2_MM_0P5 U119 ( .A1(w_ptr[2]), .A2(w_ptr[1]), .X(n160) );
  SAEDRVT14_AN2_1 U120 ( .A1(w_ptr[2]), .A2(w_ptr[1]), .X(n171) );
  SAEDRVT14_INV_1P5 U121 ( .A(w_ptr[0]), .X(n151) );
  SAEDRVT14_ND2_CDC_0P5 U122 ( .A1(r_ptr[1]), .A2(n275), .X(n198) );
  SAEDRVT14_ND2_CDC_0P5 U123 ( .A1(r_ptr[1]), .A2(n276), .X(n197) );
  SAEDRVT14_INV_1P5 U124 ( .A(data_in[1]), .X(n405) );
  SAEDRVT14_INV_1P5 U125 ( .A(data_in[0]), .X(n406) );
  SAEDRVT14_INV_1P5 U126 ( .A(data_in[2]), .X(n158) );
  SAEDRVT14_INV_1P5 U127 ( .A(data_in[3]), .X(n157) );
  SAEDRVT14_INV_1P5 U128 ( .A(data_in[4]), .X(n156) );
  SAEDRVT14_INV_1P5 U129 ( .A(data_in[5]), .X(n155) );
  SAEDRVT14_INV_1P5 U130 ( .A(data_in[6]), .X(n154) );
  SAEDRVT14_INV_1P5 U131 ( .A(data_in[7]), .X(n153) );
  SAEDRVT14_ND2_CDC_0P5 U132 ( .A1(r_ptr[1]), .A2(n273), .X(n196) );
  SAEDRVT14_OAI22_0P75 U133 ( .A1(n96), .A2(n193), .B1(n128), .B2(n194), .X(
        n267) );
  SAEDRVT14_OAI22_0P75 U134 ( .A1(n88), .A2(n193), .B1(n120), .B2(n194), .X(
        n271) );
  SAEDRVT14_OAI22_0P75 U135 ( .A1(n95), .A2(n193), .B1(n127), .B2(n194), .X(
        n257) );
  SAEDRVT14_OAI22_0P75 U136 ( .A1(n87), .A2(n193), .B1(n119), .B2(n194), .X(
        n261) );
  SAEDRVT14_OAI22_0P75 U137 ( .A1(n94), .A2(n193), .B1(n126), .B2(n194), .X(
        n247) );
  SAEDRVT14_OAI22_0P75 U138 ( .A1(n86), .A2(n193), .B1(n118), .B2(n194), .X(
        n251) );
  SAEDRVT14_OAI22_0P75 U139 ( .A1(n93), .A2(n193), .B1(n125), .B2(n194), .X(
        n237) );
  SAEDRVT14_OAI22_0P75 U140 ( .A1(n85), .A2(n193), .B1(n117), .B2(n194), .X(
        n241) );
  SAEDRVT14_OAI22_0P5 U141 ( .A1(n92), .A2(n193), .B1(n124), .B2(n194), .X(
        n227) );
  SAEDRVT14_OAI22_0P5 U142 ( .A1(n84), .A2(n193), .B1(n116), .B2(n194), .X(
        n231) );
  SAEDRVT14_OAI22_0P5 U143 ( .A1(n91), .A2(n193), .B1(n123), .B2(n194), .X(
        n217) );
  SAEDRVT14_OAI22_0P5 U144 ( .A1(n83), .A2(n193), .B1(n115), .B2(n194), .X(
        n221) );
  SAEDRVT14_OAI22_0P5 U145 ( .A1(n90), .A2(n193), .B1(n122), .B2(n194), .X(
        n207) );
  SAEDRVT14_OAI22_0P5 U146 ( .A1(n82), .A2(n193), .B1(n114), .B2(n194), .X(
        n211) );
  SAEDRVT14_OAI22_0P5 U147 ( .A1(n89), .A2(n193), .B1(n121), .B2(n194), .X(
        n189) );
  SAEDRVT14_OAI22_0P5 U148 ( .A1(n81), .A2(n193), .B1(n113), .B2(n194), .X(
        n201) );
  SAEDRVT14_ND2_CDC_0P5 U149 ( .A1(r_ptr[3]), .A2(r_ptr[2]), .X(n274) );
  SAEDRVT14_OAI22_0P75 U150 ( .A1(n80), .A2(n197), .B1(n112), .B2(n198), .X(
        n265) );
  SAEDRVT14_OAI22_0P75 U151 ( .A1(n72), .A2(n197), .B1(n104), .B2(n198), .X(
        n269) );
  SAEDRVT14_OAI22_0P75 U152 ( .A1(n79), .A2(n197), .B1(n111), .B2(n198), .X(
        n255) );
  SAEDRVT14_OAI22_0P75 U153 ( .A1(n71), .A2(n197), .B1(n103), .B2(n198), .X(
        n259) );
  SAEDRVT14_OAI22_0P75 U154 ( .A1(n78), .A2(n197), .B1(n110), .B2(n198), .X(
        n245) );
  SAEDRVT14_OAI22_0P75 U155 ( .A1(n70), .A2(n197), .B1(n102), .B2(n198), .X(
        n249) );
  SAEDRVT14_OAI22_0P75 U156 ( .A1(n77), .A2(n197), .B1(n109), .B2(n198), .X(
        n235) );
  SAEDRVT14_OAI22_0P75 U157 ( .A1(n69), .A2(n197), .B1(n101), .B2(n198), .X(
        n239) );
  SAEDRVT14_OAI22_0P5 U158 ( .A1(n76), .A2(n197), .B1(n108), .B2(n198), .X(
        n225) );
  SAEDRVT14_OAI22_0P5 U159 ( .A1(n68), .A2(n197), .B1(n100), .B2(n198), .X(
        n229) );
  SAEDRVT14_OAI22_0P5 U160 ( .A1(n75), .A2(n197), .B1(n107), .B2(n198), .X(
        n215) );
  SAEDRVT14_OAI22_0P5 U161 ( .A1(n67), .A2(n197), .B1(n99), .B2(n198), .X(n219) );
  SAEDRVT14_OAI22_0P5 U162 ( .A1(n74), .A2(n197), .B1(n106), .B2(n198), .X(
        n205) );
  SAEDRVT14_OAI22_0P5 U163 ( .A1(n66), .A2(n197), .B1(n98), .B2(n198), .X(n209) );
  SAEDRVT14_OAI22_0P5 U164 ( .A1(n73), .A2(n197), .B1(n105), .B2(n198), .X(
        n187) );
  SAEDRVT14_OAI22_0P5 U165 ( .A1(n65), .A2(n197), .B1(n97), .B2(n198), .X(n199) );
  SAEDRVT14_OAI22_0P75 U166 ( .A1(n32), .A2(n191), .B1(n64), .B2(n192), .X(
        n268) );
  SAEDRVT14_OAI22_0P75 U167 ( .A1(n24), .A2(n191), .B1(n56), .B2(n192), .X(
        n272) );
  SAEDRVT14_OAI22_0P75 U168 ( .A1(n31), .A2(n191), .B1(n63), .B2(n192), .X(
        n258) );
  SAEDRVT14_OAI22_0P75 U169 ( .A1(n23), .A2(n191), .B1(n55), .B2(n192), .X(
        n262) );
  SAEDRVT14_OAI22_0P75 U170 ( .A1(n30), .A2(n191), .B1(n62), .B2(n192), .X(
        n248) );
  SAEDRVT14_OAI22_0P75 U171 ( .A1(n22), .A2(n191), .B1(n54), .B2(n192), .X(
        n252) );
  SAEDRVT14_OAI22_0P75 U172 ( .A1(n29), .A2(n191), .B1(n61), .B2(n192), .X(
        n238) );
  SAEDRVT14_OAI22_0P75 U173 ( .A1(n21), .A2(n191), .B1(n53), .B2(n192), .X(
        n242) );
  SAEDRVT14_OAI22_0P5 U174 ( .A1(n28), .A2(n191), .B1(n60), .B2(n192), .X(n228) );
  SAEDRVT14_OAI22_0P5 U175 ( .A1(n20), .A2(n191), .B1(n52), .B2(n192), .X(n232) );
  SAEDRVT14_OAI22_0P5 U176 ( .A1(n27), .A2(n191), .B1(n59), .B2(n192), .X(n218) );
  SAEDRVT14_OAI22_0P5 U177 ( .A1(n19), .A2(n191), .B1(n51), .B2(n192), .X(n222) );
  SAEDRVT14_OAI22_0P5 U178 ( .A1(n26), .A2(n191), .B1(n58), .B2(n192), .X(n208) );
  SAEDRVT14_OAI22_0P5 U179 ( .A1(n18), .A2(n191), .B1(n50), .B2(n192), .X(n212) );
  SAEDRVT14_OAI22_0P5 U180 ( .A1(n25), .A2(n191), .B1(n57), .B2(n192), .X(n190) );
  SAEDRVT14_OAI22_0P5 U181 ( .A1(n17), .A2(n191), .B1(n49), .B2(n192), .X(n202) );
  SAEDRVT14_NR2_MM_0P5 U182 ( .A1(r_ptr[3]), .A2(r_ptr[2]), .X(n275) );
  SAEDRVT14_NR2_MM_0P5 U183 ( .A1(n150), .A2(r_ptr[3]), .X(n276) );
  SAEDRVT14_OAI22_0P75 U184 ( .A1(n16), .A2(n195), .B1(n48), .B2(n196), .X(
        n266) );
  SAEDRVT14_OAI22_0P75 U185 ( .A1(n15), .A2(n195), .B1(n47), .B2(n196), .X(
        n256) );
  SAEDRVT14_OAI22_0P75 U186 ( .A1(n14), .A2(n195), .B1(n46), .B2(n196), .X(
        n246) );
  SAEDRVT14_OAI22_0P75 U187 ( .A1(n13), .A2(n195), .B1(n45), .B2(n196), .X(
        n236) );
  SAEDRVT14_OAI22_0P75 U188 ( .A1(n12), .A2(n195), .B1(n44), .B2(n196), .X(
        n226) );
  SAEDRVT14_OAI22_0P75 U189 ( .A1(n11), .A2(n195), .B1(n43), .B2(n196), .X(
        n216) );
  SAEDRVT14_OAI22_0P75 U190 ( .A1(n10), .A2(n195), .B1(n42), .B2(n196), .X(
        n206) );
  SAEDRVT14_OAI22_0P75 U191 ( .A1(n9), .A2(n195), .B1(n41), .B2(n196), .X(n188) );
  SAEDRVT14_AN2_1 U192 ( .A1(r_ptr[3]), .A2(n150), .X(n273) );
  SAEDRVT14_INV_1P5 U193 ( .A(r_ptr[1]), .X(n149) );
  SAEDRVT14_INV_1P5 U194 ( .A(r_ptr[2]), .X(n150) );
  SAEDRVT14_OR2_MM_0P5 U195 ( .A1(r_ptr[1]), .A2(n274), .X(n191) );
  SAEDRVT14_BUF_ECO_1 U196 ( .A(r_ptr[0]), .X(n130) );
  SAEDRVT14_AO22_1 U197 ( .A1(n129), .A2(n263), .B1(n264), .B2(n148), .X(
        data_out[0]) );
  SAEDRVT14_OAI22_0P5 U198 ( .A1(n8), .A2(n195), .B1(n40), .B2(n196), .X(n270)
         );
  SAEDRVT14_AO22_1 U199 ( .A1(n129), .A2(n253), .B1(n254), .B2(n148), .X(
        data_out[1]) );
  SAEDRVT14_OAI22_0P5 U200 ( .A1(n7), .A2(n195), .B1(n39), .B2(n196), .X(n260)
         );
  SAEDRVT14_AO22_1 U201 ( .A1(n129), .A2(n243), .B1(n244), .B2(n148), .X(
        data_out[2]) );
  SAEDRVT14_OAI22_0P5 U202 ( .A1(n6), .A2(n195), .B1(n38), .B2(n196), .X(n250)
         );
  SAEDRVT14_AO22_1 U203 ( .A1(n129), .A2(n233), .B1(n234), .B2(n148), .X(
        data_out[3]) );
  SAEDRVT14_OAI22_0P5 U204 ( .A1(n5), .A2(n195), .B1(n37), .B2(n196), .X(n240)
         );
  SAEDRVT14_AO22_1 U205 ( .A1(n130), .A2(n223), .B1(n224), .B2(n148), .X(
        data_out[4]) );
  SAEDRVT14_OAI22_0P5 U206 ( .A1(n4), .A2(n195), .B1(n36), .B2(n196), .X(n230)
         );
  SAEDRVT14_AO22_1 U207 ( .A1(n130), .A2(n213), .B1(n214), .B2(n148), .X(
        data_out[5]) );
  SAEDRVT14_OAI22_0P5 U208 ( .A1(n3), .A2(n195), .B1(n35), .B2(n196), .X(n220)
         );
  SAEDRVT14_AO22_1 U209 ( .A1(n130), .A2(n203), .B1(n204), .B2(n148), .X(
        data_out[6]) );
  SAEDRVT14_OAI22_0P5 U210 ( .A1(n2), .A2(n195), .B1(n34), .B2(n196), .X(n210)
         );
  SAEDRVT14_AO22_1 U211 ( .A1(n130), .A2(n185), .B1(n186), .B2(n148), .X(
        data_out[7]) );
  SAEDRVT14_OAI22_0P5 U212 ( .A1(n1), .A2(n195), .B1(n33), .B2(n196), .X(n200)
         );
  SAEDRVT14_BUF_ECO_1 U213 ( .A(r_ptr[0]), .X(n129) );
  SAEDRVT14_OAI22_0P75 U214 ( .A1(n406), .A2(n181), .B1(n141), .B2(n24), .X(
        n381) );
  SAEDRVT14_OAI22_0P75 U215 ( .A1(n405), .A2(n181), .B1(n141), .B2(n23), .X(
        n382) );
  SAEDRVT14_OAI22_0P75 U216 ( .A1(n158), .A2(n181), .B1(n141), .B2(n22), .X(
        n383) );
  SAEDRVT14_OAI22_0P75 U217 ( .A1(n157), .A2(n181), .B1(n141), .B2(n21), .X(
        n384) );
  SAEDRVT14_OAI22_0P75 U218 ( .A1(n156), .A2(n181), .B1(n141), .B2(n20), .X(
        n385) );
  SAEDRVT14_OAI22_0P75 U219 ( .A1(n155), .A2(n181), .B1(n141), .B2(n19), .X(
        n386) );
  SAEDRVT14_OAI22_0P75 U220 ( .A1(n154), .A2(n181), .B1(n141), .B2(n18), .X(
        n387) );
  SAEDRVT14_OAI22_0P75 U221 ( .A1(n153), .A2(n181), .B1(n141), .B2(n17), .X(
        n388) );
  SAEDRVT14_INV_S_0P5 U222 ( .A(n181), .X(n141) );
  SAEDRVT14_INV_S_0P5 U223 ( .A(n170), .X(n135) );
  SAEDRVT14_OAI22_0P5 U224 ( .A1(n406), .A2(n170), .B1(n135), .B2(n80), .X(
        n325) );
  SAEDRVT14_OAI22_0P5 U225 ( .A1(n153), .A2(n170), .B1(n135), .B2(n73), .X(
        n332) );
  SAEDRVT14_OAI22_0P5 U226 ( .A1(n154), .A2(n170), .B1(n135), .B2(n74), .X(
        n331) );
  SAEDRVT14_OAI22_0P5 U227 ( .A1(n155), .A2(n170), .B1(n135), .B2(n75), .X(
        n330) );
  SAEDRVT14_OAI22_0P5 U228 ( .A1(n156), .A2(n170), .B1(n135), .B2(n76), .X(
        n329) );
  SAEDRVT14_ND2_CDC_1 U229 ( .A1(n171), .A2(n161), .X(n170) );
  SAEDRVT14_INV_S_0P75 U230 ( .A(n167), .X(n136) );
  SAEDRVT14_ND2_CDC_0P5 U231 ( .A1(n168), .A2(n161), .X(n167) );
  SAEDRVT14_OAI22_0P5 U232 ( .A1(n153), .A2(n184), .B1(n140), .B2(n1), .X(n404) );
  SAEDRVT14_OAI22_0P5 U233 ( .A1(n154), .A2(n184), .B1(n140), .B2(n2), .X(n403) );
  SAEDRVT14_OAI22_0P5 U234 ( .A1(n155), .A2(n184), .B1(n140), .B2(n3), .X(n402) );
  SAEDRVT14_OAI22_0P5 U235 ( .A1(n156), .A2(n184), .B1(n140), .B2(n4), .X(n401) );
  SAEDRVT14_OAI22_0P5 U236 ( .A1(n157), .A2(n184), .B1(n140), .B2(n5), .X(n400) );
  SAEDRVT14_OAI22_0P5 U237 ( .A1(n158), .A2(n184), .B1(n140), .B2(n6), .X(n399) );
  SAEDRVT14_INV_S_0P5 U238 ( .A(n184), .X(n140) );
  SAEDRVT14_NR2_MM_0P5 U239 ( .A1(n151), .A2(n183), .X(n177) );
  SAEDRVT14_INV_S_0P75 U240 ( .A(n159), .X(n138) );
  SAEDRVT14_ND2_CDC_1 U241 ( .A1(n160), .A2(n161), .X(n159) );
  SAEDRVT14_INV_S_0P75 U242 ( .A(n182), .X(n144) );
  SAEDRVT14_INV_S_0P75 U243 ( .A(n174), .X(n147) );
  SAEDRVT14_INV_S_0P75 U244 ( .A(n178), .X(n146) );
  SAEDRVT14_INV_S_0P75 U245 ( .A(n176), .X(n143) );
  SAEDRVT14_OAI22_0P5 U246 ( .A1(n157), .A2(n176), .B1(n143), .B2(n53), .X(
        n352) );
  SAEDRVT14_OAI22_0P5 U247 ( .A1(n158), .A2(n176), .B1(n143), .B2(n54), .X(
        n351) );
  SAEDRVT14_OAI22_0P5 U248 ( .A1(n405), .A2(n176), .B1(n143), .B2(n55), .X(
        n350) );
  SAEDRVT14_OAI22_0P5 U249 ( .A1(n406), .A2(n176), .B1(n143), .B2(n56), .X(
        n349) );
  SAEDRVT14_ND2_CDC_1 U250 ( .A1(w_ptr[3]), .A2(fifo_w_en), .X(n183) );
  SAEDRVT14_INV_S_0P75 U251 ( .A(n164), .X(n137) );
  SAEDRVT14_ND2_CDC_0P5 U252 ( .A1(n165), .A2(n161), .X(n164) );
  SAEDRVT14_NR2_MM_0P5 U253 ( .A1(n139), .A2(w_ptr[3]), .X(n172) );
  SAEDRVT14_INV_S_0P75 U254 ( .A(n173), .X(n131) );
  SAEDRVT14_ND2_CDC_1 U255 ( .A1(n171), .A2(n163), .X(n173) );
  SAEDRVT14_INV_S_0P75 U256 ( .A(n169), .X(n132) );
  SAEDRVT14_OAI22_0P5 U257 ( .A1(n153), .A2(n169), .B1(n132), .B2(n81), .X(
        n324) );
  SAEDRVT14_OAI22_0P5 U258 ( .A1(n154), .A2(n169), .B1(n132), .B2(n82), .X(
        n323) );
  SAEDRVT14_OAI22_0P5 U259 ( .A1(n155), .A2(n169), .B1(n132), .B2(n83), .X(
        n322) );
  SAEDRVT14_OAI22_0P5 U260 ( .A1(n156), .A2(n169), .B1(n132), .B2(n84), .X(
        n321) );
  SAEDRVT14_ND2_CDC_1 U261 ( .A1(n168), .A2(n163), .X(n169) );
  SAEDRVT14_OAI22_0P75 U262 ( .A1(n406), .A2(n166), .B1(n133), .B2(n104), .X(
        n301) );
  SAEDRVT14_OAI22_0P75 U263 ( .A1(n405), .A2(n166), .B1(n133), .B2(n103), .X(
        n302) );
  SAEDRVT14_OAI22_0P75 U264 ( .A1(n158), .A2(n166), .B1(n133), .B2(n102), .X(
        n303) );
  SAEDRVT14_OAI22_0P75 U265 ( .A1(n157), .A2(n166), .B1(n133), .B2(n101), .X(
        n304) );
  SAEDRVT14_OAI22_0P75 U266 ( .A1(n156), .A2(n166), .B1(n133), .B2(n100), .X(
        n305) );
  SAEDRVT14_OAI22_0P75 U267 ( .A1(n155), .A2(n166), .B1(n133), .B2(n99), .X(
        n306) );
  SAEDRVT14_OAI22_0P75 U268 ( .A1(n154), .A2(n166), .B1(n133), .B2(n98), .X(
        n307) );
  SAEDRVT14_OAI22_0P75 U269 ( .A1(n153), .A2(n166), .B1(n133), .B2(n97), .X(
        n308) );
  SAEDRVT14_INV_S_0P75 U286 ( .A(n180), .X(n145) );
  SAEDRVT14_INV_S_0P5 U287 ( .A(fifo_w_en), .X(n139) );
endmodule


module Memory_State_DATASIZE8_DEPTH16_PTR_WIDTH4 ( fifo_full, fifo_empty, 
        fifo_overflow_flag, fifo_underflow_flag, w_en, r_en, fifo_w_en, 
        fifo_r_en, w_ptr, r_ptr, clk, rst_n );
  input [4:0] w_ptr;
  input [4:0] r_ptr;
  input w_en, r_en, fifo_w_en, fifo_r_en, clk, rst_n;
  output fifo_full, fifo_empty, fifo_overflow_flag, fifo_underflow_flag;
  wire   n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n1;

  SAEDRVT14_AO2BB2_1 U3 ( .A1(n4), .A2(fifo_w_en), .B1(fifo_underflow_flag), 
        .B2(n4), .X(n12) );
  SAEDRVT14_AO2BB2_1 U5 ( .A1(n5), .A2(fifo_r_en), .B1(fifo_overflow_flag), 
        .B2(n5), .X(n13) );
  SAEDRVT14_OR4_1 U11 ( .A1(n8), .A2(n9), .A3(n10), .A4(n11), .X(n6) );
  SAEDRVT14_EO2_V1_0P75 U12 ( .A1(w_ptr[2]), .A2(r_ptr[2]), .X(n11) );
  SAEDRVT14_EO2_V1_0P75 U13 ( .A1(w_ptr[3]), .A2(r_ptr[3]), .X(n10) );
  SAEDRVT14_FDPRBQ_V2LP_1 fifo_overflow_flag_reg ( .D(n13), .CK(clk), .RD(
        rst_n), .Q(fifo_overflow_flag) );
  SAEDRVT14_FDPRBQ_V2LP_1 fifo_underflow_flag_reg ( .D(n12), .CK(clk), .RD(
        rst_n), .Q(fifo_underflow_flag) );
  SAEDRVT14_INV_1P5 U4 ( .A(n7), .X(n1) );
  SAEDRVT14_NR2_MM_0P5 U6 ( .A1(n6), .A2(n7), .X(fifo_empty) );
  SAEDRVT14_EO2_V1_0P75 U7 ( .A1(w_ptr[0]), .A2(r_ptr[0]), .X(n8) );
  SAEDRVT14_EO2_V1_0P75 U8 ( .A1(w_ptr[1]), .A2(r_ptr[1]), .X(n9) );
  SAEDRVT14_EO2_V1_0P75 U9 ( .A1(w_ptr[4]), .A2(r_ptr[4]), .X(n7) );
  SAEDRVT14_AOI21_0P5 U10 ( .A1(w_en), .A2(fifo_full), .B(fifo_r_en), .X(n5)
         );
  SAEDRVT14_AOI21_0P75 U14 ( .A1(r_en), .A2(fifo_empty), .B(fifo_w_en), .X(n4)
         );
  SAEDRVT14_NR2_MM_0P5 U15 ( .A1(n6), .A2(n1), .X(fifo_full) );
endmodule


module fifo ( data_out, fifo_full, fifo_empty, fifo_overflow_flag, 
        fifo_underflow_flag, clk, rst_n, w_en, r_en, data_in );
  output [7:0] data_out;
  input [7:0] data_in;
  input clk, rst_n, w_en, r_en;
  output fifo_full, fifo_empty, fifo_overflow_flag, fifo_underflow_flag;
  wire   fifo_w_en, fifo_r_en;
  wire   [4:0] w_ptr;
  wire   [4:0] r_ptr;

  Write_pointer_DATASIZE8_DEPTH16_PTR_WIDTH4 write_pointer ( .w_en(w_en), 
        .fifo_full(fifo_full), .clk(clk), .rst_n(rst_n), .w_ptr(w_ptr), 
        .fifo_w_en(fifo_w_en) );
  Read_pointer_DATASIZE8_DEPTH16_PTR_WIDTH4 read_pointer ( .r_en(r_en), 
        .fifo_empty(fifo_empty), .clk(clk), .rst_n(rst_n), .r_ptr(r_ptr), 
        .fifo_r_en(fifo_r_en) );
  Memory_Array_DATASIZE8_DEPTH16_PTR_WIDTH4 memory_array ( .clk(clk), .rst_n(
        rst_n), .fifo_w_en(fifo_w_en), .w_ptr(w_ptr), .r_ptr(r_ptr), .data_in(
        data_in), .data_out(data_out) );
  Memory_State_DATASIZE8_DEPTH16_PTR_WIDTH4 memory_state ( .fifo_full(
        fifo_full), .fifo_empty(fifo_empty), .fifo_overflow_flag(
        fifo_overflow_flag), .fifo_underflow_flag(fifo_underflow_flag), .w_en(
        w_en), .r_en(r_en), .fifo_w_en(fifo_w_en), .fifo_r_en(fifo_r_en), 
        .w_ptr(w_ptr), .r_ptr(r_ptr), .clk(clk), .rst_n(rst_n) );
endmodule

