transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/AndreClerigo/Desktop/Git/LSD/Projeto/Fase2/ControlUnit.vhd}

