transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/altera/13.0sp1/alu_32bit/adder.vhd}
vcom -93 -work work {C:/altera/13.0sp1/alu_32bit/full_adder.vhd}
vcom -93 -work work {C:/altera/13.0sp1/alu_32bit/half_adder.vhd}
vcom -93 -work work {C:/altera/13.0sp1/alu_32bit/xor_gate_1bit.vhd}
vcom -93 -work work {C:/altera/13.0sp1/alu_32bit/or_gate_1bit.vhd}
vcom -93 -work work {C:/altera/13.0sp1/alu_32bit/and_gate_1bit.vhd}
vcom -93 -work work {C:/altera/13.0sp1/alu_32bit/divider.vhd}
vcom -93 -work work {C:/altera/13.0sp1/alu_32bit/mod_operator.vhd}
vcom -93 -work work {C:/altera/13.0sp1/alu_32bit/full_subtractor.vhd}
vcom -93 -work work {C:/altera/13.0sp1/alu_32bit/half_subtractor.vhd}
vcom -93 -work work {C:/altera/13.0sp1/alu_32bit/and_gate.vhd}
vcom -93 -work work {C:/altera/13.0sp1/alu_32bit/nand_gate.vhd}
vcom -93 -work work {C:/altera/13.0sp1/alu_32bit/or_gate.vhd}
vcom -93 -work work {C:/altera/13.0sp1/alu_32bit/nor_gate.vhd}
vcom -93 -work work {C:/altera/13.0sp1/alu_32bit/xor_gate.vhd}
vcom -93 -work work {C:/altera/13.0sp1/alu_32bit/xnor_gate.vhd}
vcom -93 -work work {C:/altera/13.0sp1/alu_32bit/not_gate.vhd}
vcom -93 -work work {C:/altera/13.0sp1/alu_32bit/multiplier.vhd}
vcom -93 -work work {C:/altera/13.0sp1/alu_32bit/not_gate_1bit.vhd}
vcom -93 -work work {C:/altera/13.0sp1/alu_32bit/subtractor.vhd}
vcom -93 -work work {C:/altera/13.0sp1/alu_32bit/alu_32bit.vhd}
vcom -93 -work work {C:/altera/13.0sp1/alu_32bit/comparator.vhd}
vcom -93 -work work {C:/altera/13.0sp1/alu_32bit/comp_4bit.vhd}
vcom -93 -work work {C:/altera/13.0sp1/alu_32bit/right_shift.vhd}
vcom -93 -work work {C:/altera/13.0sp1/alu_32bit/left_shift.vhd}
vcom -93 -work work {C:/altera/13.0sp1/alu_32bit/right_ rotate.vhd}
vcom -93 -work work {C:/altera/13.0sp1/alu_32bit/left_rotate.vhd}
vcom -93 -work work {C:/altera/13.0sp1/alu_32bit/a_right_shift.vhd}
vcom -93 -work work {C:/altera/13.0sp1/alu_32bit/a_left_shift.vhd}
vcom -93 -work work {C:/altera/13.0sp1/alu_32bit/control.vhd}

vcom -93 -work work {C:/altera/13.0sp1/alu_32bit/simulation/modelsim/alu_32bit.vht}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cycloneii -L rtl_work -L work -voptargs="+acc"  alu_32bit_vhd_tst

add wave *
view structure
view signals
run 2000 ns
