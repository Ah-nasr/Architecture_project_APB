library verilog;
use verilog.vl_types.all;
entity sipo is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        DataIn          : in     vl_logic;
        DataOut         : out    vl_logic_vector(7 downto 0)
    );
end sipo;
