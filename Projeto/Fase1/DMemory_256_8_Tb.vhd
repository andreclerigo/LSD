library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity DMemory_256_8_Tb is
	generic(nBits    : integer := 8);
	port(clk         : in  std_logic;
		  writeEnable : in  std_logic;
		  writeData   : in  std_logic_vector(nBits-1 downto 0);
		  address 	  : in  std_logic_vector(nBits-1 downto 0);
		  readData    : out std_logic_vector(nBits-1 downto 0));
end DMemory_256_8;

architecture Stimulus of DMemory_256_8_Tb is
	signal s_clk 			: std_logic;
	signal s_writeEnable : std_logic;
	signal s_writeData   : std_logic(7 downto 0);
	signal s_adress 		: std_logic(7 downto 0);
	signal s_readData 	: std_logic(7 downto 0);
begin
	rom: entity work.DMemory_256_8(Behavioral)
		port map(clk         => s_clk,
					writeEnable => s_reset,
					writeData   => s_outputs,
					adress      => s_adress,
					readData    => s_readData);
	
	clk_proc: process
	begin
		clk <= '1';
		wait for 50 ns;
		clk <= '0';
		wait for 50 ns;
	end process;
	
	stim_proc: process
	begin
	end process;
end Stimulus;