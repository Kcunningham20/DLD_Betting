library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.all;

entity keyboard_ctrl is
  Port (
        clk25 : in STD_LOGIC;
        clr : in STD_LOGIC;
        PS2C : in STD_LOGIC;
        PS2D : in STD_LOGIC;
        keyval1 : out STD_LOGIC_VECTOR(7 downto 0);
        keyval2 : out STD_LOGIC_VECTOR(7 downto 0);
        keyval3 : out STD_LOGIC_VECTOR(7 downto 0)
        );
end keyboard_ctrl;

architecture keyboard_ctrl of keyboard_ctrl is
type state_type is (start, wtclklo1, wtclkhi1, getkey1, wtclklo2, wtclkhi2, getkey2, breakey, wtclklo3, wtclkhi3, getkey3);
signal state: state_type;
signal PS2Cf, PS2Df: std_logic;
signal ps2c_filter, ps2d_filter: STD_LOGIC_VECTOR(7 downto 0);
signal shift1, shift2, shift3: STD_LOGIC_VECTOR(10 downto 0);
signal keyval1s, keyval2s, keyval3s: STD_LOGIC_VECTOR(7 downto 0);
signal bit_count: STD_LOGIC_VECTOR(3 downto 0);
constant bit_count_max: STD_LOGIC_VECTOR(3 downto 0) := "1011";

begin
-- filter for PS2 clock and data
filter: process(clk25, clr)
begin
    if clr = '1' then
        ps2c_filter <= (others => '1');
        ps2d_filter <= (others => '1');
        PS2Cf  <= '1';
        PS2Df  <= '1';
    elsif clk25'event and clk25 = '1' then
        ps2c_filter(7) <= PS2C;
        ps2c_filter(6 downto 0) <= ps2c_filter(7 downto 1);
        ps2d_filter(7) <= PS2D;
        ps2d_filter(6 downto 0) <= ps2d_filter(7 downto 1);
        if ps2c_filter = X"FF" then
            PS2Cf <= '1';
        elsif ps2c_filter = X"00" then
            PS2Cf <= '0';
        end if;
        if ps2d_filter = X"FF" then
            PS2Df <= '1';
        elsif ps2d_filter = X"00" then
            PS2Df <= '0';
        end if;
    end if;
end process filter;

--state machine for reading the keyboard
skey: process(clk25, clr)
begin
    if (clr = '1') then
        state <= start;
        bit_count <= (others => '0');
        shift1 <= (others => '0');
        shift2 <= (others => '0');
        shift3 <= (others => '0');
        keyval1s <= (others => '0');
        keyval2s <= (others => '0');
        keyval3s <= (others => '0');
    elsif (clk25'event AND clk25 = '1') then
        case state is 
            when start =>
                if PS2Df = '1' then
                    state <= start;
                else
                    state <= wtclklo1;
                end if;
            when wtclklo1 =>  --wait for clock low
                if bit_count < bit_count_max then
                    if PS2Cf = '1' then
                        state <= wtclklo1;
                    else 
                        state <= wtclkhi1;
                            shift1 <= PS2Df & shift1(10 downto 1);
                    end if;
                else 
                    state <= getkey1;
                end if;
            when wtclkhi1 =>   --wait for clock high
                if PS2Cf = '0' then
                    state <= wtclkhi1;
                else 
                    state <= wtclklo1;
                    bit_count <= bit_count+1;
                end if;
            when getkey1 => --get key value
                keyval1s <= shift1(8 downto 1);
                bit_count <= (others => '0');
                state <= wtclklo2;
            when wtclklo2 => --wait for clock low
                if bit_count < bit_count_max then
                    if PS2Cf = '1' then
                        state <= wtclklo2;
                    else
                        state <= wtclkhi2; -- get ack byte FA
                        shift2 <= PS2Df & shift2(10 downto 1);
                    end if;
                else
                    state <= getkey2;
                end if;
            when wtclkhi2 => -- wait for clock high
                if PS2Cf = '0' then
                    state <= wtclkhi2;
                else
                    state <= wtclklo2;
                    bit_count <= bit_count + 1;
                end if;
            when getkey2 => -- get key val
                keyval2s <= shift2(8 downto 1);
                bit_count <= (others => '0');
                state <= breakey;
            when breakey => 
                if keyval2s = X"F0" then
                    state <= wtclklo3;
                else
                    if keyval1s = X"E0" then
                        state <= wtclklo1;
                    else
                        state <= wtclklo2;
                    end if;
                end if;
            when wtclklo3 => --wait for clock low
                if bit_count < bit_count_max then
                    if PS2Cf = '1' then
                        state <= wtclklo3;
                    else
                        state <= wtclkhi3;
                            shift3 <= PS2Df & shift3(10 downto 1);
                    end if;
                else
                    state <= getkey3;
                end if;
            when wtclkhi3 => --wait for clock high
                if PS2Cf = '0' then
                    state <= wtclkhi3;
                else
                    state <= wtclklo3;
                    bit_count <= bit_count + 1;
                end if;
            when getkey3 => --get key value
                keyval3s <= shift3(8 downto 1);
                bit_count <= (others => '0');
                state <= wtclklo1;
        end case;
    end if;
end process skey;

keyval1 <= keyval1s;
keyval2 <= keyval2s;
keyval3 <= keyval3s;

end keyboard_ctrl;
