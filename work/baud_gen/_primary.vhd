library verilog;
use verilog.vl_types.all;
entity baud_gen is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        divsr           : in     vl_logic_vector(10 downto 0);
        tick            : out    vl_logic
    );
end baud_gen;
