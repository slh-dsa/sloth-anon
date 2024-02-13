//  vcu118_top.v
//  ((Anonymized)).  See LICENSE.

//  === top module for the VCU118 board

`ifndef SIM_TB
module vcu118_top (
    input wire  ref_clk_p,
    input wire  ref_clk_n,
    inout wire  pad_uart_tx,
    inout wire  pad_uart_rx,
    inout wire  pad_uart_rts,
    inout wire  pad_uart_cts,
    input wire  pad_reset,
    output wire trap_led
);
    wire        ref_clk;

    //  Differential to single ended clock conversion
    IBUFGDS #(
        .IOSTANDARD     ("LVDS" ),
        .DIFF_TERM      ("FALSE"),
        .IBUF_LOW_PWR   ("FALSE")
    ) i_sysclk_iobuf    (
        .I  (ref_clk_p),
        .IB (ref_clk_n),
        .O  (ref_clk  )
    );

    wire [7:0]  gpio_out;           //  unconnected
    wire [7:0]  gpio_in = 8'h55;

    //  Instantiate
    fpga_top fpga_top_0 (
        .clk        (ref_clk        ),
        .rst        (pad_reset      ),
        .uart_txd   (pad_uart_tx    ),
        .uart_rxd   (pad_uart_rx    ),
        .uart_rts   (pad_uart_rts   ),
        .uart_cts   (pad_uart_cts   ),
        .gpio_out   (gpio_out       ),
        .gpio_in    (gpio_in        ),
        .trap       (trap_led       )
    );

endmodule
`endif
