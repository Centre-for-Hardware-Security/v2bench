#set directories path
# TODO change this to point to your own asic library 
set init_lib { /designkits/myfoundry/mylib.lib }

# these lines make sure the generated netlist file is simple to parse. keep them.
set_db hdl_bus_wire_naming_style %s_%d
set_db hdl_reg_naming_style %s_%s
set_db hdl_instance_array_naming_style %s_%d
set_db hdl_array_naming_style %s_%d
set_db hdl_instance_array_naming_style %s_%d

# TODO set design name (or) top module name
set DESIGN "mytop"

# TODO point to the right RTL files
set RTL_LIST_1 { file1.v}

set_db hdl_error_on_latch true
read_libs ${init_lib}
read_hdl ${RTL_LIST_1}

# TODO: here you have to list all cells you are going to allow synthesis to use. the sample here matches TSMC terminology for basic gates.
set_dont_use * true
set_dont_use DFQD1 false
set_dont_use INVD0 false
set_dont_use AN2D0 false
set_dont_use OR2D0 false
set_dont_use ND2D0 false
set_dont_use NR2XD0 false

# Elaborate the top level
elaborate $DESIGN
check_design -unresolved
report timing -lint

set_db syn_generic_effort high
syn_generic

ungroup -flatten -all

set_db syn_map_effort high
syn_map

bitblast_all_ports

set_db syn_opt_effort high
syn_opt
syn_opt -incr

puts \n 
puts "Synthesis Finished!         "
puts \n
