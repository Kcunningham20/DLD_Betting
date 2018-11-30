-- Example 6a: clock divider
-- Copyright 2009, 2012 LBE Books, LLC
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_unsigned.all;

entity clkdiv2 is
	 port(
		 mclk : in STD_LOGIC;
		 clr : in STD_LOGIC;
		 clk190 : out STD_LOGIC;
		 clk25 : out STD_LOGIC
	     );
end clkdiv2;

architecture clkdiv2 of clkdiv2 is
signal q:STD_LOGIC_VECTOR(23 downto 0);
begin
  -- clock divider
  process(mclk, clr)
  begin
    if clr = '1' then
		q <= (others => '0');
    elsif mclk'event and mclk='1' then
		q <= q + 1;
    end if;
  end process;
  
  clk25 <= q(0);	-- 25 MHz
  clk190 <= q(17);	-- 190 Hz
  
end clkdiv2;