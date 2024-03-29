// finalproject_soc.v

// Generated using ACDS version 18.0 614

`timescale 1 ps / 1 ps
module finalproject_soc (
		input  wire        clk_clk,                   //          clk.clk
		input  wire        outside_data_tl_read,      // outside_data.tl_read
		input  wire [31:0] outside_data_tl_addr,      //             .tl_addr
		input  wire        outside_data_tl_write,     //             .tl_write
		input  wire [31:0] outside_data_tl_writedata, //             .tl_writedata
		output wire [31:0] outside_data_tl_readdata,  //             .tl_readdata
		output wire        outside_data_tl_rdv,       //             .tl_rdv
		input  wire        reset_reset_n,             //        reset.reset_n
		output wire        sdram_clk_clk,             //    sdram_clk.clk
		output wire [12:0] sdram_wire_addr,           //   sdram_wire.addr
		output wire [1:0]  sdram_wire_ba,             //             .ba
		output wire        sdram_wire_cas_n,          //             .cas_n
		output wire        sdram_wire_cke,            //             .cke
		output wire        sdram_wire_cs_n,           //             .cs_n
		inout  wire [31:0] sdram_wire_dq,             //             .dq
		output wire [3:0]  sdram_wire_dqm,            //             .dqm
		output wire        sdram_wire_ras_n,          //             .ras_n
		output wire        sdram_wire_we_n            //             .we_n
	);

	wire         sdram_pll_c0_clk;                                      // sdram_pll:c0 -> [mm_interconnect_0:sdram_pll_c0_clk, rst_controller_001:clk, sdram:clk]
	wire         sdram_master_core_0_avalon_master_chipselect;          // SDRAM_Master_Core_0:AVL_CS -> mm_interconnect_0:SDRAM_Master_Core_0_avalon_master_chipselect
	wire  [31:0] sdram_master_core_0_avalon_master_readdata;            // mm_interconnect_0:SDRAM_Master_Core_0_avalon_master_readdata -> SDRAM_Master_Core_0:AVL_READDATA
	wire         sdram_master_core_0_avalon_master_waitrequest;         // mm_interconnect_0:SDRAM_Master_Core_0_avalon_master_waitrequest -> SDRAM_Master_Core_0:AVL_WAITREQ
	wire  [31:0] sdram_master_core_0_avalon_master_address;             // SDRAM_Master_Core_0:AVL_ADDR -> mm_interconnect_0:SDRAM_Master_Core_0_avalon_master_address
	wire   [3:0] sdram_master_core_0_avalon_master_byteenable;          // SDRAM_Master_Core_0:AVL_BYTE_EN -> mm_interconnect_0:SDRAM_Master_Core_0_avalon_master_byteenable
	wire         sdram_master_core_0_avalon_master_read;                // SDRAM_Master_Core_0:AVL_READ -> mm_interconnect_0:SDRAM_Master_Core_0_avalon_master_read
	wire         sdram_master_core_0_avalon_master_readdatavalid;       // mm_interconnect_0:SDRAM_Master_Core_0_avalon_master_readdatavalid -> SDRAM_Master_Core_0:AVL_RDV
	wire         sdram_master_core_0_avalon_master_write;               // SDRAM_Master_Core_0:AVL_WRITE -> mm_interconnect_0:SDRAM_Master_Core_0_avalon_master_write
	wire  [31:0] sdram_master_core_0_avalon_master_writedata;           // SDRAM_Master_Core_0:AVL_WRITEDATA -> mm_interconnect_0:SDRAM_Master_Core_0_avalon_master_writedata
	wire  [31:0] mm_interconnect_0_sysid_qsys_0_control_slave_readdata; // sysid_qsys_0:readdata -> mm_interconnect_0:sysid_qsys_0_control_slave_readdata
	wire   [0:0] mm_interconnect_0_sysid_qsys_0_control_slave_address;  // mm_interconnect_0:sysid_qsys_0_control_slave_address -> sysid_qsys_0:address
	wire  [31:0] mm_interconnect_0_sdram_pll_pll_slave_readdata;        // sdram_pll:readdata -> mm_interconnect_0:sdram_pll_pll_slave_readdata
	wire   [1:0] mm_interconnect_0_sdram_pll_pll_slave_address;         // mm_interconnect_0:sdram_pll_pll_slave_address -> sdram_pll:address
	wire         mm_interconnect_0_sdram_pll_pll_slave_read;            // mm_interconnect_0:sdram_pll_pll_slave_read -> sdram_pll:read
	wire         mm_interconnect_0_sdram_pll_pll_slave_write;           // mm_interconnect_0:sdram_pll_pll_slave_write -> sdram_pll:write
	wire  [31:0] mm_interconnect_0_sdram_pll_pll_slave_writedata;       // mm_interconnect_0:sdram_pll_pll_slave_writedata -> sdram_pll:writedata
	wire         mm_interconnect_0_sdram_s1_chipselect;                 // mm_interconnect_0:sdram_s1_chipselect -> sdram:az_cs
	wire  [31:0] mm_interconnect_0_sdram_s1_readdata;                   // sdram:za_data -> mm_interconnect_0:sdram_s1_readdata
	wire         mm_interconnect_0_sdram_s1_waitrequest;                // sdram:za_waitrequest -> mm_interconnect_0:sdram_s1_waitrequest
	wire  [24:0] mm_interconnect_0_sdram_s1_address;                    // mm_interconnect_0:sdram_s1_address -> sdram:az_addr
	wire         mm_interconnect_0_sdram_s1_read;                       // mm_interconnect_0:sdram_s1_read -> sdram:az_rd_n
	wire   [3:0] mm_interconnect_0_sdram_s1_byteenable;                 // mm_interconnect_0:sdram_s1_byteenable -> sdram:az_be_n
	wire         mm_interconnect_0_sdram_s1_readdatavalid;              // sdram:za_valid -> mm_interconnect_0:sdram_s1_readdatavalid
	wire         mm_interconnect_0_sdram_s1_write;                      // mm_interconnect_0:sdram_s1_write -> sdram:az_wr_n
	wire  [31:0] mm_interconnect_0_sdram_s1_writedata;                  // mm_interconnect_0:sdram_s1_writedata -> sdram:az_data
	wire         rst_controller_reset_out_reset;                        // rst_controller:reset_out -> [SDRAM_Master_Core_0:RESET, mm_interconnect_0:SDRAM_Master_Core_0_RESET_reset_bridge_in_reset_reset, sdram_pll:reset, sysid_qsys_0:reset_n]
	wire         rst_controller_001_reset_out_reset;                    // rst_controller_001:reset_out -> [mm_interconnect_0:sdram_reset_reset_bridge_in_reset_reset, sdram:reset_n]

	SDRAM_Master sdram_master_core_0 (
		.CLK           (clk_clk),                                         //           CLK.clk
		.RESET         (rst_controller_reset_out_reset),                  //         RESET.reset
		.AVL_ADDR      (sdram_master_core_0_avalon_master_address),       // avalon_master.address
		.AVL_BYTE_EN   (sdram_master_core_0_avalon_master_byteenable),    //              .byteenable
		.AVL_CS        (sdram_master_core_0_avalon_master_chipselect),    //              .chipselect
		.AVL_READ      (sdram_master_core_0_avalon_master_read),          //              .read
		.AVL_READDATA  (sdram_master_core_0_avalon_master_readdata),      //              .readdata
		.AVL_WRITE     (sdram_master_core_0_avalon_master_write),         //              .write
		.AVL_WRITEDATA (sdram_master_core_0_avalon_master_writedata),     //              .writedata
		.AVL_WAITREQ   (sdram_master_core_0_avalon_master_waitrequest),   //              .waitrequest
		.AVL_RDV       (sdram_master_core_0_avalon_master_readdatavalid), //              .readdatavalid
		.TL_READ       (outside_data_tl_read),                            //  OUTSIDE_DATA.tl_read
		.TL_ADDR       (outside_data_tl_addr),                            //              .tl_addr
		.TL_WRITE      (outside_data_tl_write),                           //              .tl_write
		.TL_WRITEDATA  (outside_data_tl_writedata),                       //              .tl_writedata
		.TL_READDATA   (outside_data_tl_readdata),                        //              .tl_readdata
		.TL_RDV        (outside_data_tl_rdv)                              //              .tl_rdv
	);

	finalproject_soc_sdram sdram (
		.clk            (sdram_pll_c0_clk),                         //   clk.clk
		.reset_n        (~rst_controller_001_reset_out_reset),      // reset.reset_n
		.az_addr        (mm_interconnect_0_sdram_s1_address),       //    s1.address
		.az_be_n        (~mm_interconnect_0_sdram_s1_byteenable),   //      .byteenable_n
		.az_cs          (mm_interconnect_0_sdram_s1_chipselect),    //      .chipselect
		.az_data        (mm_interconnect_0_sdram_s1_writedata),     //      .writedata
		.az_rd_n        (~mm_interconnect_0_sdram_s1_read),         //      .read_n
		.az_wr_n        (~mm_interconnect_0_sdram_s1_write),        //      .write_n
		.za_data        (mm_interconnect_0_sdram_s1_readdata),      //      .readdata
		.za_valid       (mm_interconnect_0_sdram_s1_readdatavalid), //      .readdatavalid
		.za_waitrequest (mm_interconnect_0_sdram_s1_waitrequest),   //      .waitrequest
		.zs_addr        (sdram_wire_addr),                          //  wire.export
		.zs_ba          (sdram_wire_ba),                            //      .export
		.zs_cas_n       (sdram_wire_cas_n),                         //      .export
		.zs_cke         (sdram_wire_cke),                           //      .export
		.zs_cs_n        (sdram_wire_cs_n),                          //      .export
		.zs_dq          (sdram_wire_dq),                            //      .export
		.zs_dqm         (sdram_wire_dqm),                           //      .export
		.zs_ras_n       (sdram_wire_ras_n),                         //      .export
		.zs_we_n        (sdram_wire_we_n)                           //      .export
	);

	finalproject_soc_sdram_pll sdram_pll (
		.clk                (clk_clk),                                         //       inclk_interface.clk
		.reset              (rst_controller_reset_out_reset),                  // inclk_interface_reset.reset
		.read               (mm_interconnect_0_sdram_pll_pll_slave_read),      //             pll_slave.read
		.write              (mm_interconnect_0_sdram_pll_pll_slave_write),     //                      .write
		.address            (mm_interconnect_0_sdram_pll_pll_slave_address),   //                      .address
		.readdata           (mm_interconnect_0_sdram_pll_pll_slave_readdata),  //                      .readdata
		.writedata          (mm_interconnect_0_sdram_pll_pll_slave_writedata), //                      .writedata
		.c0                 (sdram_pll_c0_clk),                                //                    c0.clk
		.c1                 (sdram_clk_clk),                                   //                    c1.clk
		.scandone           (),                                                //           (terminated)
		.scandataout        (),                                                //           (terminated)
		.areset             (1'b0),                                            //           (terminated)
		.locked             (),                                                //           (terminated)
		.phasedone          (),                                                //           (terminated)
		.phasecounterselect (4'b0000),                                         //           (terminated)
		.phaseupdown        (1'b0),                                            //           (terminated)
		.phasestep          (1'b0),                                            //           (terminated)
		.scanclk            (1'b0),                                            //           (terminated)
		.scanclkena         (1'b0),                                            //           (terminated)
		.scandata           (1'b0),                                            //           (terminated)
		.configupdate       (1'b0)                                             //           (terminated)
	);

	finalproject_soc_sysid_qsys_0 sysid_qsys_0 (
		.clock    (clk_clk),                                               //           clk.clk
		.reset_n  (~rst_controller_reset_out_reset),                       //         reset.reset_n
		.readdata (mm_interconnect_0_sysid_qsys_0_control_slave_readdata), // control_slave.readdata
		.address  (mm_interconnect_0_sysid_qsys_0_control_slave_address)   //              .address
	);

	finalproject_soc_mm_interconnect_0 mm_interconnect_0 (
		.clk_0_clk_clk                                         (clk_clk),                                               //                                       clk_0_clk.clk
		.sdram_pll_c0_clk                                      (sdram_pll_c0_clk),                                      //                                    sdram_pll_c0.clk
		.SDRAM_Master_Core_0_RESET_reset_bridge_in_reset_reset (rst_controller_reset_out_reset),                        // SDRAM_Master_Core_0_RESET_reset_bridge_in_reset.reset
		.sdram_reset_reset_bridge_in_reset_reset               (rst_controller_001_reset_out_reset),                    //               sdram_reset_reset_bridge_in_reset.reset
		.SDRAM_Master_Core_0_avalon_master_address             (sdram_master_core_0_avalon_master_address),             //               SDRAM_Master_Core_0_avalon_master.address
		.SDRAM_Master_Core_0_avalon_master_waitrequest         (sdram_master_core_0_avalon_master_waitrequest),         //                                                .waitrequest
		.SDRAM_Master_Core_0_avalon_master_byteenable          (sdram_master_core_0_avalon_master_byteenable),          //                                                .byteenable
		.SDRAM_Master_Core_0_avalon_master_chipselect          (sdram_master_core_0_avalon_master_chipselect),          //                                                .chipselect
		.SDRAM_Master_Core_0_avalon_master_read                (sdram_master_core_0_avalon_master_read),                //                                                .read
		.SDRAM_Master_Core_0_avalon_master_readdata            (sdram_master_core_0_avalon_master_readdata),            //                                                .readdata
		.SDRAM_Master_Core_0_avalon_master_readdatavalid       (sdram_master_core_0_avalon_master_readdatavalid),       //                                                .readdatavalid
		.SDRAM_Master_Core_0_avalon_master_write               (sdram_master_core_0_avalon_master_write),               //                                                .write
		.SDRAM_Master_Core_0_avalon_master_writedata           (sdram_master_core_0_avalon_master_writedata),           //                                                .writedata
		.sdram_s1_address                                      (mm_interconnect_0_sdram_s1_address),                    //                                        sdram_s1.address
		.sdram_s1_write                                        (mm_interconnect_0_sdram_s1_write),                      //                                                .write
		.sdram_s1_read                                         (mm_interconnect_0_sdram_s1_read),                       //                                                .read
		.sdram_s1_readdata                                     (mm_interconnect_0_sdram_s1_readdata),                   //                                                .readdata
		.sdram_s1_writedata                                    (mm_interconnect_0_sdram_s1_writedata),                  //                                                .writedata
		.sdram_s1_byteenable                                   (mm_interconnect_0_sdram_s1_byteenable),                 //                                                .byteenable
		.sdram_s1_readdatavalid                                (mm_interconnect_0_sdram_s1_readdatavalid),              //                                                .readdatavalid
		.sdram_s1_waitrequest                                  (mm_interconnect_0_sdram_s1_waitrequest),                //                                                .waitrequest
		.sdram_s1_chipselect                                   (mm_interconnect_0_sdram_s1_chipselect),                 //                                                .chipselect
		.sdram_pll_pll_slave_address                           (mm_interconnect_0_sdram_pll_pll_slave_address),         //                             sdram_pll_pll_slave.address
		.sdram_pll_pll_slave_write                             (mm_interconnect_0_sdram_pll_pll_slave_write),           //                                                .write
		.sdram_pll_pll_slave_read                              (mm_interconnect_0_sdram_pll_pll_slave_read),            //                                                .read
		.sdram_pll_pll_slave_readdata                          (mm_interconnect_0_sdram_pll_pll_slave_readdata),        //                                                .readdata
		.sdram_pll_pll_slave_writedata                         (mm_interconnect_0_sdram_pll_pll_slave_writedata),       //                                                .writedata
		.sysid_qsys_0_control_slave_address                    (mm_interconnect_0_sysid_qsys_0_control_slave_address),  //                      sysid_qsys_0_control_slave.address
		.sysid_qsys_0_control_slave_readdata                   (mm_interconnect_0_sysid_qsys_0_control_slave_readdata)  //                                                .readdata
	);

	altera_reset_controller #(
		.NUM_RESET_INPUTS          (1),
		.OUTPUT_RESET_SYNC_EDGES   ("deassert"),
		.SYNC_DEPTH                (2),
		.RESET_REQUEST_PRESENT     (0),
		.RESET_REQ_WAIT_TIME       (1),
		.MIN_RST_ASSERTION_TIME    (3),
		.RESET_REQ_EARLY_DSRT_TIME (1),
		.USE_RESET_REQUEST_IN0     (0),
		.USE_RESET_REQUEST_IN1     (0),
		.USE_RESET_REQUEST_IN2     (0),
		.USE_RESET_REQUEST_IN3     (0),
		.USE_RESET_REQUEST_IN4     (0),
		.USE_RESET_REQUEST_IN5     (0),
		.USE_RESET_REQUEST_IN6     (0),
		.USE_RESET_REQUEST_IN7     (0),
		.USE_RESET_REQUEST_IN8     (0),
		.USE_RESET_REQUEST_IN9     (0),
		.USE_RESET_REQUEST_IN10    (0),
		.USE_RESET_REQUEST_IN11    (0),
		.USE_RESET_REQUEST_IN12    (0),
		.USE_RESET_REQUEST_IN13    (0),
		.USE_RESET_REQUEST_IN14    (0),
		.USE_RESET_REQUEST_IN15    (0),
		.ADAPT_RESET_REQUEST       (0)
	) rst_controller (
		.reset_in0      (~reset_reset_n),                 // reset_in0.reset
		.clk            (clk_clk),                        //       clk.clk
		.reset_out      (rst_controller_reset_out_reset), // reset_out.reset
		.reset_req      (),                               // (terminated)
		.reset_req_in0  (1'b0),                           // (terminated)
		.reset_in1      (1'b0),                           // (terminated)
		.reset_req_in1  (1'b0),                           // (terminated)
		.reset_in2      (1'b0),                           // (terminated)
		.reset_req_in2  (1'b0),                           // (terminated)
		.reset_in3      (1'b0),                           // (terminated)
		.reset_req_in3  (1'b0),                           // (terminated)
		.reset_in4      (1'b0),                           // (terminated)
		.reset_req_in4  (1'b0),                           // (terminated)
		.reset_in5      (1'b0),                           // (terminated)
		.reset_req_in5  (1'b0),                           // (terminated)
		.reset_in6      (1'b0),                           // (terminated)
		.reset_req_in6  (1'b0),                           // (terminated)
		.reset_in7      (1'b0),                           // (terminated)
		.reset_req_in7  (1'b0),                           // (terminated)
		.reset_in8      (1'b0),                           // (terminated)
		.reset_req_in8  (1'b0),                           // (terminated)
		.reset_in9      (1'b0),                           // (terminated)
		.reset_req_in9  (1'b0),                           // (terminated)
		.reset_in10     (1'b0),                           // (terminated)
		.reset_req_in10 (1'b0),                           // (terminated)
		.reset_in11     (1'b0),                           // (terminated)
		.reset_req_in11 (1'b0),                           // (terminated)
		.reset_in12     (1'b0),                           // (terminated)
		.reset_req_in12 (1'b0),                           // (terminated)
		.reset_in13     (1'b0),                           // (terminated)
		.reset_req_in13 (1'b0),                           // (terminated)
		.reset_in14     (1'b0),                           // (terminated)
		.reset_req_in14 (1'b0),                           // (terminated)
		.reset_in15     (1'b0),                           // (terminated)
		.reset_req_in15 (1'b0)                            // (terminated)
	);

	altera_reset_controller #(
		.NUM_RESET_INPUTS          (1),
		.OUTPUT_RESET_SYNC_EDGES   ("deassert"),
		.SYNC_DEPTH                (2),
		.RESET_REQUEST_PRESENT     (0),
		.RESET_REQ_WAIT_TIME       (1),
		.MIN_RST_ASSERTION_TIME    (3),
		.RESET_REQ_EARLY_DSRT_TIME (1),
		.USE_RESET_REQUEST_IN0     (0),
		.USE_RESET_REQUEST_IN1     (0),
		.USE_RESET_REQUEST_IN2     (0),
		.USE_RESET_REQUEST_IN3     (0),
		.USE_RESET_REQUEST_IN4     (0),
		.USE_RESET_REQUEST_IN5     (0),
		.USE_RESET_REQUEST_IN6     (0),
		.USE_RESET_REQUEST_IN7     (0),
		.USE_RESET_REQUEST_IN8     (0),
		.USE_RESET_REQUEST_IN9     (0),
		.USE_RESET_REQUEST_IN10    (0),
		.USE_RESET_REQUEST_IN11    (0),
		.USE_RESET_REQUEST_IN12    (0),
		.USE_RESET_REQUEST_IN13    (0),
		.USE_RESET_REQUEST_IN14    (0),
		.USE_RESET_REQUEST_IN15    (0),
		.ADAPT_RESET_REQUEST       (0)
	) rst_controller_001 (
		.reset_in0      (~reset_reset_n),                     // reset_in0.reset
		.clk            (sdram_pll_c0_clk),                   //       clk.clk
		.reset_out      (rst_controller_001_reset_out_reset), // reset_out.reset
		.reset_req      (),                                   // (terminated)
		.reset_req_in0  (1'b0),                               // (terminated)
		.reset_in1      (1'b0),                               // (terminated)
		.reset_req_in1  (1'b0),                               // (terminated)
		.reset_in2      (1'b0),                               // (terminated)
		.reset_req_in2  (1'b0),                               // (terminated)
		.reset_in3      (1'b0),                               // (terminated)
		.reset_req_in3  (1'b0),                               // (terminated)
		.reset_in4      (1'b0),                               // (terminated)
		.reset_req_in4  (1'b0),                               // (terminated)
		.reset_in5      (1'b0),                               // (terminated)
		.reset_req_in5  (1'b0),                               // (terminated)
		.reset_in6      (1'b0),                               // (terminated)
		.reset_req_in6  (1'b0),                               // (terminated)
		.reset_in7      (1'b0),                               // (terminated)
		.reset_req_in7  (1'b0),                               // (terminated)
		.reset_in8      (1'b0),                               // (terminated)
		.reset_req_in8  (1'b0),                               // (terminated)
		.reset_in9      (1'b0),                               // (terminated)
		.reset_req_in9  (1'b0),                               // (terminated)
		.reset_in10     (1'b0),                               // (terminated)
		.reset_req_in10 (1'b0),                               // (terminated)
		.reset_in11     (1'b0),                               // (terminated)
		.reset_req_in11 (1'b0),                               // (terminated)
		.reset_in12     (1'b0),                               // (terminated)
		.reset_req_in12 (1'b0),                               // (terminated)
		.reset_in13     (1'b0),                               // (terminated)
		.reset_req_in13 (1'b0),                               // (terminated)
		.reset_in14     (1'b0),                               // (terminated)
		.reset_req_in14 (1'b0),                               // (terminated)
		.reset_in15     (1'b0),                               // (terminated)
		.reset_req_in15 (1'b0)                                // (terminated)
	);

endmodule
