-- A package containing component declarations
-- for vga Examples 71 - 74
-- Copyright 2009, 2012 LBE Books, LLC
library IEEE;
use IEEE.std_logic_1164.all;

package vga_components is
	
	component clkdiv
	port(
		mclk : in std_logic;
		clr : in std_logic;
		clk25 : out std_logic);
	end component;

	component clkdiv2
	port(
		mclk : in std_logic;
		clr : in std_logic;
		clk190 : out std_logic;
		clk25 : out std_logic);
	end component;
 
	component clkdiv3
	port(
		mclk : in std_logic;
		clr : in std_logic;
		clk3 : out std_logic;
		clk25 : out std_logic);
	end component;

	component clkdiv4
	port(
		mclk : in std_logic;
		clr : in std_logic;
		clk80 : out std_logic;
		clk40 : out std_logic);
	end component;
 
	component clkdiv40
	port(
		mclk : in std_logic;
		clr : in std_logic;
		clk40 : out std_logic);
	end component;
  
	component clkdiv40190
	port(
		mclk : in std_logic;
		clr : in std_logic;
		clk190 : out std_logic;
		clk40 : out std_logic);
	end component;

	component clkdiv190
	port(
		mclk : in std_logic;
		clr : in std_logic;
		clk190 : out std_logic);
	end component;

	component debounce4
	port(
		cclk : in std_logic;
		clr : in std_logic;
		inp : in std_logic_vector(3 downto 0);
		outp : out std_logic_vector(3 downto 0));
	end component;

	component clock_pulse
	port(
		inp : in std_logic;
		cclk : in std_logic;
		clr : in std_logic;
		outp : out std_logic);
	end component;

	component x7segbc
	port(
		x : in std_logic_vector(15 downto 0);
		cclk : in std_logic;
		clr : in std_logic;
		a_to_g : out std_logic_vector(6 downto 0);
		an : out std_logic_vector(3 downto 0);
		dp : out std_logic );
	end component;

component brom8x16
	port (
	addr: IN std_logic_VECTOR(2 downto 0);
	clk: IN std_logic;
	dout: OUT std_logic_VECTOR(15 downto 0));
end component;

	component counter
	generic(
		N : INTEGER := 8);
	port(
		clr : in std_logic;
		clk : in std_logic;
		q : out std_logic_vector(N-1 downto 0));
	end component;
	
	component vga_640x480
	port(
		clk : in std_logic;
		clr : in std_logic;
		hsync : out std_logic;
		vsync : out std_logic;
		hc : out std_logic_vector(9 downto 0);
		vc : out std_logic_vector(9 downto 0);
		vidon : out std_logic);
	end component;

	component vga_stripes
	port(
		vidon : in std_logic;
		hc : in std_logic_vector(9 downto 0);
		vc : in std_logic_vector(9 downto 0);
		red : out std_logic_vector(2 downto 0);
		green : out std_logic_vector(2 downto 0);
		blue : out std_logic_vector(1 downto 0));
	end component;

	component vga_640x480_mod60
	port(
		clk : in std_logic;
		clr : in std_logic;
		hsync : out std_logic;
		vsync : out std_logic;
		hc : out std_logic_vector(9 downto 0);
		vc : out std_logic_vector(9 downto 0);
		clk60h : out std_logic;
		clk60v : out std_logic;
		vidon : out std_logic);
	end component;

	component vga_checkerboard
	port(
		vidon : in std_logic;
		clk : in std_logic;
		clr : in std_logic;
		hc : in std_logic_vector(9 downto 0);
		vc : in std_logic_vector(9 downto 0);
		clk60h : in std_logic;
		clk60v : in std_logic;
		red : out std_logic_vector(2 downto 0);
		green : out std_logic_vector(2 downto 0);
		blue : out std_logic_vector(1 downto 0));
	end component;
 
	component vga_640x480_mod30
	port(
		clk : in std_logic;
		clr : in std_logic;
		hsync : out std_logic;
		vsync : out std_logic;
		hc : out std_logic_vector(9 downto 0);
		vc : out std_logic_vector(9 downto 0);
		colorcount : out std_logic_vector(7 downto 0);
		vidon : out std_logic);
	end component;

	component vga_256color
	port(
		vidon : in std_logic;
		hc : in std_logic_vector(9 downto 0);
		vc : in std_logic_vector(9 downto 0);
		colorcount : in std_logic_vector(7 downto 0);
		red : out std_logic_vector(2 downto 0);
		green : out std_logic_vector(2 downto 0);
		blue : out std_logic_vector(1 downto 0));
	end component;

	component prom_dmh
	port(
		addr : in std_logic_vector(3 downto 0);
		M : out std_logic_vector(0 to 31));
	end component;

	component vga_initials
	port(
		vidon : in std_logic;
		hc : in std_logic_vector(9 downto 0);
		vc : in std_logic_vector(9 downto 0);
		M : in std_logic_vector(0 to 31);
		sw : in std_logic_vector(7 downto 0);
		rom_addr4 : out std_logic_vector(3 downto 0);
		red : out std_logic_vector(2 downto 0);
		green : out std_logic_vector(2 downto 0);
		blue : out std_logic_vector(1 downto 0));
	end component;

component loons240x160
	port (
	addr: IN std_logic_VECTOR(15 downto 0);
	clk: IN std_logic;
	dout: OUT std_logic_VECTOR(7 downto 0));
end component;
	
	component vga_bsprite
	port(
		vidon : in std_logic;
		hc : in std_logic_vector(9 downto 0);
		vc : in std_logic_vector(9 downto 0);
		M : in std_logic_vector(7 downto 0);
		sw : in std_logic_vector(7 downto 0);
		rom_addr16 : out std_logic_vector(15 downto 0);
		red : out std_logic_vector(2 downto 0);
		green : out std_logic_vector(2 downto 0);
		blue : out std_logic_vector(1 downto 0));
	end component;

	component vga_bsprite4
	port(
		vidon : in std_logic;
		hc : in std_logic_vector(9 downto 0);
		vc : in std_logic_vector(9 downto 0);
		M : in std_logic_vector(7 downto 0);
		sw : in std_logic_vector(7 downto 0);
		rom_addr16 : out std_logic_vector(15 downto 0);
		red : out std_logic_vector(2 downto 0);
		green : out std_logic_vector(2 downto 0);
		blue : out std_logic_vector(1 downto 0));
	end component;

	component vga_screensaver
	port(
		vidon : in std_logic;
		hc : in std_logic_vector(9 downto 0);
		vc : in std_logic_vector(9 downto 0);
		M : in std_logic_vector(7 downto 0);
		C1 : in std_logic_vector(9 downto 0);
		R1 : in std_logic_vector(9 downto 0);
		rom_addr16 : out std_logic_vector(15 downto 0);
		red : out std_logic_vector(2 downto 0);
		green : out std_logic_vector(2 downto 0);
		blue : out std_logic_vector(1 downto 0));
	end component;

	component bounce
	port(
		cclk : in std_logic;
		clr : in std_logic;
		go : in std_logic;
		c1 : out std_logic_vector(9 downto 0);
		r1 : out std_logic_vector(9 downto 0));
	end component;

	component vga_bsprite_resize
	port(
		vidon : in std_logic;
		hc : in std_logic_vector(9 downto 0);
		vc : in std_logic_vector(9 downto 0);
		cnt2 : in std_logic_vector(1 downto 0);
		M : in std_logic_vector(7 downto 0);
		rom_addr14 : out std_logic_vector(13 downto 0);
		red : out std_logic_vector(2 downto 0);
		green : out std_logic_vector(2 downto 0);
		blue : out std_logic_vector(1 downto 0));
	end component;

	component loons100x100
	port (
	addr: IN std_logic_VECTOR(13 downto 0);
	clk: IN std_logic;
	dout: OUT std_logic_VECTOR(7 downto 0));
	end component;

	component fonts
	port (
	addr: IN std_logic_VECTOR(11 downto 0);
	clk: IN std_logic;
	dout: OUT std_logic_VECTOR(7 downto 0));
	end component; 
	
	component vga_fonts
	port(
		vidon : in std_logic;
		hc : in std_logic_vector(9 downto 0);
		vc : in std_logic_vector(9 downto 0);
		M : in std_logic_vector(0 to 7);
		sw : in std_logic_vector(7 downto 0);
		rom_addr12 : out std_logic_vector(11 downto 0);
		red : out std_logic_vector(2 downto 0);
		green : out std_logic_vector(2 downto 0);
		blue : out std_logic_vector(1 downto 0));
	end component;

component moose100x100
	port (
	addr: IN std_logic_VECTOR(13 downto 0);
	clk: IN std_logic;
	dout: OUT std_logic_VECTOR(7 downto 0));
end component;

	component vga_bsprite100
	port(
		vidon : in std_logic;
		hc : in std_logic_vector(9 downto 0);
		vc : in std_logic_vector(9 downto 0);
		M : in std_logic_vector(7 downto 0);
		sw : in std_logic_vector(7 downto 0);
		rom_addr14 : out std_logic_vector(13 downto 0);
		red : out std_logic_vector(2 downto 0);
		green : out std_logic_vector(2 downto 0);
		blue : out std_logic_vector(1 downto 0));
	end component;

	component vga_bsprite100_rotate
	port(
		vidon : in std_logic;
		hc : in std_logic_vector(9 downto 0);
		vc : in std_logic_vector(9 downto 0);
		M : in std_logic_vector(7 downto 0);
		sw : in std_logic_vector(7 downto 0);
		rom_addr14 : out std_logic_vector(13 downto 0);
		red : out std_logic_vector(2 downto 0);
		green : out std_logic_vector(2 downto 0);
		blue : out std_logic_vector(1 downto 0));
	end component;

	component vga_fonts_resize
	port(
		vidon : in std_logic;
		hc : in std_logic_vector(9 downto 0);
		vc : in std_logic_vector(9 downto 0);
		M : in std_logic_vector(0 to 7);
		cnt2 : in std_logic_vector(1 downto 0);
		sw : in std_logic_vector(7 downto 0);
		rom_addr12 : out std_logic_vector(11 downto 0);
		red : out std_logic_vector(2 downto 0);
		green : out std_logic_vector(2 downto 0);
		blue : out std_logic_vector(1 downto 0));
	end component;

	component pix2_100x100
	port (
	addr: IN std_logic_VECTOR(14 downto 0);
	clk: IN std_logic;
	dout: OUT std_logic_VECTOR(7 downto 0));
	end component;

	component vga_bsprite2
	port(
		vidon : in std_logic;
		hc : in std_logic_vector(9 downto 0);
		vc : in std_logic_vector(9 downto 0);
		M : in std_logic_vector(7 downto 0);
		sw : in std_logic_vector(7 downto 0);
		rom_addr15 : out std_logic_vector(14 downto 0);
		red : out std_logic_vector(2 downto 0);
		green : out std_logic_vector(2 downto 0);
		blue : out std_logic_vector(1 downto 0));
	end component;
 
	component vga_bsprite2a
	port(
		vidon : in std_logic;
		hc : in std_logic_vector(9 downto 0);
		vc : in std_logic_vector(9 downto 0);
		M1 : in std_logic_vector(7 downto 0);
		M2 : in std_logic_vector(7 downto 0);
		sw : in std_logic_vector(7 downto 0);
		rom1_addr14 : out std_logic_vector(13 downto 0);
		rom2_addr14 : out std_logic_vector(13 downto 0);
		red : out std_logic_vector(2 downto 0);
		green : out std_logic_vector(2 downto 0);
		blue : out std_logic_vector(1 downto 0));
	end component;

	component vga_fonts_scroll
	port(
		vidon : in std_logic;
		hc : in std_logic_vector(9 downto 0);
		vc : in std_logic_vector(9 downto 0);
		M : in std_logic_vector(0 to 7);
		cnt1 : in std_logic;
		sw : in std_logic_vector(7 downto 0);
		ascii1 : in std_logic_vector(7 downto 0);
		ascii2 : in std_logic_vector(7 downto 0);
		ascii3 : in std_logic_vector(7 downto 0);
		ascii4 : in std_logic_vector(7 downto 0);
		rom_addr12 : out std_logic_vector(11 downto 0);
		red : out std_logic_vector(2 downto 0);
		green : out std_logic_vector(2 downto 0);
		blue : out std_logic_vector(1 downto 0));
	end component;

	component shift_array_fonts
	port(
		clk : in std_logic;
		clr : in std_logic;
		ascii1 : out std_logic_vector(7 downto 0);
		ascii2 : out std_logic_vector(7 downto 0);
		ascii3 : out std_logic_vector(7 downto 0);
		ascii4 : out std_logic_vector(7 downto 0));
	end component;

	component vga_bsprite100ex2
	port(
		vidon : in std_logic;
		hc : in std_logic_vector(9 downto 0);
		vc : in std_logic_vector(9 downto 0);
		M : in std_logic_vector(7 downto 0);
		rom_addr14 : out std_logic_vector(13 downto 0);
		red : out std_logic_vector(2 downto 0);
		green : out std_logic_vector(2 downto 0);
		blue : out std_logic_vector(1 downto 0));
	end component;

	component reh100x100fonts
	port (
	addr: IN std_logic_VECTOR(13 downto 0);
	clk: IN std_logic;
	dout: OUT std_logic_VECTOR(7 downto 0));
	end component;
 
	component vga_reh_fonts_scroll
	port(
		vidon : in std_logic;
		hc : in std_logic_vector(9 downto 0);
		vc : in std_logic_vector(9 downto 0);
		M : in std_logic_vector(0 to 7);
		cnt1 : in std_logic;
		ascii1 : in std_logic_vector(7 downto 0);
		ascii2 : in std_logic_vector(7 downto 0);
		ascii3 : in std_logic_vector(7 downto 0);
		ascii4 : in std_logic_vector(7 downto 0);
		rom_addr14 : out std_logic_vector(13 downto 0);
		red : out std_logic_vector(2 downto 0);
		green : out std_logic_vector(2 downto 0);
		blue : out std_logic_vector(1 downto 0));
	end component;

	component keyboard_ctrl
	port(
		clk25 : in std_logic;
		clr : in std_logic;
		PS2C : in std_logic;
		PS2D : in std_logic;
		keyval1 : out std_logic_vector(7 downto 0);
		keyval2 : out std_logic_vector(7 downto 0);
		keyval3 : out std_logic_vector(7 downto 0));
	end component;

	component key_arrows_move
	port(
		cclk : in std_logic;
		clr : in std_logic;
--		go : in std_logic;
		keyval2 : in std_logic_vector(7 downto 0);
		c1 : out std_logic_vector(9 downto 0);
		r1 : out std_logic_vector(9 downto 0));
	end component;

	component rom8
	port(
		addr : in std_logic_vector(2 downto 0);
		M : out std_logic_vector(7 downto 0));
	end component;

	component vga_fonts_name
	port(
		vidon : in std_logic;
		hc : in std_logic_vector(9 downto 0);
		vc : in std_logic_vector(9 downto 0);
		sw : in std_logic_vector(7 downto 0);
		M : in std_logic_vector(0 to 7);
		N : in std_logic_vector(7 downto 0);
		rom_addr12 : out std_logic_vector(11 downto 0);
		name_addr : out std_logic_vector(3 downto 0);
		red : out std_logic_vector(2 downto 0);
		green : out std_logic_vector(2 downto 0);
		blue : out std_logic_vector(1 downto 0));
	end component;

	component rom16
	port(
		addr : in std_logic_vector(3 downto 0);
		M : out std_logic_vector(7 downto 0));
	end component;
 
	component reh100x100
	port (
	addr: IN std_logic_VECTOR(13 downto 0);
	clk: IN std_logic;
	dout: OUT std_logic_VECTOR(7 downto 0));
end component;

	component vga_reh100
	port(
		vidon : in std_logic;
		hc : in std_logic_vector(9 downto 0);
		vc : in std_logic_vector(9 downto 0);
		M : in std_logic_vector(7 downto 0);
		sw : in std_logic_vector(7 downto 0);
		rom_addr14 : out std_logic_vector(13 downto 0);
		red : out std_logic_vector(2 downto 0);
		green : out std_logic_vector(2 downto 0);
		blue : out std_logic_vector(1 downto 0));
	end component;

	component rom16_loons
	port(
		addr : in std_logic_vector(3 downto 0);
		M : out std_logic_vector(7 downto 0));
	end component;

	component vga_fonts_loons
	port(
		vidon : in std_logic;
		hc : in std_logic_vector(9 downto 0);
		vc : in std_logic_vector(9 downto 0);
		sw : in std_logic_vector(7 downto 0);
		M1 : in std_logic_vector(7 downto 0);
		M2 : in std_logic_vector(0 to 7);
		N : in std_logic_vector(7 downto 0);
		rom_addr12 : out std_logic_vector(11 downto 0);
		rom_addr14 : out std_logic_vector(13 downto 0);
		name_addr : out std_logic_vector(3 downto 0);
		red : out std_logic_vector(2 downto 0);
		green : out std_logic_vector(2 downto 0);
		blue : out std_logic_vector(1 downto 0));
	end component;
 
	component vga_fonts_name4
	port(
		vidon : in std_logic;
		hc : in std_logic_vector(9 downto 0);
		vc : in std_logic_vector(9 downto 0);
		sw : in std_logic_vector(7 downto 0);
		M : in std_logic_vector(0 to 7);
		N : in std_logic_vector(7 downto 0);
		rom_addr12 : out std_logic_vector(11 downto 0);
		name_addr : out std_logic_vector(3 downto 0);
		red : out std_logic_vector(2 downto 0);
		green : out std_logic_vector(2 downto 0);
		blue : out std_logic_vector(1 downto 0));
	end component;

	component vga_fonts_size
	port(
		vidon : in std_logic;
		hc : in std_logic_vector(9 downto 0);
		vc : in std_logic_vector(9 downto 0);
		M : in std_logic_vector(0 to 7);
		sw : in std_logic_vector(7 downto 0);
		rom_addr12 : out std_logic_vector(11 downto 0);
		red : out std_logic_vector(2 downto 0);
		green : out std_logic_vector(2 downto 0);
		blue : out std_logic_vector(1 downto 0));
	end component;
	
	component vga_ram_n2
	port(
		clk40 : in std_logic;
		clk80 : in std_logic;
		clr : in std_logic;
		vidon : in std_logic;
		hc : in std_logic_vector(9 downto 0);
		vc : in std_logic_vector(9 downto 0);
		data0 : in std_logic_vector(15 downto 0);
		addr0 : out std_logic_vector(22 downto 0);
		red : out std_logic_vector(2 downto 0);
		green : out std_logic_vector(2 downto 0);
		blue : out std_logic_vector(1 downto 0));
	end component;

	component vga_ram_chw16
	port(
		clk40 : in std_logic;
		clk80 : in std_logic;
		clr : in std_logic;
		vidon : in std_logic;
		hc : in std_logic_vector(9 downto 0);
		vc : in std_logic_vector(9 downto 0);
		M : in std_logic_vector(7 downto 0);
		sw : in std_logic_vector(7 downto 0);
		rom_addr14 : out std_logic_vector(13 downto 0);
		data0 : in std_logic_vector(15 downto 0);
		addr0 : out std_logic_vector(22 downto 0);
		red : out std_logic_vector(2 downto 0);
		green : out std_logic_vector(2 downto 0);
		blue : out std_logic_vector(1 downto 0));
	end component;

	component vga_flash_n2
	port(
		clk40 : in std_logic;
		clr : in std_logic;
		vidon : in std_logic;
		hc : in std_logic_vector(9 downto 0);
		vc : in std_logic_vector(9 downto 0);
		data0 : in std_logic_vector(15 downto 0);
		addr0 : out std_logic_vector(22 downto 0);
		red : out std_logic_vector(2 downto 0);
		green : out std_logic_vector(2 downto 0);
		blue : out std_logic_vector(1 downto 0));
	end component;

	component vga_ram2_n2
	port(
		clk40 : in std_logic;
		clr : in std_logic;
		vidon : in std_logic;
		hc : in std_logic_vector(9 downto 0);
		vc : in std_logic_vector(9 downto 0);
		data0 : in std_logic_vector(15 downto 0);
		addr0 : out std_logic_vector(22 downto 0);
		red : out std_logic_vector(2 downto 0);
		green : out std_logic_vector(2 downto 0);
		blue : out std_logic_vector(1 downto 0));
	end component;

	component moveme
	port(
		cclk : in std_logic;
		clr : in std_logic;
		go : in std_logic_vector(1 downto 0);
		c1 : out std_logic_vector(9 downto 0);
		r1 : out std_logic_vector(9 downto 0));
	end component;

	component vga_flash_move_loons
	port(
		clk40 : in std_logic;
		clr : in std_logic;
		vidon : in std_logic;
        flip: in std_logic;
		hc : in std_logic_vector(9 downto 0);
		vc : in std_logic_vector(9 downto 0);
		M : in std_logic_vector(7 downto 0);
		C1 : in std_logic_vector(9 downto 0);
		R1 : in std_logic_vector(9 downto 0);
		rom_addr14 : out std_logic_vector(13 downto 0);
		data0 : in std_logic_vector(15 downto 0);
		addr0 : out std_logic_vector(22 downto 0);
		red : out std_logic_vector(2 downto 0);
		green : out std_logic_vector(2 downto 0);
		blue : out std_logic_vector(1 downto 0));
	end component;

	component clock_pulse2
	port(
		cclk : in std_logic;
		clr : in std_logic;
		inp : in std_logic_vector(1 downto 0);
		outp : out std_logic_vector(1 downto 0));
	end component;
 
	component vga_flash_slideshow1
	port(
		clk40 : in std_logic;
		clr : in std_logic;
		vidon : in std_logic;
		hc : in std_logic_vector(9 downto 0);
		vc : in std_logic_vector(9 downto 0);
		sw : in std_logic_vector(1 downto 0);
		data0 : in std_logic_vector(15 downto 0);
		addr0 : out std_logic_vector(22 downto 0);
		red : out std_logic_vector(2 downto 0);
		green : out std_logic_vector(2 downto 0);
		blue : out std_logic_vector(1 downto 0));
	end component;

	component vga_bsprite_minsize
	port(
		vidon : in std_logic;
		hc : in std_logic_vector(9 downto 0);
		vc : in std_logic_vector(9 downto 0);
		cnt2 : in std_logic_vector(1 downto 0);
		M : in std_logic_vector(7 downto 0);
		rom_addr14 : out std_logic_vector(13 downto 0);
		red : out std_logic_vector(2 downto 0);
		green : out std_logic_vector(2 downto 0);
		blue : out std_logic_vector(1 downto 0));
	end component;

	component vga_flash_me_n2
	port(
		clk40 : in std_logic;
		clr : in std_logic;
		vidon : in std_logic;
		hc : in std_logic_vector(9 downto 0);
		vc : in std_logic_vector(9 downto 0);
		 c1 : in STD_LOGIC_VECTOR(9 downto 0);
		 r1 : in STD_LOGIC_VECTOR(9 downto 0);
		M : in std_logic_vector(7 downto 0);
		sw : in std_logic_vector(7 downto 0);
		rom1_addr14 : out std_logic_vector(13 downto 0);
		data0 : in std_logic_vector(15 downto 0);
		addr0 : out std_logic_vector(22 downto 0);
		red : out std_logic_vector(2 downto 0);
		green : out std_logic_vector(2 downto 0);
		blue : out std_logic_vector(1 downto 0));
	end component;
 
	component move_me
	port(
		cclk : in std_logic;
		clr : in std_logic;
		go : in std_logic_vector(1 downto 0);
		c1 : out std_logic_vector(9 downto 0);
		r1 : out std_logic_vector(9 downto 0));
	end component;

	component vga_flash_me2_n2
	port(
		clk40 : in std_logic;
		clr : in std_logic;
		vidon : in std_logic;
		hc : in std_logic_vector(9 downto 0);
		vc : in std_logic_vector(9 downto 0);
		C1 : in std_logic_vector(9 downto 0);
		C2 : in std_logic_vector(9 downto 0);
		R1 : in std_logic_vector(9 downto 0);
		R2 : in std_logic_vector(9 downto 0);
		M : in std_logic_vector(7 downto 0);
		sw : in std_logic_vector(7 downto 0);
		rom_addr14 : out std_logic_vector(13 downto 0);
		data0 : in std_logic_vector(15 downto 0);
		addr0 : out std_logic_vector(22 downto 0);
		red : out std_logic_vector(2 downto 0);
		green : out std_logic_vector(2 downto 0);
		blue : out std_logic_vector(1 downto 0));
	end component;

	component move_me2
	port(
		cclk : in std_logic;
		clr : in std_logic;
		go : in std_logic_vector(1 downto 0);
		c1 : out std_logic_vector(9 downto 0);
		c2 : out std_logic_vector(9 downto 0);
		r1 : out std_logic_vector(9 downto 0);
		r2 : out std_logic_vector(9 downto 0));
	end component;

	component vga_exam2
	port(
		clk40 : in std_logic;
		clr : in std_logic;
		vidon : in std_logic;
		hc : in std_logic_vector(9 downto 0);
		vc : in std_logic_vector(9 downto 0);
		C2 : in std_logic_vector(9 downto 0);
		R2 : in std_logic_vector(9 downto 0);
		M : in std_logic_vector(7 downto 0);
		rom_addr14 : out std_logic_vector(13 downto 0);
		red : out std_logic_vector(2 downto 0);
		green : out std_logic_vector(2 downto 0);
		blue : out std_logic_vector(1 downto 0));
	end component;

	component move_me_exam2
	port(
		cclk : in std_logic;
		clr : in std_logic;
		go : in std_logic_vector(1 downto 0);
		c2 : out std_logic_vector(9 downto 0);
		r2 : out std_logic_vector(9 downto 0));
	end component;

	component move_loons
	port(
		cclk : in std_logic;
		clr : in std_logic;
		go : in std_logic_vector(1 downto 0);
		flip : out std_logic;
		c1 : out std_logic_vector(9 downto 0);
		r1 : out std_logic_vector(9 downto 0));
	end component;
 
	component vga_flash_me_two_n2
	port(
		clk40 : in std_logic;
		clr : in std_logic;
		vidon : in std_logic;
		hc : in std_logic_vector(9 downto 0);
		vc : in std_logic_vector(9 downto 0);
		C1 : in std_logic_vector(9 downto 0);
		C2 : in std_logic_vector(9 downto 0);
		R1 : in std_logic_vector(9 downto 0);
		R2 : in std_logic_vector(9 downto 0);
		M : in std_logic_vector(7 downto 0);
		sw : in std_logic_vector(7 downto 0);
		rom_addr14 : out std_logic_vector(13 downto 0);
		data0 : in std_logic_vector(15 downto 0);
		addr0 : out std_logic_vector(22 downto 0);
		red : out std_logic_vector(2 downto 0);
		green : out std_logic_vector(2 downto 0);
		blue : out std_logic_vector(1 downto 0));
	end component;

	component move_me_two
	port(
		cclk : in std_logic;
		clr : in std_logic;
		go : in std_logic_vector(1 downto 0);
		c1 : out std_logic_vector(9 downto 0);
		c2 : out std_logic_vector(9 downto 0);
		r1 : out std_logic_vector(9 downto 0);
		r2 : out std_logic_vector(9 downto 0));
	end component;

	component move_me_keybd
	port(
		cclk : in std_logic;
		clr : in std_logic;
		keyval2 : in std_logic_vector(7 downto 0);
		c1 : out std_logic_vector(9 downto 0);
		r1 : out std_logic_vector(9 downto 0));
	end component;

	component vga_flash_me_keybd
	port(
		clk40 : in std_logic;
		clr : in std_logic;
		vidon : in std_logic;
		hc : in std_logic_vector(9 downto 0);
		vc : in std_logic_vector(9 downto 0);
		C1 : in std_logic_vector(9 downto 0);
		R1 : in std_logic_vector(9 downto 0);
		M : in std_logic_vector(7 downto 0);
		sw : in std_logic_vector(7 downto 0);
		rom1_addr14 : out std_logic_vector(13 downto 0);
		data0 : in std_logic_vector(15 downto 0);
		addr0 : out std_logic_vector(22 downto 0);
		red : out std_logic_vector(2 downto 0);
		green : out std_logic_vector(2 downto 0);
		blue : out std_logic_vector(1 downto 0));
	end component;

	component mouse_ctrl
	port(
		clk25 : in std_logic;
		clr : in std_logic;
		sel : in std_logic;
		PS2C : inout std_logic;
		PS2D : inout std_logic;
		byte3 : out std_logic_vector(7 downto 0);
		x_data : out std_logic_vector(9 downto 0);
		y_data : out std_logic_vector(9 downto 0));
	end component;
	
	component uart_rx2
	port(
		RxD : in std_logic;
		clk : in std_logic;
		clr : in std_logic;
		rx_data : out std_logic_vector(7 downto 0));
	end component;

	component move_me_uart
	port(
		cclk : in std_logic;
		clr : in std_logic;
		rx_data : in std_logic_vector(7 downto 0);
		c1 : out std_logic_vector(9 downto 0);
		r1 : out std_logic_vector(9 downto 0));
	end component;
 
	component vga_640x480_mod8_14
	port(
		clk : in std_logic;
		clr : in std_logic;
		hsync : out std_logic;
		vsync : out std_logic;
		hc : out std_logic_vector(9 downto 0);
		vc : out std_logic_vector(9 downto 0);
		ascii : out std_logic_vector(7 downto 0);
		cnt14v : out std_logic_vector(3 downto 0);
		vidon : out std_logic);
	end component;

	component vga_fonts_256
	port(
		vidon : in std_logic;
		hc : in std_logic_vector(9 downto 0);
		vc : in std_logic_vector(9 downto 0);
		M : in std_logic_vector(0 to 7);
		ascii : in std_logic_vector(7 downto 0);
		cnt14v : in std_logic_vector(3 downto 0);
		rom_addr12 : out std_logic_vector(11 downto 0);
		red : out std_logic_vector(2 downto 0);
		green : out std_logic_vector(2 downto 0);
		blue : out std_logic_vector(1 downto 0));
	end component;
	
	component flash_offset
	port(
		clr : in std_logic;
		clk : in std_logic;
		offset : out std_logic_vector(7 downto 0));
	end component;

	component vga_flash_slideshow4
	port(
		clk40 : in std_logic;
		clr : in std_logic;
		vidon : in std_logic;
		hc : in std_logic_vector(9 downto 0);
		vc : in std_logic_vector(9 downto 0);
		offset : in std_logic_vector(7 downto 0);
		data0 : in std_logic_vector(15 downto 0);
		addr0 : out std_logic_vector(22 downto 0);
		red : out std_logic_vector(2 downto 0);
		green : out std_logic_vector(2 downto 0);
		blue : out std_logic_vector(1 downto 0));
	end component;
  
	component mux81
	port(
		c : in std_logic_vector(7 downto 0);
		s : in std_logic_vector(2 downto 0);
		z : out std_logic);
	end component;

	component clkdiv403
	port(
		mclk : in std_logic;
		clr : in std_logic;
		clk3 : out std_logic;
		clk40 : out std_logic);
	end component;

	component vga_flash_slideshow
	port(
		clk40 : in std_logic;
		clr : in std_logic;
		vidon : in std_logic;
		hc : in std_logic_vector(9 downto 0);
		vc : in std_logic_vector(9 downto 0);
		offset : in std_logic_vector(7 downto 0);
		data0 : in std_logic_vector(15 downto 0);
		addr0 : out std_logic_vector(22 downto 0);
		red : out std_logic_vector(2 downto 0);
		green : out std_logic_vector(2 downto 0);
		blue : out std_logic_vector(1 downto 0));
	end component;	 
	
	component spi_master_reg
	port(
		sclk : in std_logic;
		clr : in std_logic;
		miso : in std_logic;
		mosi : out std_logic;
		q : out std_logic_vector(7 downto 0));
	end component;

	component joystick_control
	port(
		clk : in std_logic;
		clr : in std_logic;
		sclk : out std_logic;
		ss : out std_logic;
		ldx : out std_logic;
		ldy : out std_logic;
		ldb : out std_logic;
		ldm1 : out std_logic;
		ldm2 : out std_logic;
		ldm3 : out std_logic;
		ldm4 : out std_logic;
		ldm5 : out std_logic);
	end component;

	component reg
	generic(
		N : INTEGER := 8);
	port(
		load : in std_logic;
		clk : in std_logic;
		clr : in std_logic;
		d : in std_logic_vector(N-1 downto 0);
		q : out std_logic_vector(N-1 downto 0));
	end component;

	component move_sprite_keybd
	port(
		cclk : in std_logic;
		clr : in std_logic;
		keyval2 : in std_logic_vector(7 downto 0);
		flip : out std_logic;
		c1 : out std_logic_vector(9 downto 0);
		r1 : out std_logic_vector(9 downto 0));
	end component;

	component vga_flash_sprite_keybd
	port(
		clk40 : in std_logic;
		clr : in std_logic;
		vidon : in std_logic;
		hc : in std_logic_vector(9 downto 0);
		vc : in std_logic_vector(9 downto 0);
		C1 : in std_logic_vector(9 downto 0);
		R1 : in std_logic_vector(9 downto 0);
		M : in std_logic_vector(7 downto 0);
		flip : in std_logic;
		rom1_addr14 : out std_logic_vector(13 downto 0);
		data0 : in std_logic_vector(15 downto 0);
		addr0 : out std_logic_vector(22 downto 0);
		red : out std_logic_vector(2 downto 0);
		green : out std_logic_vector(2 downto 0);
		blue : out std_logic_vector(1 downto 0));
	end component;

	component vga_mouse_initials
	port(
		vidon : in std_logic;
		hc : in std_logic_vector(9 downto 0);
		vc : in std_logic_vector(9 downto 0);
		M : in std_logic_vector(0 to 31);
		cursor_row : in std_logic_vector(9 downto 0);
		cursor_col : in std_logic_vector(9 downto 0);
		rom_addr4 : out std_logic_vector(3 downto 0);
		red : out std_logic_vector(2 downto 0);
		green : out std_logic_vector(2 downto 0);
		blue : out std_logic_vector(1 downto 0));
	end component;

	component prom_cursor
	port(
		addr : in std_logic_vector(3 downto 0);
		M : out std_logic_vector(0 to 15));
	end component;

	component vga_mouse_cursor
	port(
		vidon : in std_logic;
		hc : in std_logic_vector(9 downto 0);
		vc : in std_logic_vector(9 downto 0);
		M : in std_logic_vector(0 to 15);
		cursor_row : in std_logic_vector(9 downto 0);
		cursor_col : in std_logic_vector(9 downto 0);
		rom_addr4 : out std_logic_vector(3 downto 0);
		red : out std_logic_vector(2 downto 0);
		green : out std_logic_vector(2 downto 0);
		blue : out std_logic_vector(1 downto 0));
	end component;

	component vga_flash_sprite
	port(
		clk40 : in std_logic;
		clr : in std_logic;
		vidon : in std_logic;
		hc : in std_logic_vector(9 downto 0);
		vc : in std_logic_vector(9 downto 0);
		C1 : in std_logic_vector(9 downto 0);
		R1 : in std_logic_vector(9 downto 0);
		M : in std_logic_vector(7 downto 0);
		flip : in std_logic;
		rom1_addr14 : out std_logic_vector(13 downto 0);
		data0 : in std_logic_vector(15 downto 0);
		addr0 : out std_logic_vector(22 downto 0);
		red : out std_logic_vector(2 downto 0);
		green : out std_logic_vector(2 downto 0);
		blue : out std_logic_vector(1 downto 0));
	end component;

	component joystick_interface
	port(
		clk25 : in std_logic;
		clr : in std_logic;
		miso : in std_logic;
		mosi : out std_logic;
		ss : out std_logic;
		sck : out std_logic;
		qx : out std_logic_vector(9 downto 0);
		qy : out std_logic_vector(9 downto 0);
		btnjoy : out std_logic_vector(2 downto 0));
	end component;

	component joystick_controller
	port(
		clk25 : in std_logic;
		clr : in std_logic;
		miso : in std_logic;
		mosi : out std_logic;
		ss : out std_logic;
		sck : out std_logic;
		qx : out std_logic_vector(9 downto 0);
		qy : out std_logic_vector(9 downto 0);
		btnjoy : out std_logic_vector(2 downto 0));
	end component;	 
	
	component uart_rx
	port(
		RxD : in std_logic;
		clk : in std_logic;
		clr : in std_logic;
		rdrf_clr : in std_logic;
		rdrf : out std_logic;
		FE : out std_logic;
		rx_data : out std_logic_vector(7 downto 0));
	end component;

	component test_rx_ctrl
	port(
		clk : in std_logic;
		clr : in std_logic;
		rdrf : in std_logic;
		rdrf_clr : out std_logic);
	end component;

	component move_sprite_pckeybd
	port(
		cclk : in std_logic;
		clr : in std_logic;
		rx_data : in std_logic_vector(7 downto 0);
		flip : out std_logic;
		c1 : out std_logic_vector(9 downto 0);
		r1 : out std_logic_vector(9 downto 0));
	end component;

	component clkdiv40pc
	port(
		mclk : in std_logic;
		clr : in std_logic;
		clkpc : out std_logic;
		clk40 : out std_logic);
	end component; 
	
component fonts_ram32
	port (
	addra: IN std_logic_VECTOR(4 downto 0);
	addrb: IN std_logic_VECTOR(4 downto 0);
	clka: IN std_logic;
	clkb: IN std_logic;
	dina: IN std_logic_VECTOR(7 downto 0);
	doutb: OUT std_logic_VECTOR(7 downto 0);
	wea: IN std_logic);
end component;

	component ram32_ctrl
	port(
		clk : in std_logic;
		clr : in std_logic;
		rdrf : in std_logic;
		addra : out std_logic_vector(4 downto 0);
		wea : out std_logic;
		rdrf_clr : out std_logic);
	end component;

	component vga_fonts_pckeybd
	port(
		vidon : in std_logic;
		hc : in std_logic_vector(9 downto 0);
		vc : in std_logic_vector(9 downto 0);
		sw : in std_logic_vector(7 downto 0);
		M2 : in std_logic_vector(0 to 7);
		N : in std_logic_vector(7 downto 0);
		rom_addr12 : out std_logic_vector(11 downto 0);
		addrb : out std_logic_vector(4 downto 0);
		red : out std_logic_vector(2 downto 0);
		green : out std_logic_vector(2 downto 0);
		blue : out std_logic_vector(1 downto 0));
	end component;

		
end vga_components; 
  
  
