-- hds header_start
--
-- VHDL Architecture eng_bassam.first_key.rtl
--
-- Created:
--          by - ahmed.UNKNOWN (AHMEDSAMY)
--          at - 11:25:09 02/21/2019
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2001.5 (Build 170)
--
-- hds header_end
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;


ENTITY key3 IS
-- Declarations
	 port (
			key : in std_logic_vector(127 downto 0);
			kin : in std_logic_vector(63 downto 0);
			en  : in std_logic;
			clk,rst : std_logic;
			y: out std_logic_vector(63 downto 0)
	 		);
END key3 ;

-- hds interface_end
ARCHITECTURE rtl OF key3 IS
	signal k1,k2 :std_logic_vector(63 downto 0);
	signal rest:unsigned (7 downto 0);
	type t_array is array (0 to 6) of std_logic_vector(63 downto 0);
	signal  K_All : t_array;
	signal count,m,o :NATURAL;
BEGIN
process(clk)
BEGIN

if ((en = '1')  ) then
   y <= K_All(o);
   if ( o < 5) then
   		o <= o + 1;
   end if ;
end if;

if (rst = '1') then
	--y <=key(127 downto 64);
	count <= 0 ;
	K_All(0) <= key(127 downto 64);
	K_All(1) <= key(63 downto 0);
	m <= 2;
	o <= 0;
	rest<= (others =>'0');
elsif (rest = 0 ) then
	k1   <= key(127 downto 64);
	k2   <= key(63 downto 0);
	--y   <= key(63 downto 0);
	rest <= rest +1 ;
elsif (count < 5) then
	if (rest = 1+count*4) then
		k1   <= k1(40 downto 0)&k1(63 downto 41); 
		k2   <= k2 xor kin ;
    	rest <= rest +1 ;
	
	elsif (rest = 2+count*4) then
		k1   <=k1 xor k2 ;
		k2   <= k2(22 downto 0) & k2(63 downto 23);
		rest <= rest +1 ;

	elsif (rest = 3+count*4) then

		rest<=rest+1;
----------------------------------------S1-----------------------------------------------------------
	 	for i  in 0 to 7 loop	
			   if (k2 ((3+(i*8)) downto (i*8)) = "0000") then k2 ((3+(i*8)) downto (i*8)) <= "0010";
			elsif (k2 ((3+(i*8)) downto (i*8)) = "0001") then k2 ((3+(i*8)) downto (i*8)) <= "0011";
			elsif (k2 ((3+(i*8)) downto (i*8)) = "0010") then k2 ((3+(i*8)) downto (i*8)) <= "0000";
			elsif (k2 ((3+(i*8)) downto (i*8)) = "0011") then k2 ((3+(i*8)) downto (i*8)) <= "0001";
			elsif (k2 ((3+(i*8)) downto (i*8)) = "0100") then k2 ((3+(i*8)) downto (i*8)) <= "1011";
			elsif (k2 ((3+(i*8)) downto (i*8)) = "0101") then k2 ((3+(i*8)) downto (i*8)) <= "1110";
			elsif (k2 ((3+(i*8)) downto (i*8)) = "0110") then k2 ((3+(i*8)) downto (i*8)) <= "1010";
			elsif (k2 ((3+(i*8)) downto (i*8)) = "0111") then k2 ((3+(i*8)) downto (i*8)) <= "1101";
			elsif (k2 ((3+(i*8)) downto (i*8)) = "1000") then k2 ((3+(i*8)) downto (i*8)) <= "1111";
			elsif (k2 ((3+(i*8)) downto (i*8)) = "1001") then k2 ((3+(i*8)) downto (i*8)) <= "1100";
			elsif (k2 ((3+(i*8)) downto (i*8)) = "1010") then k2 ((3+(i*8)) downto (i*8)) <= "0110";
			elsif (k2 ((3+(i*8)) downto (i*8)) = "1011") then k2 ((3+(i*8)) downto (i*8)) <= "0100";
			elsif (k2 ((3+(i*8)) downto (i*8)) = "1100") then k2 ((3+(i*8)) downto (i*8)) <= "1001";
			elsif (k2 ((3+(i*8)) downto (i*8)) = "1101") then k2 ((3+(i*8)) downto (i*8)) <= "0111";
			elsif (k2 ((3+(i*8)) downto (i*8)) = "1110") then k2 ((3+(i*8)) downto (i*8)) <= "0101";
			elsif (k2 ((3+(i*8)) downto (i*8)) = "1111") then k2 ((3+(i*8)) downto (i*8)) <= "1000";
 			end if ;
-----------------------------------------S2-----------------------------------------------------------
			   if (k2 ((7+(i*8)) downto (4+(i*8))) = "0000") then k2 ((7+(i*8)) downto (4+(i*8))) <= "1101";
			elsif (k2 ((7+(i*8)) downto (4+(i*8))) = "0001") then k2 ((7+(i*8)) downto (4+(i*8))) <= "0011";
			elsif (k2 ((7+(i*8)) downto (4+(i*8))) = "0010") then k2 ((7+(i*8)) downto (4+(i*8))) <= "0101";
			elsif (k2 ((7+(i*8)) downto (4+(i*8))) = "0011") then k2 ((7+(i*8)) downto (4+(i*8))) <= "0001";
			elsif (k2 ((7+(i*8)) downto (4+(i*8))) = "0100") then k2 ((7+(i*8)) downto (4+(i*8))) <= "1110";
			elsif (k2 ((7+(i*8)) downto (4+(i*8))) = "0101") then k2 ((7+(i*8)) downto (4+(i*8))) <= "0010";
			elsif (k2 ((7+(i*8)) downto (4+(i*8))) = "0110") then k2 ((7+(i*8)) downto (4+(i*8))) <= "1010";
			elsif (k2 ((7+(i*8)) downto (4+(i*8))) = "0111") then k2 ((7+(i*8)) downto (4+(i*8))) <= "1111";
			elsif (k2 ((7+(i*8)) downto (4+(i*8))) = "1000") then k2 ((7+(i*8)) downto (4+(i*8))) <= "1001";
			elsif (k2 ((7+(i*8)) downto (4+(i*8))) = "1001") then k2 ((7+(i*8)) downto (4+(i*8))) <= "1000";
			elsif (k2 ((7+(i*8)) downto (4+(i*8))) = "1010") then k2 ((7+(i*8)) downto (4+(i*8))) <= "0110";
			elsif (k2 ((7+(i*8)) downto (4+(i*8))) = "1011") then k2 ((7+(i*8)) downto (4+(i*8))) <= "1100";
			elsif (k2 ((7+(i*8)) downto (4+(i*8))) = "1100") then k2 ((7+(i*8)) downto (4+(i*8))) <= "1011";
			elsif (k2 ((7+(i*8)) downto (4+(i*8))) = "1101") then k2 ((7+(i*8)) downto (4+(i*8))) <= "0000";
			elsif (k2 ((7+(i*8)) downto (4+(i*8))) = "1110") then k2 ((7+(i*8)) downto (4+(i*8))) <= "0100";
			elsif (k2 ((7+(i*8)) downto (4+(i*8))) = "1111") then k2 ((7+(i*8)) downto (4+(i*8))) <= "0111";
 			end if ;
------------------------------------------S3-------------------------------------------------------
			   if (k1 ((3+(i*8)) downto (i*8)) = "0000") then k1 ((3+(i*8)) downto (i*8)) <= "0111";
			elsif (k1 ((3+(i*8)) downto (i*8)) = "0001") then k1 ((3+(i*8)) downto (i*8)) <= "0101";
			elsif (k1 ((3+(i*8)) downto (i*8)) = "0010") then k1 ((3+(i*8)) downto (i*8)) <= "0011";
			elsif (k1 ((3+(i*8)) downto (i*8)) = "0011") then k1 ((3+(i*8)) downto (i*8)) <= "0010";
			elsif (k1 ((3+(i*8)) downto (i*8)) = "0100") then k1 ((3+(i*8)) downto (i*8)) <= "1101";
			elsif (k1 ((3+(i*8)) downto (i*8)) = "0101") then k1 ((3+(i*8)) downto (i*8)) <= "0001";
			elsif (k1 ((3+(i*8)) downto (i*8)) = "0110") then k1 ((3+(i*8)) downto (i*8)) <= "1011";
			elsif (k1 ((3+(i*8)) downto (i*8)) = "0111") then k1 ((3+(i*8)) downto (i*8)) <= "0000";
			elsif (k1 ((3+(i*8)) downto (i*8)) = "1000") then k1 ((3+(i*8)) downto (i*8)) <= "1001";
			elsif (k1 ((3+(i*8)) downto (i*8)) = "1001") then k1 ((3+(i*8)) downto (i*8)) <= "1000";
			elsif (k1 ((3+(i*8)) downto (i*8)) = "1010") then k1 ((3+(i*8)) downto (i*8)) <= "1111";
			elsif (k1 ((3+(i*8)) downto (i*8)) = "1011") then k1 ((3+(i*8)) downto (i*8)) <= "0110";
			elsif (k1 ((3+(i*8)) downto (i*8)) = "1100") then k1 ((3+(i*8)) downto (i*8)) <= "1110";
			elsif (k1 ((3+(i*8)) downto (i*8)) = "1101") then k1 ((3+(i*8)) downto (i*8)) <= "0100";
			elsif (k1 ((3+(i*8)) downto (i*8)) = "1110") then k1 ((3+(i*8)) downto (i*8)) <= "1100";
			elsif (k1 ((3+(i*8)) downto (i*8)) = "1111") then k1 ((3+(i*8)) downto (i*8)) <= "1010";
 			end if ;
------------------------------------------S4-------------------------------------------------------
			   if (k1 ((7+(i*8)) downto (4+(i*8))) = "0000") then k1 ((7+(i*8)) downto (4+(i*8))) <= "0100";
			elsif (k1 ((7+(i*8)) downto (4+(i*8))) = "0001") then k1 ((7+(i*8)) downto (4+(i*8))) <= "1011";
			elsif (k1 ((7+(i*8)) downto (4+(i*8))) = "0010") then k1 ((7+(i*8)) downto (4+(i*8))) <= "0111";
			elsif (k1 ((7+(i*8)) downto (4+(i*8))) = "0011") then k1 ((7+(i*8)) downto (4+(i*8))) <= "1101";
			elsif (k1 ((7+(i*8)) downto (4+(i*8))) = "0100") then k1 ((7+(i*8)) downto (4+(i*8))) <= "0000";
			elsif (k1 ((7+(i*8)) downto (4+(i*8))) = "0101") then k1 ((7+(i*8)) downto (4+(i*8))) <= "1100";
			elsif (k1 ((7+(i*8)) downto (4+(i*8))) = "0110") then k1 ((7+(i*8)) downto (4+(i*8))) <= "1001";
			elsif (k1 ((7+(i*8)) downto (4+(i*8))) = "0111") then k1 ((7+(i*8)) downto (4+(i*8))) <= "0010";
			elsif (k1 ((7+(i*8)) downto (4+(i*8))) = "1000") then k1 ((7+(i*8)) downto (4+(i*8))) <= "1110";
			elsif (k1 ((7+(i*8)) downto (4+(i*8))) = "1001") then k1 ((7+(i*8)) downto (4+(i*8))) <= "0110";
			elsif (k1 ((7+(i*8)) downto (4+(i*8))) = "1010") then k1 ((7+(i*8)) downto (4+(i*8))) <= "1111";
			elsif (k1 ((7+(i*8)) downto (4+(i*8))) = "1011") then k1 ((7+(i*8)) downto (4+(i*8))) <= "0001";
			elsif (k1 ((7+(i*8)) downto (4+(i*8))) = "1100") then k1 ((7+(i*8)) downto (4+(i*8))) <= "0101";
			elsif (k1 ((7+(i*8)) downto (4+(i*8))) = "1101") then k1 ((7+(i*8)) downto (4+(i*8))) <= "0011";
			elsif (k1 ((7+(i*8)) downto (4+(i*8))) = "1110") then k1 ((7+(i*8)) downto (4+(i*8))) <= "1000";
			elsif (k1 ((7+(i*8)) downto (4+(i*8))) = "1111") then k1 ((7+(i*8)) downto (4+(i*8))) <= "1010";
 			end if ;
		end loop;
	elsif (rest = 4+count*4) then
		--y <= k1;
		K_All(m) <= k1;
		m <= m + 1;
		rest  <=rest+1;
		count <= count +1;
	end if;
end if;

end process;
END rtl;
