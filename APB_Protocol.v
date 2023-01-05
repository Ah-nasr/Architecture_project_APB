`include "APB_bus.v"
`include "gpio.v"
`include "UART_APB.v"

// `timescale 1ns/1ns

module APB_Protcol (
    input  pclk,  penable,  pwrite,  transfer,Reset,
    input [31:0] write_paddr,apb_read_paddr,
	input [31:0] write_data,
    // 1 gpio 2 uart 0 idle
    input [1:0] Psel,
    output [31:0] apb_read_data_out,
    input rx
);
        // coming from Slave 
       reg pready ;
       reg [31:0] prdata;
       wire [31:0] pwdata;
       wire[31:0]paddr;
       wire PSEL1,PSEL2;
       wire [31:0]prdata1,prdata2;
       wire pready1,pready2;
       wire pwrite_slave,penable_slave;

always @(Psel or pready1 or prdata1 or pready2 or prdata2 ) begin
    case (Psel)
        1 : begin
            pready <= pready1;
            prdata <= prdata1;
        end 
        2 : begin
            pready <= pready2;
            prdata <= prdata2;

        end
        default: begin
            pready <= 0;
            prdata <= 0;
        end 
    endcase
end

       master_bridge dut_mas(
        pclk,  penable,  pwrite,  transfer,Reset,Psel,write_paddr,apb_read_paddr,write_data,// From Tb
        pready,prdata,pwrite_slave,penable_slave, //From Slaves
        pwdata,paddr,PSEL1,PSEL2 // Out To Slave
        ,apb_read_data_out // Out To Test bench
       ); 

      GPIO g1(  pclk , penable_slave ,pwrite_slave,PSEL1,Reset,pwdata,paddr,pready1,prdata1 );

    // Inistantiate UART
    UART_APB uart (
        .PCLK(pclk),
        .PADDR(write_paddr),
        .PWDATA(write_data),
        .PRDATA(apb_read_data_out),
        .PSELx(PSEL2),
        .PENABLE(penable),
        .PWRITE(pwrite),
        .PRESETn(Reset),
        .PREADY(pready2),
        .rx(rx)
    );

    //   slave2 dut2(  PCLK,PRESETn, PSEL2,PENABLE,PWRITE, PADDR[7:0],PWDATA, PRDATA2, PREADY2 );
    
endmodule