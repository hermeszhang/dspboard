
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;


library UNISIM;
use UNISIM.VComponents.all;

entity eventrx is
  port (
    CLK      : in  std_logic;
    RESET    : in  std_logic;
    SCLK     : in  std_logic;
    MOSI     : in  std_logic;
    SCS      : in  std_logic;
    FIFOFULL : out std_logic;
    DOUT     : out std_logic_vector(7 downto 0);
    REQ      : out  std_logic;
    GRANT    : in  std_logic;
    DEBUG : out std_logic_vector(15 downto 0));
end eventrx;

architecture Behavioral of eventrx is
  -- Latched SPI signals
  signal scsl          : std_logic := '1';
  signal mosil         : std_logic := '0';
  signal sclkl, sclkll : std_logic := '0';

  -- INPUT SIGNALS

  signal din    : std_logic_vector(15 downto 0) := (others => '0');
  signal bitcnt : integer range 0 to 15         := 0;
  signal biten  : std_logic                     := '0';


  signal wcntin : std_logic_vector(3 downto 0) := (others => '0');

  signal wea    : std_logic := '0';
  signal web    : std_logic := '0';
  signal we     : std_logic := '0';
  signal isel   : std_logic := '0';
  signal armeda : std_logic := '0';
  signal armedb : std_logic := '0';

  type instates is (none, wordw, wordchk, bufarm, nextisel);
  signal ics, ins : instates := none;

  -- OUTPUT SIGNALS

  signal douta, doutb : std_logic_vector(15 downto 0) := (others => '0');

  signal wcntout : std_logic_vector(3 downto 0) := (others => '0');

  signal osel : std_logic := '0';
  signal dsel : std_logic := '0';

  signal doutsel : std_logic_vector(15 downto 0) := (others => '0');

  type outstates is (armaw, armareq, sendah, sendal, donea,
                     armbw, armbreq, sendbh, sendbl, doneb);
  signal ocs, ons : outstates := armaw;


  component regfile
    generic (
      BITS  :     integer := 16);
    port (
      CLK   : in  std_logic;
      DIA   : in  std_logic_vector(BITS-1 downto 0);
      DOA   : out std_logic_vector(BITS -1 downto 0);
      ADDRA : in  std_logic_vector(3 downto 0);
      WEA   : in  std_logic;
      DOB   : out std_logic_vector(BITS -1 downto 0);
      ADDRB : in  std_logic_vector(3 downto 0)
      );
  end component;

begin  -- Behavioral

  biten <= '1' when sclkl ='0' and sclkll = '1' else '0';

  wea <= '1' when we = '1' and isel = '0' else '0';
  web <= '1' when we = '1' and isel = '1' else '0';

  we <= '1' when ics = wordchk else '0';

  doutsel <= douta                when osel = '0' else doutb;
  DOUT    <= doutsel(15 downto 8) when dsel = '0' else doutsel(7 downto 0);

  REQ <= '1' when ocs = armareq or ocs = armbreq else '0';

--  FIFOFULL <= armeda and armedb;      -- causes race conditions
  FIFOFULL <= '1' when (armeda = '1' and armedb = '1' ) or
                       (armeda='1' and ics = wordw) or
                       (armedb ='1' and ics = wordw) else
              '0';

  DEBUG <= din;
  
  regfile_a : regfile
    generic map (
      BITS  => 16)
    port map (
      CLK   => CLK,
      DIA   => din,
      DOA   => open,
      ADDRA => wcntin,
      WEA   => wea,
      DOB   => douta,
      ADDRB => wcntout);

  regfile_b : regfile
    generic map (
      BITS  => 16)
    port map (
      CLK   => CLK,
      DIA   => din,
      DOA   => open,
      ADDRA => wcntin,
      WEA   => web,
      DOB   => doutb,
      ADDRB => wcntout);


  main : process(clk)
  begin
    if RESET = '1' then
      ics   <= none;
      ocs   <= armaw;
    else
      if rising_edge(CLK) then
        ics <= ins;
        ocs <= ons;

        scsl   <= SCS;
        mosil  <= MOSI;
        sclkl  <= SCLK;
        sclkll <= sclkl;

        if ics = none then
          bitcnt     <= 0;
        else
          if biten = '1' then
            if bitcnt = 15 then
              bitcnt <= 0;
            else
              bitcnt <= bitcnt + 1;
            end if;
          end if;
        end if;

        -- shift register
        if biten = '1' then
          din <= din(14 downto 0) & mosil;
        end if;

        if ics = bufarm then
          wcntin   <= (others => '0');
        else
          if ics = wordchk then
            wcntin <= wcntin + 1;
          end if;
        end if;

        -- arming regs
        if ics = bufarm and isel = '0' then
          armeda   <= '1';
        else
          if ocs = donea then
            armeda <= '0';
          end if;
        end if;

        if ics = bufarm and isel = '1' then
          armedb   <= '1';
        else
          if ocs = doneb then
            armedb <= '0';
          end if;
        end if;

        if ocs = armaw or ocs = armbw then
          wcntout   <= (others => '0');
        else
          if ocs = sendal or ocs = sendbl then
            wcntout <= wcntout + 1;
          end if;
        end if;

        if ics = nextisel then
          isel <= not isel; 
        end if;


      end if;
    end if;

  end process main;

-----------------------------------------------------------------------------
-- input finite state machine
-----------------------------------------------------------------------------
  input_fsm : process(ics, scsl, biten, bitcnt, wcntin)
  begin
    case ics is
      when none =>
        if scsl = '0' then
          ins <= wordw;
        else
          ins <= none;
        end if;

      when wordw =>
        if scsl = '1' then
          ins   <= none;
        else
          if biten = '1' and bitcnt = 15 then
            ins <= wordchk;
          else
            ins <= wordw;
          end if;
        end if;

      when wordchk =>
        if wcntin = "1010" then
          ins <= bufarm;
        else
          ins <= none;
        end if;

      when bufarm =>
        ins <= nextisel;

      when nextisel =>
        ins <= none;
      when others   =>
        ins <= none;
    end case;

  end process input_fsm;

  -----------------------------------------------------------------------
  -- output finite state machine
  -----------------------------------------------------------------------
  output_fsm : process(ocs, armeda, armedB, grant, wcntout)
  begin
    case ocs is
      when armaw =>
        osel  <= '0';
        dsel  <= '0';
        if armeda = '1' then
          ons <= armareq;
        else
          ons <= armaw;
        end if;

      when armareq =>
        osel  <= '0';
        dsel  <= '0';
        if GRANT = '1' then
          ons <= sendah;
        else
          ons <= armareq;
        end if;

      when sendah =>
        osel <= '0';
        dsel <= '0';
        ons  <= sendal;

      when sendal =>
        osel  <= '0';
        dsel  <= '1';
        if wcntout = "1010" then
          ons <= donea;
        else
          ons <= sendah;
        end if;

      when donea =>
        osel <= '0';
        dsel <= '0';
        ons  <= armbw;

      when armbw =>
        osel  <= '1';
        dsel  <= '0';
        if armedb = '1' then
          ons <= armbreq;
        else
          ons <= armbw;
        end if;

      when armbreq =>
        osel  <= '1';
        dsel  <= '0';
        if GRANT = '1' then
          ons <= sendbh;
        else
          ons <= armbreq;
        end if;

      when sendbh =>
        osel <= '1';
        dsel <= '0';
        ons  <= sendbl;

      when sendbl =>
        osel  <= '1';
        dsel  <= '1';
        if wcntout = "1010" then
          ons <= doneb;
        else
          ons <= sendbh;
        end if;

      when doneb =>
        osel <= '1';
        dsel <= '0';
        ons  <= armaw;

      when others =>
        osel <= '0';
        dsel <= '0';
        ons  <= armaw;

    end case;

  end process output_fsm;

end Behavioral;

