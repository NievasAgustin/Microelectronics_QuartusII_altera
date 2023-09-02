transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/altera/14.1/quartus/bin64/micro1/TpFinal {C:/altera/14.1/quartus/bin64/micro1/TpFinal/alu.sv}
vlog -sv -work work +incdir+C:/altera/14.1/quartus/bin64/micro1/TpFinal {C:/altera/14.1/quartus/bin64/micro1/TpFinal/top.sv}

