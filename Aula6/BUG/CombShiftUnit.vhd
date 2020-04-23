library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity CombShiftUnit is
	generic(size : positive := 8);
	port(dataIn   : in  std_logic_vector(size-1 downto 0);
		  dirLeft  : in  std_logic; --Left or right
		  Arit     : in  std_logic; --Aritmetic or logic
		  Rotate   : in  std_logic; --Rotate ou shift
		  shAmount : in  std_logic_vector(2 downto 0); --(log2(size)-1 downto 0), ocorre erro se size nao for potencia de 2
		  dataOut  : out std_logic_vector(size-1 downto 0));
end CombShiftUnit;

architecture Behavioral of CombShiftUnit is

	signal s_shAmount : natural range 0 to size-1;
	
begin
	s_shAmount <= to_integer(unsigned(shAmount));
	process(dirLeft, Arit, Rotate, dataIn, s_shAmount)
	begin
		if(dirLeft = '1') then
			if(Arit = '1') then
				dataOut <= std_logic_vector(SHIFT_LEFT(signed(dataIn), s_shAmount)); --aritmetico left
			else
				if(Rotate = '1') then
					dataOut <= std_logic_vector(ROTATE_LEFT(unsigned(dataIn), s_shAmount)); --rotate left
				else
					dataOut <= std_logic_vector(SHIFT_LEFT(unsigned(dataIn), s_shAmount)); --logico left
				end if;
			end if;
		else
			if(Arit = '1') then
				dataOut <= std_logic_vector(SHIFT_RIGHT(signed(dataIn), s_shAmount)); --aritmetico right
			else
				if(Rotate = '1') then
					dataOut <= std_logic_vector(ROTATE_RIGHT(unsigned(dataIn), s_shAmount)); --rotate right
				else
					dataOut <= std_logic_vector(SHIFT_RIGHT(unsigned(dataIn), s_shAmount)); --logico right
				end if;
			end if;
		end if;
	end process;
end Behavioral;