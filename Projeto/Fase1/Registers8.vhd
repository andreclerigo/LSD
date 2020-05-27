library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Registers8 is
	generic(adressBits: integer := 3;
			  dataBits  : integer := 8);
	port(ReadAdress1  : in  std_logic_vector(adressBits-1 downto 0);
		  ReadAdress2  : in  std_logic_vector(adressBits-1 downto 0);
		  WriteData    : in  std_logic_vector(dataBits-1 downto 0);
		  WriteAdress  : in  std_logic;
		  WriteEnable  : in  std_logic;
		  ReadData1    : out std_logic_vector(dataBits-1 downto 0);
		  ReadData2    : out std_logic_vector(dataBits-1 downto 0));
end Registers8;

architecture Behavioral of Registers8 is
begin
end Behavioral;