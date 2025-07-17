# ======================== CLOCK =============================
create_clock -name clk -period 1.000 [get_ports clk]
# ========================== INPUT DELAYS ==========================
set_input_delay -clock clk 0.2 [remove_from_collection [all_inputs] [get_ports clk]]
# ========================== OUTPUT DELAYS ==========================

set_output_delay -clock clk 0.2 [all_outputs]
set_fix_hold [get_clocks clk]



# ========================== ASYNC RESET ==========================
# ========================== DESIGN RULES ==========================

# Giới hạn thời gian chuyển mạch (transition) đầu vào tối đa 0.5ns
set_max_transition 0.5 [get_ports *]

# Giới hạn fanout tối đa là 16
set_max_fanout 16 [current_design]

# Giới hạn điện dung tối đa là 8 đơn vị
set_max_capacitance 8 [current_design]

# Tránh sử dụng các cổng logic có kích thước lớn, tiêu tốn nhiều năng lượng
# set_dont_use [get_lib_cells *X16*]
# set_dont_use [get_lib_cells *X20*]

# ========================== CLOCK UNCERTAINTY ==========================

# Đặt độ bất định của clock là 0.2ns (bao gồm jitter/skew)
set_clock_uncertainty 0.2 [get_clocks clk]

