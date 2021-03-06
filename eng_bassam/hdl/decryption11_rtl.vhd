-- hds header_start
--
-- VHDL Architecture eng_bassam.test2.rtl
--
-- Created:
--          by - ahmed.UNKNOWN (AHMEDSAMY)
--          at - 21:49:07 02/12/2019
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2001.5 (Build 170)
--
-- hds header_end
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;


ENTITY Decryption11 IS
-- Declarations
	port(
		  	plaintext,k1 :in std_logic_vector(63 downto 0);
		  --k2		     :in std_logic_vector(15 downto 0);
			clk,rst : std_logic;
			typ2 : in std_logic;
			en 	: out std_logic;
			ciphertext , test : out std_logic_vector(63 downto 0)
		);
END Decryption11 ;

-- hds interface_end
ARCHITECTURE rtl OF Decryption11 IS
	signal data,ciphertext_temp :std_logic_vector(63 downto 0);
	signal rest:unsigned (7 downto 0);
	type S_array is array (0 to 3) of std_logic_vector(15 downto 0);
	signal  S_All : S_array;
	type K_array is array (0 to 16) of std_logic_vector(63 downto 0);
	signal  k_All : K_array;
	signal count,m,finish,p_invers,control:NATURAL;
BEGIN 
process(clk)
BEGIN
	if (count = 16) then 
		if (finish = 0) then
			ciphertext_temp <=  S_All(3) & S_All(2) & S_All(1) & S_All(0);
			finish <= finish +1;
		--	en  <= '1';
		elsif (finish = 1) then
			ciphertext <= ciphertext_temp xor k_All(m) ;
			finish <= finish +1;
		--	en  <= '0';		
		end if;
	end if ;

	if (rst='1')then
		if (typ2 = '0') then
			rest	<= (others =>'0') after 3700 ns;
			count 	<= 0 			  after 3700 ns;
			m  		<= 0 			  after 3700 ns;
			finish 	<= 0 			  after 3700 ns;
			p_invers<= 0			  after 3700 ns;
			control <= 0			  after 3700 ns;
			en 		<= '1' 			  after 3700 ns;	
		
		end if ;

--------------------------------------------------------------------------------------------------------------------------
	elsif(rest=0)then
		 en <= '0';
		 rest<=rest+1;
--------------------------------------------------------------------------------------------------------------------------
	elsif(rest=1)then
		for k  in 0 to 48 loop
		   if (m = 17) then
		   		rest<=rest+1;
				m <= m+1;
		   elsif(m < 17)then
				if (control = 0) then
					k_All(m) <= k1;
					control <= control +1 ;
					m <= m+1;
				elsif (control = 1) then
					if (m <17) then
					en <= '1';
					end if;
					control <= control +1;
				elsif (control = 2) then
					en <= '0';
					control <= 0;
					
				end if;
			end if;
		end loop;

----------------------------------------------------------------------------------------------------------------
	elsif(rest=2)then
		m <= 16;
		S_All(0)<=plaintext(15 downto 0);
		S_All(1)<=plaintext(31 downto 16);
		S_All(2)<=plaintext(47 downto 32);
		S_All(3)<=plaintext(63 downto 48); 
		rest<=rest+1;
 -------------------------------------------------------------------------------------------------------------------
	elsif(rest=3)then 

		S_All(0)<= S_All(0) xor k_All(m)(15 downto 0);
		S_All(1)<= S_All(1) xor k_All(m)(31 downto 16);
		S_All(2)<= S_All(2) xor k_All(m)(47 downto 32);
		S_All(3)<= S_All(3) xor k_All(m)(63 downto 48);
 	    
	 	rest<=rest+1;

-----------------------------------------------------------------------------------------------------------------
	elsif(rest=4)then
 	    m <= m -1;
		S_All(3)<= S_All(3) xor S_All(2) xor S_All(1) xor S_All(0);
	 	rest<=rest+1;

--------------------------------------------------------------------------------------------------------------- 
	elsif (count < 16) then

	 	if (rest=5+count*4) then
	 		rest<=rest+1;
			for r  in 0 to 3 loop 
				S_All(r) <=S_All(r)(15)&S_All(r)(11)&S_All(r)(7)&S_All(r)(3)&S_All(r)(14)&S_All(r)(10)&S_All(r)(6)&S_All(r)(2)&S_All(r)(13)&S_All(r)(9)&S_All(r)(5)&S_All(r)(1)&S_All(r)(12)&S_All(r)(8)&S_All(r)(4)&S_All(r)(0);
			end loop;

 --------------------------------------------------------------------------------------------------------------------
		elsif(rest=6+count*4)then
			for i  in 0 to 3 loop	
			   	   if (S_All(i)(3 downto 0) = "0000")then S_All(i)(3 downto 0)<= "0010";
				elsif (S_All(i)(3 downto 0) = "0001")then S_All(i)(3 downto 0)<= "0011";
				elsif (S_All(i)(3 downto 0) = "0010")then S_All(i)(3 downto 0)<= "0000";
				elsif (S_All(i)(3 downto 0) = "0011")then S_All(i)(3 downto 0)<= "0001";
				elsif (S_All(i)(3 downto 0) = "0100")then S_All(i)(3 downto 0)<= "1011";
				elsif (S_All(i)(3 downto 0) = "0101")then S_All(i)(3 downto 0)<= "1110";
				elsif (S_All(i)(3 downto 0) = "0110")then S_All(i)(3 downto 0)<= "1010";
				elsif (S_All(i)(3 downto 0) = "0111")then S_All(i)(3 downto 0)<= "1101";
				elsif (S_All(i)(3 downto 0) = "1000")then S_All(i)(3 downto 0)<= "1111";
				elsif (S_All(i)(3 downto 0) = "1001")then S_All(i)(3 downto 0)<= "1100";
				elsif (S_All(i)(3 downto 0) = "1010")then S_All(i)(3 downto 0)<= "0110";
				elsif (S_All(i)(3 downto 0) = "1011")then S_All(i)(3 downto 0)<= "0100";
				elsif (S_All(i)(3 downto 0) = "1100")then S_All(i)(3 downto 0)<= "1001";
				elsif (S_All(i)(3 downto 0) = "1101")then S_All(i)(3 downto 0)<= "0111";
				elsif (S_All(i)(3 downto 0) = "1110")then S_All(i)(3 downto 0)<= "0101";
				elsif (S_All(i)(3 downto 0) = "1111")then S_All(i)(3 downto 0)<= "1000";
	 			end if ;
------------------------------------------4 to 7 ----------------------------------------------------
				   if (S_All(i)(7 downto 4) = "0000")then S_All(i)(7 downto 4)<= "1101";
				elsif (S_All(i)(7 downto 4) = "0001")then S_All(i)(7 downto 4)<= "0011";
				elsif (S_All(i)(7 downto 4) = "0010")then S_All(i)(7 downto 4)<= "0101";
				elsif (S_All(i)(7 downto 4) = "0011")then S_All(i)(7 downto 4)<= "0001";
				elsif (S_All(i)(7 downto 4) = "0100")then S_All(i)(7 downto 4)<= "1110";
				elsif (S_All(i)(7 downto 4) = "0101")then S_All(i)(7 downto 4)<= "0010";
				elsif (S_All(i)(7 downto 4) = "0110")then S_All(i)(7 downto 4)<= "1010";
				elsif (S_All(i)(7 downto 4) = "0111")then S_All(i)(7 downto 4)<= "1111";
				elsif (S_All(i)(7 downto 4) = "1000")then S_All(i)(7 downto 4)<= "1001";
				elsif (S_All(i)(7 downto 4) = "1001")then S_All(i)(7 downto 4)<= "1000";
				elsif (S_All(i)(7 downto 4) = "1010")then S_All(i)(7 downto 4)<= "0110";
				elsif (S_All(i)(7 downto 4) = "1011")then S_All(i)(7 downto 4)<= "1100";
				elsif (S_All(i)(7 downto 4) = "1100")then S_All(i)(7 downto 4)<= "1011";
				elsif (S_All(i)(7 downto 4) = "1101")then S_All(i)(7 downto 4)<= "0000";
				elsif (S_All(i)(7 downto 4) = "1110")then S_All(i)(7 downto 4)<= "0100";
				elsif (S_All(i)(7 downto 4) = "1111")then S_All(i)(7 downto 4)<= "0111";
	 			end if ;
------------------------------------------8 to 11 ----------------------------------------------------
				   if (S_All(i)(11 downto 8) = "0000")then S_All(i)(11 downto 8)<= "0111";
				elsif (S_All(i)(11 downto 8) = "0001")then S_All(i)(11 downto 8)<= "0101";
				elsif (S_All(i)(11 downto 8) = "0010")then S_All(i)(11 downto 8)<= "0011";
				elsif (S_All(i)(11 downto 8) = "0011")then S_All(i)(11 downto 8)<= "0010";
				elsif (S_All(i)(11 downto 8) = "0100")then S_All(i)(11 downto 8)<= "1101";
				elsif (S_All(i)(11 downto 8) = "0101")then S_All(i)(11 downto 8)<= "0001";
				elsif (S_All(i)(11 downto 8) = "0110")then S_All(i)(11 downto 8)<= "1011";
				elsif (S_All(i)(11 downto 8) = "0111")then S_All(i)(11 downto 8)<= "0000";
				elsif (S_All(i)(11 downto 8) = "1000")then S_All(i)(11 downto 8)<= "1001";
				elsif (S_All(i)(11 downto 8) = "1001")then S_All(i)(11 downto 8)<= "1000";
				elsif (S_All(i)(11 downto 8) = "1010")then S_All(i)(11 downto 8)<= "1111";
				elsif (S_All(i)(11 downto 8) = "1011")then S_All(i)(11 downto 8)<= "0110";
				elsif (S_All(i)(11 downto 8) = "1100")then S_All(i)(11 downto 8)<= "1110";
				elsif (S_All(i)(11 downto 8) = "1101")then S_All(i)(11 downto 8)<= "0100";
				elsif (S_All(i)(11 downto 8) = "1110")then S_All(i)(11 downto 8)<= "1100";
				elsif (S_All(i)(11 downto 8) = "1111")then S_All(i)(11 downto 8)<= "1010";
	 			end if ;
------------------------------------------12 to 15 ----------------------------------------------------
				   if (S_All(i)(15 downto 12) = "0000")then S_All(i)(15 downto 12)<= "0100";
				elsif (S_All(i)(15 downto 12) = "0001")then S_All(i)(15 downto 12)<= "1011";
				elsif (S_All(i)(15 downto 12) = "0010")then S_All(i)(15 downto 12)<= "0111";
				elsif (S_All(i)(15 downto 12) = "0011")then S_All(i)(15 downto 12)<= "1101";
				elsif (S_All(i)(15 downto 12) = "0100")then S_All(i)(15 downto 12)<= "0000";
				elsif (S_All(i)(15 downto 12) = "0101")then S_All(i)(15 downto 12)<= "1100";
				elsif (S_All(i)(15 downto 12) = "0110")then S_All(i)(15 downto 12)<= "1001";
				elsif (S_All(i)(15 downto 12) = "0111")then S_All(i)(15 downto 12)<= "0010";
				elsif (S_All(i)(15 downto 12) = "1000")then S_All(i)(15 downto 12)<= "1110";
				elsif (S_All(i)(15 downto 12) = "1001")then S_All(i)(15 downto 12)<= "0110";
				elsif (S_All(i)(15 downto 12) = "1010")then S_All(i)(15 downto 12)<= "1111";
				elsif (S_All(i)(15 downto 12) = "1011")then S_All(i)(15 downto 12)<= "0001";
				elsif (S_All(i)(15 downto 12) = "1100")then S_All(i)(15 downto 12)<= "0101";
				elsif (S_All(i)(15 downto 12) = "1101")then S_All(i)(15 downto 12)<= "0011";
				elsif (S_All(i)(15 downto 12) = "1110")then S_All(i)(15 downto 12)<= "1000";
				elsif (S_All(i)(15 downto 12) = "1111")then S_All(i)(15 downto 12)<= "1010";
	 			end if ;
			end loop;
			rest<=rest+1;
  ---------------------------------------------------------------------------------------------------------
		elsif(rest=7+count*4)then
		
			if (count <15) then
				test <=  S_All(3) & S_All(2) & S_All(1) & S_All(0) ;
				S_All(3) <= S_All(3) xor k_All(m)(47 downto 32);
				S_All(2) <= S_All(2) xor k_All(m)(31 downto 16);
				S_All(1) <= S_All(1) xor k_All(m)(15 downto 0);
			end if;
			rest<=rest+1;
   -------------------------------------------------------------------------------------------------------
		elsif(rest=8+count*4)then
		
			if (count <15) then
				S_All(3) <= S_All(3) xor S_All(2) xor S_All(1) xor S_All(0) xor k_All(m)(63 downto 48);
				S_All(2) <=	S_All(3);
				S_All(1) <=	S_All(2);
				S_All(0) <=	S_All(1);
				rest<=rest+1;
				m <= m -1;
			end if;
			count <= count+1;

	end if ;
	end if ;
	end process; 
END rtl;
