
library ieee;

use ieee.std_logic_1164.all;

entity vedic_2bit is

port(A:in STD_LOGIC_VECTOR(1 downto 0);

B:INstd_logic_VECTOR (1 DOWNTO 0);

R:outstd_logic_vector(3 downto 0));

end vedic_2bit;

architecture test of vedic_2bit is

component and2 is

port(A,B:in STD_LOGIC; Y:out std_logic);

end component;

componenthalf_adder is

port(A,B:in STD_LOGIC; S,C:outstd_logic);

end component;

signal p1,p2,p3,p4:std_logic;

begin

G1:and2 port map(A(0),B(0),R(0));

G2:and2 port map(A(1),B(0),p1);

G3:and2 port map(A(0),B(1),p2);

G4:and2 port map(A(1),B(1),p3);

G5:half_adder port map(p1,p2,R(1),p4);

G6:half_adder port map(p4,p3,R(2),R(3));

end test;

Code for Generic Full Adder:

libraryieee;

use ieee.std_logic_1164.all;

entitygeneric_fa is

generic(N:NATURAL);

port(A,B:in STD_LOGIC_VECTOR(N-1 downto 0);

SUM:out STD_LOGIC_VECTOR(N-1 downto 0);

COUT:out STD_LOGIC);

endgeneric_fa;

architectureconc of generic_fa is

componentfull_adder

port(X,Y,Z:in STD_LOGIC; S,C:out STD_LOGIC);

end component;

signal CARRY:STD_LOGIC_VECTOR(N downto 0);

begin

CARRY(0)<=’0';

COUT<=CARRY(N);

G1:for K in 0 to N-1 generate

FA:full_adder port map(X=>A(K),Y=>B(K),Z=>CARRY(K),S=>SUM(K),C=>CARRY(K+1));

end generate;

endconc;

 