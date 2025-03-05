----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/24/2025 08:42:59 AM
-- Design Name: 
-- Module Name: sevenseg_decoder_tb - tb
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sevenseg_decoder_tb is
--  Port ( );
 Port ( i_Hex : in STD_LOGIC_VECTOR (3 downto 0);
           o_seg_n : out STD_LOGIC_VECTOR (6 downto 0));
end sevenseg_decoder_tb;

architecture tb of sevenseg_decoder_tb is
component sevenseg_decoder is
          Port( i_Hex : in STD_LOGIC_VECTOR (3 downto 0);
           o_seg_n : out STD_LOGIC_VECTOR (6 downto 0));
           
           end component;
    signal w_sw: std_logic_vector(3 downto 0) := (others=> '0');
    signal w_seg: std_logic_vector(6 downto 0);
begin
    sevenseg_decoder_inst:sevenseg_decoder port map(
    i_Hex => w_sw,
    o_seg_n => w_seg
    );
    
    test: process
    begin
    w_sw <= x"3"; wait for 10 ns;
        assert w_seg = "0110000" report "bad with hex" severity failure;
    w_sw <= x"7"; wait for 10 ns;
        assert w_seg = "1111000" report "bad with hex" severity failure;
    w_sw <= x"C"; wait for 10 ns;
        assert w_seg = "0100111" report "bad with hex" severity failure;
       
     end process;

end tb;
