# =========================================
# STA Script for Design Compiler
# =========================================

# Set technology libraries
set search_path [list . /home/Khach123/Documents/Nguyen/me_labs/liberty]
set link_library [list \
    /home/Khach123/Documents/Nguyen/me_labs/liberty/saed14rvt_ff0p88v125c.db \
    /home/Khach123/Documents/Nguyen/me_labs/liberty/saed14rvt_ss0p72vm40c.db \
    /home/Khach123/Documents/Nguyen/me_labs/liberty/saed14rvt_tt0p8v25c.db \
]
set target_library $link_library

#Read Netlist
read_verilog /home/Khach123/Documents/Nguyen/me_labs/lab3/outputs/FIFO_synth.v
link_design fifo	
set_operating_conditions -min ss0p72vm40c -max ff0p88v125c
# Read SDC constraints
read_sdc /home/Khach123/Documents/Nguyen/me_labs/lab3/sdc/FIFO.sdc

read_sdf /home/Khach123/Documents/Nguyen/me_labs/lab3/outputs/FIFO_synth.sdf	

update timing 

# Report timing coverage
report_analysis_coverage > /home/Khach123/Documents/Nguyen/me_labs/lab3/reports/timing_coverage.rpt

# Report worst slack paths
report_timing -max_paths 10 -slack_lesser_than 10.00 > /home/Khach123/Documents/Nguyen/me_labs/lab3/reports/sta_timing.rpt

# Report top 100 timing paths, grouped
report_timing -max_paths 100 -sort_by group > /home/Khach123/Documents/Nguyen/me_labs/lab3/reports/sta_timing_group.rpt

# Report top 100 hold violations (min delay)
report_timing -delay_type min -max_paths 100 -sort_by group > /home/Khach123/Documents/Nguyen/me_labs/lab3/reports/hold_violations.rpt

# Report top 100 setup violations (max delay)
report_timing -delay_type max -max_paths 100 -sort_by group > /home/Khach123/Documents/Nguyen/me_labs/lab3/reports/setup_violations.rpt

# Report clocks
report_clocks > /home/Khach123/Documents/Nguyen/me_labs/lab3/reports/clocks.rpt

# Report all constraint violations
report_constraints -all_violators > /home/Khach123/Documents/Nguyen/me_labs/lab3/reports/violations.rpt


