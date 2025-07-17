# ========================== CLOCK CONSTRAINT ==========================

# Giả sử clock 100 MHz => period = 10ns, duty cycle 50%
create_clock -name clk -period 10.0 [get_ports clk]

# ========================== INPUT DELAYS ==========================

# Giả định môi trường bên ngoài cung cấp tín hiệu đồng bộ với clk
set_input_delay 3.0 -clock clk [get_ports din]
set_input_delay 3.0 -clock clk [get_ports rst_n]

# ========================== OUTPUT DELAYS ==========================

# Tín hiệu 'lock' và 'state*' được các thiết bị bên ngoài (ví dụ testbench) lấy mẫu
set_output_delay 3.0 -clock clk [get_ports lock]
set_output_delay 3.0 -clock clk [get_ports state*]

# ========================== ASYNC RESET ==========================

# Reset bất đồng bộ, dùng case analysis để loại khỏi phân tích timing
set_case_analysis 0 [get_ports rst_n]

# Hoặc có thể dùng false path để bỏ qua mọi path từ rst_n
# set_false_path -from [get_ports rst_n]

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

