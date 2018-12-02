library ieee;

use ieee.std_logic_1164.all;

entity vedic_4bit is

port(A:instd_logic_vector(3 downto 0);

B:instd_logic_vector(3 downto 0);

Q:outstd_logic_vector(7 downto 0) );

end vedic_4bit;

architecture test of vedic_4bit is

 

component vedic_2bit is

port(A:instd_logic_vector(1 downto 0);

B:instd_logic_vector(1 downto 0);

R:outstd_logic_vector(3 downto 0));

end component;

componentgeneric_adder is

port(A,B:instd_logic; S,C:outstd_logic);

end component;

signal q1,q2,q3,x1,x2:std_logic_vector(3 downto 0);

begin

G1:vedic_2bit port map(A{1),A(0),B(1),B(0),R(3),R(2),Q(1),Q(0));

G2:vedic_2bit port map(A(3),A(2),B(1),B(0),q1(3),q1(2),q1(1),q1(0));

G3:vedic_2bit port map(A(1),A(0),B(3),B(2),q2(3),q2(2),q2(1),q2(0));

G4:vedic_2bit port map(A(3),A(2),B(3),B(2),q3(3),q3(2),q3(1),q3(0));

G5:generic_adder port map(q3[3:0].q2[3:0],x1);

G6:generic_adder port map(q1[3:0],q0[3:2],x2);

G7:generic_adder port map(x1,x2,Q);

end test;

 