# =============================================
# Design Compiler Synthesis Script for Counter
# =============================================

# Set technology libraries
set search_path [list . /home/Khach123/Documents/Nguyen/me_labs/liberty]
set link_library [list \
    /home/Khach123/Documents/Nguyen/me_labs/liberty/saed14rvt_ff0p88v125c.db \
    /home/Khach123/Documents/Nguyen/me_labs/liberty/saed14rvt_ss0p72vm40c.db \
    /home/Khach123/Documents/Nguyen/me_labs/liberty/saed14rvt_tt0p8v25c.db \
]
set target_library $link_library
set symbol_library ""

# Define working library
define_design_lib WORK -path ./work

# Read and analyze RTL files

analyze -library WORK -format verilog {/home/Khach123/Documents/Nguyen/me_labs/lab3/rtl/fifo.v}
elaborate fifo -architecture verilog -library WORK
read_sdc /home/Khach123/Documents/Nguyen/me_labs/lab3/sdc/FIFO.sdc
set_operating_conditions -min ss0p72vm40c -max ff0p88v125c
# Set constraints

	
# Save synthesis session info for Formality
set_svf /home/Khach123/Documents/Nguyen/me_labs/lab3/outputs/FIFO_formality.svf

# Compile
#compile_ultra -retime
compile
check_design

# Reports
report_area > /home/Khach123/Documents/Nguyen/me_labs/lab3/reports/area.rpt
report_timing > /home/Khach123/Documents/Nguyen/me_labs/lab3/reports/timing.rpt
report_power > /home/Khach123/Documents/Nguyen/me_labs/lab3/reports/power.rpt
report_qor > /home/Khach123/Documents/Nguyen/me_labs/lab3/reports/qor.rpt
# Export netlist

write -format verilog -hierarchy -output /home/Khach123/Documents/Nguyen/me_labs/lab3/outputs/FIFO_synth.v
set_svf -off
write_sdf /home/Khach123/Documents/Nguyen/me_labs/lab3/outputs/FIFO_synth.sdf
# === Formality Preparation ===

# Export DDC (optional)
write -format ddc -hierarchy -output /home/Khach123/Documents/Nguyen/me_labs/lab3/outputs/FIFO_synth.ddc

# Export SDC constraints (optional but recommended)
write_sdc /home/Khach123/Documents/Nguyen/me_labs/lab3/outputs/FIFO_synth.sdc

# Export environment script for Formality
write_script -output /home/Khach123/Documents/Nguyen/me_labs/lab3/outputs/FIFO_env.tcl

# Turn off SVF recording
set_svf -off

# Optionally start GUI
gui_start

