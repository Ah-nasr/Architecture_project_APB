library verilog;
use verilog.vl_types.all;
entity receiver is
    generic(
        numberOfDataBits: integer := 8;
        stopBitTicks    : integer := 16
    );
    port(
        rx              : in     vl_logic;
        s_tick          : in     vl_logic;
        rx_dataOut      : out    vl_logic_vector(7 downto 0);
        rx_doneTick     : out    vl_logic;
        clk             : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of numberOfDataBits : constant is 1;
    attribute mti_svvh_generic_type of stopBitTicks : constant is 1;
end receiver;
