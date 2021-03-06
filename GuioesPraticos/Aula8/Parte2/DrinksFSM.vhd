library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity DrinksFSM is
	port(coin20   : in  std_logic;
		  coin50   : in  std_logic;
		  clk      : in  std_logic;
		  reset    : in  std_logic;
		  drinkOut : out std_logic);
end DrinksFSM;

architecture Behavioral of DrinksFSM is

	type TState is (s0, s1, s2, s3, s4, s5);
	signal pState, nState: TState;
begin
	sync_proc :process(clk)
	begin
		if(rising_edge(clk)) then
			if(reset = '1') then
				pState <= s0;
			else
				pState <= nState;
			end if;
		end if;
	end process;

	comb_proc : process(pState, coin20, coin50)
	begin
		case(pState) is
		when s0 =>
			drinkOut <= '0'; 
			if (coin50 = '1') then
				nState <= s1;
			elsif (coin20 = '1')then
				nState <= s2;
			else
				nState <= pState;
			end if;
			
		when s1 => 
			drinkOut <= '0'; 
			if (coin50 = '1') then
				nState <= s5; 
			elsif (coin20 = '1')then
				nState <= s3; 
			else
				nState <= pState;
			end if;
			
		when s2 => 
			drinkOut <= '0'; 
			if (coin50 = '1') then
				nState <= s3; 
			elsif (coin20 = '1')then
				nState <= s4; 
			else
				nState <= pState;
			end if;
			
		when s3 => 
			drinkOut <= '0'; 
			if (coin50 = '1') then
				nState <= s5;
			elsif (coin20 = '1')then
				nState <= s5; 
			else
				nState <= pState;
			end if;
			
		when s4 => 
			drinkOut <= '0'; 
			if (coin50 = '1') then
				nState <= s5; 
			elsif (coin20 = '1')then
				nState <= s1; 
			else
				nState <= pState;
			end if;
			
		when s5 =>
			drinkOut <= '1'; 
			nState <= s0;
		end case;
	end process;
end Behavioral;
