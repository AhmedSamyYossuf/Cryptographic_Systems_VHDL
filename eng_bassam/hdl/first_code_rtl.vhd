-- hds header_start
--
-- VHDL Architecture eng_bassam.first_code.rtl
--
-- Created:
--          by - ahmed.UNKNOWN (AHMEDSAMY)
--          at - 09:53:42 01/31/2019
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2001.5 (Build 170)
--
-- hds header_end
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;


ENTITY first_code IS
-- Declarations
  port(
  		plaontext,key: in std_logic_vector(127 downto 0);
		mode : in std_logic;
		ciphertext :out std_logic_vector(127 downto 0)
  		);
END first_code ;

-- hds interface_end
ARCHITECTURE rtl OF first_code IS

Signal c0,d0 :std_logic_vector(63 downto 0);

Signal Shifter1_out :std_logic_vector(63 downto 0);

Signal key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16 :std_logic_vector(63 downto 0);

Signal key1_sig,key2_sig,key3_sig,key4_sig,key5_sig,key6_sig,key7_sig, key8_sig,key9_sig,key10_sig,key11_sig,
	   key12_sig,key13_sig,key14_sig,key15_sig,key16_sig : unsigned (63 downto 0);

Signal key_1,key_2,key_3,key_4,key_5,key_6,key_7,key_8,key_9,key_10,key_11,key_12,key_13,key_14,key_15,key_16 :std_logic_vector (63 downto 0);


BEGIN

  -------------------------first sift---------------------------------	
  c0 <= key(127 downto 64);
  d0 <= key(63 downto 0);
  Shifter1_out <= c0(56 downto 0)& c0(63 downto 57);
  key1 <=Shifter1_out(55 downto 48)&Shifter1_out(63 downto 56)&Shifter1_out(47 downto 0);
  Shifter1_out <= d0(56 downto 0)& d0(63 downto 57);
  key2 <= Shifter1_out(63 downto 16)& Shifter1_out(7 downto 0)& Shifter1_out(15 downto 8);
  --------------------------------seconed sift-----------------
  Shifter1_out <= key1(55 downto 0)& key1(63 downto 56);
  key3 <= Shifter1_out(47 downto 40)& Shifter1_out(55 downto 48)& Shifter1_out(63 downto 56)& Shifter1_out(39 downto 0);
  Shifter1_out <= key2(55 downto 0)& key2(63 downto 56);
  key4 <= Shifter1_out(63 downto 24)& Shifter1_out(7 downto 0)& Shifter1_out(15 downto 8)& Shifter1_out(23 downto 16);


  Shifter1_out <= key3(55 downto 0)&key3(63 downto 56);
  key5 <= Shifter1_out(39 downto 32)& Shifter1_out(55 downto 40)& Shifter1_out(63 downto 56)& Shifter1_out(31 downto 0);
  Shifter1_out <= key4(55 downto 0)&key4(63 downto 56);
  key6 <= Shifter1_out(63 downto 32)& Shifter1_out(7 downto 0)& Shifter1_out(23 downto 8)& Shifter1_out(31 downto 24);


  Shifter1_out <= key5(55 downto 0)& key5(63 downto 56);
  key7 <= Shifter1_out(31 downto 24)&Shifter1_out(55 downto 32)& Shifter1_out(63 downto 56)& Shifter1_out(23 downto 0);
  Shifter1_out <= key6(55 downto 0)&key6(63 downto 56);
  key8 <= Shifter1_out(63 downto 40)& Shifter1_out(7 downto 0)& Shifter1_out(31 downto 8)& Shifter1_out(39 downto 32);


  Shifter1_out <= key7(55 downto 0)& key7(63 downto 56);
  key9 <= Shifter1_out(23 downto 16)& Shifter1_out(55 downto 24)& Shifter1_out(63 downto 56)& Shifter1_out(15 downto 0);
  Shifter1_out <= key8(55 downto 0)& key8(63 downto 56);
  key10 <= Shifter1_out(63 downto 48)& Shifter1_out(7 downto 0)& Shifter1_out(39 downto 8)& Shifter1_out(47 downto 40);


  Shifter1_out <= key9(55 downto 0)& key9(63 downto 56);
  key11 <= Shifter1_out(15 downto 8)& Shifter1_out(55 downto 16)& Shifter1_out(63 downto 56)& Shifter1_out(7 downto 0);
  Shifter1_out <= key10(55 downto 0)& key10(63 downto 56);
  key12 <= Shifter1_out(63 downto 56)& Shifter1_out(7 downto 0)& Shifter1_out(47 downto 8)& Shifter1_out(55 downto 48);


  Shifter1_out <= key11(55 downto 0)& key11(63 downto 56);
  key13 <= Shifter1_out(7 downto 0)& Shifter1_out(55 downto 8)& Shifter1_out(63 downto 56);
  Shifter1_out <= key12(55 downto 0)& key12(63 downto 56);
  key14 <= Shifter1_out(7 downto 0)& Shifter1_out(55 downto 8)& Shifter1_out(63 downto 56);


  key15 <= key13(56 downto 0)& key13(63 downto 57);
  key16 <= key14(56 downto 0)& key14(63 downto 57);

  ---------------------------------Choose encryption or decryption--------------------


 key1_sig <= unsigned(not(key1)) + 1;
	
 key2_sig <= unsigned(not(key2)) + 1;

 key3_sig <= unsigned(not(key3)) + 1;

 key4_sig <= unsigned(not(key4)) + 1;
 	
 key5_sig <= unsigned(not(key5)) + 1;

 key6_sig <= unsigned(not(key6)) + 1;

 key7_sig <= unsigned(not(key7)) + 1;
 
 key8_sig <= unsigned(not(key8)) + 1;

 key9_sig <= unsigned(not(key9)) + 1;

 key10_sig <= unsigned(not(key10)) + 1;
 
 key11_sig <= unsigned(not(key11)) + 1;

 key12_sig <= unsigned(not(key12)) + 1;

 key13_sig <= unsigned(not(key13)) + 1;

 key14_sig <= unsigned(not(key14)) + 1;

 key15_sig <= unsigned(not(key15)) + 1;
 
 key16_sig <= unsigned(not(key16)) + 1;

 key_1<= key1   when (mode ='1') else  std_logic_vector(key16_sig);
 key_2<= key2   when (mode ='1') else  std_logic_vector(key15_sig);
 key_3<= key3   when (mode ='1') else  std_logic_vector(key14_sig);
 key_4<= key4   when (mode ='1') else  std_logic_vector(key13_sig);
 key_5<= key5   when (mode ='1') else  std_logic_vector(key12_sig);
 key_6<= key6   when (mode ='1') else  std_logic_vector(key11_sig);
 key_7<= key7   when (mode ='1') else  std_logic_vector(key10_sig);
 key_8<= key8   when (mode ='1') else  std_logic_vector(key9_sig);
 key_9<= key9   when (mode ='1') else  std_logic_vector(key8_sig);
 key_10<= key10 when (mode ='1') else  std_logic_vector(key7_sig);
 key_11<= key11 when (mode ='1') else  std_logic_vector(key6_sig);
 key_12<= key12 when (mode ='1') else  std_logic_vector(key5_sig);
 key_13<= key13 when (mode ='1') else  std_logic_vector(key4_sig);
 key_14<= key14 when (mode ='1') else  std_logic_vector(key3_sig);
 key_15<= key15 when (mode ='1') else  std_logic_vector(key2_sig);
 key_16<= key16 when (mode ='1') else  std_logic_vector(key1_sig);

---------------------------------------------------------------------------------






END rtl;