transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vcom -93 -work work {alu_32bit.vho}

vcom -93 -work work {C:/altera/13.0sp1/alu_32bit/simulation/modelsim/alu_32bit.vht}

vsim -t 1ps +transport_int_delays +transport_path_delays -sdftyp /i1=alu_32bit_vhd.sdo -L cycloneii -L gate_work -L work -voptargs="+acc"  alu_32bit_vhd_tst

add wave *
view structure
view signals
run 2000 ns
