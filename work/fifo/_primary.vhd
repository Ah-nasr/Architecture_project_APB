library verilog;
use verilog.vl_types.all;
entity fifo is
    port(
        clk             : in     vl_logic;
        dataIn          : in     vl_logic_vector(7 downto 0);
        readEn          : in     vl_logic;
        writeEn         : in     vl_logic;
        dataOut         : out    vl_logic_vector(7 downto 0);
        reset           : in     vl_logic;
        EMPTY           : out    vl_logic;
        FULL            : out    vl_logic
    );
end fifo;
