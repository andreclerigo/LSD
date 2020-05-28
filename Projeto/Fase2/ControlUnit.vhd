library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity ControlUnit is
	port map(CLK   	: in  std_logic;
				Opcode   : in std_logic_vector(2 downto 0);
				Func		: in std_logic_vector(3 downto 0);
				RESET 	: out std_Logic;
				EnPC  	: out std_logic;
				RI    	: out std_logic;
				RegDst	: out std_logic;
				RegWr 	: out std_logic;
				ALUSrc	: out std_logic;
				MemWr 	: out std_logic;
				MemToReg : out std_logic;
				ALUOp    : out std_logic_vector(3 downto 0));
end ControlUnit;

architecture Behavioral of ControlUnit is
	type TState is (Reset, Fetch, Decode, Execute, RegUpdate, WriteMem);
	signal pState, nState: TState;
begin
	sync_proc: process(clk)
	begin
		if (rising_edge(clk)) then
			pState <= nState;
		end if;
	end process;
	
	comb_proc: process(nState, Reset, Opcode, Func)
	begin
		pState <= Reset;
		case(pState) is
			when Reset =>
				RESET  <= '1';
				nState <= Fetch;
				
			when Fetch =>
				RI 	 <= '1';
				EnPC   <= '1';
				nState <= Decode;
							when Decode =>
				if (Opcode = "000") then     --Caso 000 NOP (Nao fazer nada)
					nState 	<= Fetch;
				elsif (Opcode = "001") then  --Caso 001 Tipo 1
					RegDst 	<= '0';
					ALUSrc 	<= '0';
					MemToReg <= '0';
					ALUOp  	<= Func;
					nState 	<= Execute;
				elsif (Opcode = "111") then  --Caso 111 LW (Tipo 2 com MemToReg = 1)
					RegDst 	<= '1';
					ALUSrc 	<= '1';
					MemToReg <= '1';
					ALUOp  	<= "0000";
					nState 	<= Execute;
				else                         --Resto dos casos tipo 2
					RegDst 	<= '1';
					ALUSrc 	<= '1';
					ALUOp  	<= "0000";
					nState 	<= Execute;
					
			when Execute =>
				
				
			when RegUpdate =>
				RegWr  <= '1';
				ALUOp  <= "0000";
				nState <= Fetch;
				
			when WriteMem 	=>
				MemWr  <= '1';
				ALUOp  <= "0000";
				nState <= Fetch;
		end case;
	end process
end Behavioral;