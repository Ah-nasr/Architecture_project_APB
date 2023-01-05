library verilog;
use verilog.vl_types.all;
entity Transmitter is
    generic(
        DBit            : integer := 8;
        SBit            : integer := 16
    );
    port(
        tx_start        : in     vl_logic;
        s_tick          : in     vl_logic;
        tx_dataIn       : in     vl_logic_vector(7 downto 0);
        tx_done_tick    : out    vl_logic;
        tx_dataOut      : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DBit : constant is 1;
    attribute mti_svvh_generic_type of SBit : constant is 1;
end Transmitter;
