###################################################################

# Created by write_sdc on Thu Jul 17 10:36:42 2025

###################################################################
set sdc_version 2.1

set_units -time ns -resistance MOhm -capacitance fF -voltage V -current uA
set_operating_conditions -max ff0p88v125c -max_library saed14rvt_ff0p88v125c\
                         -min ss0p72vm40c -min_library saed14rvt_ss0p72vm40c
set_max_capacitance 8 [current_design]
set_max_fanout 16 [current_design]
set_max_transition 0.5 [get_ports {data_out[7]}]
set_max_transition 0.5 [get_ports {data_out[6]}]
set_max_transition 0.5 [get_ports {data_out[5]}]
set_max_transition 0.5 [get_ports {data_out[4]}]
set_max_transition 0.5 [get_ports {data_out[3]}]
set_max_transition 0.5 [get_ports {data_out[2]}]
set_max_transition 0.5 [get_ports {data_out[1]}]
set_max_transition 0.5 [get_ports {data_out[0]}]
set_max_transition 0.5 [get_ports fifo_full]
set_max_transition 0.5 [get_ports fifo_empty]
set_max_transition 0.5 [get_ports fifo_overflow_flag]
set_max_transition 0.5 [get_ports fifo_underflow_flag]
set_max_transition 0.5 [get_ports clk]
set_max_transition 0.5 [get_ports rst_n]
set_max_transition 0.5 [get_ports w_en]
set_max_transition 0.5 [get_ports r_en]
set_max_transition 0.5 [get_ports {data_in[7]}]
set_max_transition 0.5 [get_ports {data_in[6]}]
set_max_transition 0.5 [get_ports {data_in[5]}]
set_max_transition 0.5 [get_ports {data_in[4]}]
set_max_transition 0.5 [get_ports {data_in[3]}]
set_max_transition 0.5 [get_ports {data_in[2]}]
set_max_transition 0.5 [get_ports {data_in[1]}]
set_max_transition 0.5 [get_ports {data_in[0]}]
set_case_analysis 0 [get_ports rst_n]
create_clock [get_ports clk]  -period 10  -waveform {0 5}
set_clock_uncertainty 0.2  [get_clocks clk]
set_input_delay -clock clk  3  [get_ports rst_n]
