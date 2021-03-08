transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/AndreClerigo/Desktop/Git/LSD/Projeto/Fase3/SignExtend_7b_to_8b.vhd}
vcom -93 -work work {C:/Users/AndreClerigo/Desktop/Git/LSD/Projeto/Fase3/Registers8.vhd}
vcom -93 -work work {C:/Users/AndreClerigo/Desktop/Git/LSD/Projeto/Fase3/Project_Fase1.vhd}
vcom -93 -work work {C:/Users/AndreClerigo/Desktop/Git/LSD/Projeto/Fase3/ProgramCounter_12.vhd}
vcom -93 -work work {C:/Users/AndreClerigo/Desktop/Git/LSD/Projeto/Fase3/Mux2_1_8b.vhd}
vcom -93 -work work {C:/Users/AndreClerigo/Desktop/Git/LSD/Projeto/Fase3/IMemory_16_16.vhd}
vcom -93 -work work {C:/Users/AndreClerigo/Desktop/Git/LSD/Projeto/Fase3/DMemory_256_8.vhd}
vcom -93 -work work {C:/Users/AndreClerigo/Desktop/Git/LSD/Projeto/Fase3/ControlUnit.vhd}
vcom -93 -work work {C:/Users/AndreClerigo/Desktop/Git/LSD/Projeto/Fase3/ALU8.vhd}
vcom -93 -work work {C:/Users/AndreClerigo/Desktop/Git/LSD/Projeto/Fase3/MicroProcessor.vhd}

