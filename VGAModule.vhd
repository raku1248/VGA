
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity VGAModule is
	PORT(
		clk_i : in STD_LOGIC;
		sw_i : in STD_LOGIC_VECTOR(2 downto 0);
		blu_o : out STD_LOGIC;
		grn_o : out STD_LOGIC;
		red_o : out STD_LOGIC;
		hs_o : out STD_LOGIC;
		vs_o : out STD_LOGIC
		);
		
end VGAModule;

architecture Behavioral of VGAModule is

begin


end Behavioral;

