library verilog;
use verilog.vl_types.all;
entity Piso is
    port(
        clk             : in     vl_logic;
        control         : in     vl_logic;
        DataIn          : in     vl_logic_vector(7 downto 0);
        DataOut         : out    vl_logic
    );
end Piso;
