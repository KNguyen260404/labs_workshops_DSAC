###################################################################

# Created by write_sdc on Thu Jul 17 09:54:38 2025

###################################################################
set sdc_version 2.1

set_units -time ns -resistance MOhm -capacitance fF -voltage V -current uA
set_operating_conditions -max ff0p88v125c -max_library saed14rvt_ff0p88v125c\
                         -min ss0p72vm40c -min_library saed14rvt_ss0p72vm40c
set_max_capacitance 8 [current_design]
set_max_fanout 16 [current_design]
set_max_transition 0.5 [get_ports clk]
set_max_transition 0.5 [get_ports rst_n]
set_max_transition 0.5 [get_ports din]
set_max_transition 0.5 [get_ports lock]
set_max_transition 0.5 [get_ports {state[2]}]
set_max_transition 0.5 [get_ports {state[1]}]
set_max_transition 0.5 [get_ports {state[0]}]
set_case_analysis 0 [get_ports rst_n]
create_clock [get_ports clk]  -period 10  -waveform {0 5}
set_clock_uncertainty 0.2  [get_clocks clk]
set_input_delay -clock clk  3  [get_ports rst_n]
set_output_delay -clock clk  3  [get_ports lock]
set_output_delay -clock clk  3  [get_ports {state[2]}]
set_output_delay -clock clk  3  [get_ports {state[1]}]
set_output_delay -clock clk  3  [get_ports {state[0]}]
