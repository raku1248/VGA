--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:41:23 05/26/2014
-- Design Name:   
-- Module Name:   D:/PROGRAMOWANIE/Github/VGA//Control_test.vhd
-- Project Name:  VGA
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: VGAControler
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Control_test IS
END Control_test;
 
ARCHITECTURE behavior OF Control_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT VGAControler
    PORT(
         clk_i : IN  std_logic;
         HCount : INOUT  std_logic_vector(0 to 8);
         VCount : INOUT  std_logic_vector(0 to 9);
         en_o : INOUT  std_logic;
         hs_o : OUT  std_logic;
         vs_o : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk_i : std_logic := '0';

	--BiDirs
   signal HCount : std_logic_vector(0 to 8);
   signal VCount : std_logic_vector(0 to 9);
   signal en_o : std_logic;

 	--Outputs
   signal hs_o : std_logic;
   signal vs_o : std_logic;

   -- Clock period definitions
   constant clk_i_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: VGAControler PORT MAP (
          clk_i => clk_i,
          HCount => HCount,
          VCount => VCount,
          en_o => en_o,
          hs_o => hs_o,
          vs_o => vs_o
        );

   -- Clock process definitions
   clk_i_process :process
   begin
		clk_i <= '0';
		wait for clk_i_period/2;
		clk_i <= '1';
		wait for clk_i_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_i_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
