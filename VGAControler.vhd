
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity VGAControler is
	PORT(
		clk_i : in STD_LOGIC;
      HCount : INOUT  std_logic_vector(0 to 8);
      VCount : INOUT  std_logic_vector(0 to 9);
		en_o : inout STD_LOGIC;
		hs_o : out STD_LOGIC;
		vs_o : out STD_LOGIC
		);
end VGAControler;

architecture Behavioral of VGAControler is

signal pixel_clk : STD_LOGIC:='0';

	constant clock_freq : integer := 50_000_000;
	constant pixel_clock_freq : integer := 25_000_000;
	
	constant HV : integer := 640;
	constant VV : integer := 480;
	
	constant hSP : integer := 95;
	constant hBP : integer := 48;
	constant hFP : integer := 16;
	constant Hpixeltime: integer := HV + hSP + hBP + hFP;
	
	constant vSP : integer := 2;
	constant vBP : integer := 29;
	constant vFP : integer := 10;
	constant Vpixeltime : integer := VV + vSP + vBP + vFP; 

begin

pix_clk : process(clk_i)

	variable counter : integer range 0 to ((clock_freq/pixel_clock_freq) - 1) := 0;
	
	variable Vcounter : integer range 0 to Vpixeltime:= 0;
	variable Hcounter : integer range 0 to Hpixeltime:= 0;
	
begin
	
	if rising_edge(clk_i) then			-- CLOCK 25 HZ
		if(counter /= ((clock_freq/pixel_clock_freq)-1)) then
			counter := counter + 1;
			
		else
			counter := 0;
			
			
			
			
			if(Vcounter /= Vpixeltime) then
				
					if(Hcounter /= Hpixeltime) then
						
						if(Vcounter > vSP + vBP-1) then
								
							if(Vcounter < vSP + vBP + VV) then	
								if(Hcounter < hSP + 1) then
									hs_o <= '0';
								else
									hs_o <= '1';
								end if;
								
								if(Vcounter < vSP) then
									vs_o <= '0';
								else
									vs_o <= '1';
								end if;
								
								if(Hcounter > hSP + hBP and Hcounter < hSP + hBP + HV + 1) then
									en_o <= '1';
									HCount <= HCount + 1;
								else
									en_o <= '0';
									HCount <= (others=>'0');
								end if;
							else
								hs_o <= '1';
								
								if(Vcounter < vSP + vBP + VV + vFP) then
								vs_o <= '1';
								else
								vs_o <= '0';
								end if;
							end if;
						
								
						else
							hs_o <= '1';
							
							if(Vcounter < vSP) then
							vs_o <= '0';
							else
							vs_o <= '1';
							end if;
						
						end if;
					
					
						Hcounter:= Hcounter + 1;
					else
						Hcounter:= 0;
						Vcounter:= Vcounter + 1;
					end if;
				
				
			else
				Vcounter := 0;
			end if;
			
			
			
			
			
		end if;
	end if;
	

end process;

end Behavioral;

