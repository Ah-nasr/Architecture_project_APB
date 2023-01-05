library verilog;
use verilog.vl_types.all;
entity GPIO is
    port(
        PCLK            : in     vl_logic;
        PENABLE         : in     vl_logic;
        PWRITE          : in     vl_logic;
        Psel            : in     vl_logic;
        PRESETn         : in     vl_logic;
        PWDATA          : in     vl_logic_vector(31 downto 0);
        PADDR           : in     vl_logic_vector(4 downto 0);
        PREADY          : out    vl_logic;
        GPIO_OUTData    : out    vl_logic_vector(31 downto 0)
    );
end GPIO;
