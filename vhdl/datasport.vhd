library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;


library UNISIM;
use UNISIM.vcomponents.all;


entity datasport is
  port (
    CLK    : in  std_logic;
    RESET  : in  std_logic;
    -- serial IO
    SERCLK : in  std_logic;
    SERDT  : in  std_logic;
    SERTFS : in  std_logic;
    FULL   : out std_logic;
    -- FiFO interface
    REQ    : out std_logic;
    GRANT  : in  std_logic;
    DOUT   : out std_logic_vector(7 downto 0);
    DONE   : out std_logic;
    DEBUG  : out std_logic_vector(15 downto 0));
end datasport;

architecture Behavioral of datasport is

  -- input side
  signal incnt : std_logic_vector(12 downto 0) := (others => '0');
  signal insel : std_logic                     := '0';
  signal addra : std_logic_vector(13 downto 0) := (others => '0');

  signal dinint : std_logic_vector(0 downto 0) := (others => '0');

  signal seren : std_logic := '0';

  signal bufcnt : std_logic_vector(1 downto 0)  := (others => '0');
  signal addrb  : std_logic_vector(10 downto 0) := (others => '0');
  signal len    : std_logic_vector(15 downto 0) := (others => '0');

  type instates is (none, instart, low, high, bufdone);
  signal ics, ins : instates := none;

  type outstates is (none, reqs, len0, len1, len2, dwait, ddone);
  signal ocs, ons : outstates := none;

  signal dob : std_logic_vector(7 downto 0) := (others => '0');

  signal outsel : std_logic := '0';
  signal ocnten : std_logic := '0';

  signal debugcnt : std_logic_vector(15 downto 0) := (others => '0');

begin  -- Behavioral
  dinint(0) <= SERDT;

  FULL <= '1' when BUFCNT /= "00" and ics /=none else '0';
  DONE <= '1' when ocs = ddone                   else '0';

  RAM1 : RAMB16_S1_S9
    generic map (
      WRITE_MODE_A        => "WRITE_FIRST",  --  WRITE_FIRST, READ_FIRST or NO_CHANGE
      WRITE_MODE_B        => "WRITE_FIRST",  --  WRITE_FIRST, READ_FIRST or NO_CHANGE
      SIM_COLLISION_CHECK => "NONE")
    port map (
      DOA                 => open,
      DOB                 => dob,
      DOPB                => open,
      ADDRA               => addra,
      ADDRB               => addrb,
      CLKA                => CLK,
      CLKB                => CLK,
      DIB                 => X"00",
      DIA                 => dinint,
      DIPB                => "0",
      ENA                 => '1',
      ENB                 => '1',
      SSRA                => RESET,
      SSRB                => RESET,
      WEA                 => seren,
      WEB                 => '0' );

  DOUT               <= dob;
  addra(13)          <= insel;
  addra(12 downto 0) <= incnt;

  seren     <= SERCLK;
  addrb(10) <= outsel;

  REQ <= '1' when ocs = REQS else '0';


  main : process(CLK)
  begin
    if RESET = '1' then
      ics    <= none;
      ocs    <= none;
      incnt  <= (others => '0');
      bufcnt <= "00";
    else
      if rising_edge(CLK) then
        ics <= ins;
        ocs <= ons;

        if ics = none then
          incnt   <= (others => '0');
        else
          if seren = '1' then
            incnt <= incnt + 1;
          end if;
        end if;

        if ics = bufdone then
          insel <= not insel;
        end if;

        if ocs = len1 then
          len(15 downto 8) <= dob;
        end if;

        if ocs = len2 then
          len(7 downto 0) <= dob;
        end if;

        if ocs = none then
          addrb(9 downto 0)   <= (others => '0');
        else
          if ocnten = '1' or GRANT = '1' then
            addrb(9 downto 0) <= addrb(9 downto 0) + 1;
          end if;
        end if;

        if ics = bufdone and ocs = ddone then
          null;
        elsif ics = bufdone and ocs /= ddone then
          bufcnt <= bufcnt + 1;
        elsif ics /= bufdone and ocs = ddone then
          bufcnt <= bufcnt - 1;
        end if;

        if ocs = ddone then
          outsel <= not outsel;
        end if;

        if seren = '1' and sertfs = '1' then
          debugcnt <= debugcnt + 1;
        end if;
        DEBUG      <= debugcnt;

      end if;
    end if;

  end process main;


  infsm : process(ics, seren, SERTFS, incnt)
  begin

    case ics is
      when none =>
        if seren = '1' and SERTFS = '1' then
          ins <= instart;
        else
          ins <= none;
        end if;

      when instart =>
        ins <= low;

      when low =>
        if seren = '1' then
          ins <= high;
        else
          ins <= low;
        end if;

      when high =>
        if incnt = "000000000000" then
          ins <= bufdone;
        else
          ins <= low;
        end if;

      when bufdone =>
        ins <= none;

      when others =>
        ins <= none;

    end case;
  end process infsm;

  outfsm : process(ocs, bufcnt, GRANT, len, addrb)
  begin
    case ocs is
      when none =>
        ocnten <= '0';
        if bufcnt /= "00" then
          ons  <= len0;
        else
          ons  <= none;
        end if;

      when len0 =>
        ocnten <= '1';
        ons    <= len1;

      when len1 =>
        ocnten <= '1';
        ons    <= len2;

      when len2 =>
        ocnten <= '0';
        ons    <= reqs;


      when reqs =>
        ocnten <= '0';
        if GRANT = '1' then
          ons  <= dwait;
        else
          ons  <= reqs;
        end if;

      when dwait =>
        ocnten <= '1';
        if addrb(9 downto 0) = len(9 downto 0) then
          ons  <= ddone;
        else
          ons  <= dwait;
        end if;

      when ddone =>
        ocnten <= '0';
        ons    <= none;

      when others =>
        ocnten <= '0';
        ons    <= none;
    end case;

  end process outfsm;

end Behavioral;
