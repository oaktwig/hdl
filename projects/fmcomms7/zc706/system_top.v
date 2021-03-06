// ***************************************************************************
// ***************************************************************************
// Copyright 2014 - 2017 (c) Analog Devices, Inc. All rights reserved.
//
// In this HDL repository, there are many different and unique modules, consisting
// of various HDL (Verilog or VHDL) components. The individual modules are
// developed independently, and may be accompanied by separate and unique license
// terms.
//
// The user should read each of these license terms, and understand the
// freedoms and responsabilities that he or she has by using this source/core.
//
// This core is distributed in the hope that it will be useful, but WITHOUT ANY
// WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
// A PARTICULAR PURPOSE.
//
// Redistribution and use of source or resulting binaries, with or without modification
// of this file, are permitted under one of the following two license terms:
//
//   1. The GNU General Public License version 2 as published by the
//      Free Software Foundation, which can be found in the top level directory
//      of this repository (LICENSE_GPL2), and also online at:
//      <https://www.gnu.org/licenses/old-licenses/gpl-2.0.html>
//
// OR
//
//   2. An ADI specific BSD license, which can be found in the top level directory
//      of this repository (LICENSE_ADIBSD), and also on-line at:
//      https://github.com/analogdevicesinc/hdl/blob/master/LICENSE_ADIBSD
//      This will allow to generate bit files and not release the source code,
//      as long as it attaches to an ADI device.
//
// ***************************************************************************
// ***************************************************************************

`timescale 1ns/100ps

module system_top (

  inout       [ 14:0]     ddr_addr,
  inout       [ 2:0]      ddr_ba,
  inout                   ddr_cas_n,
  inout                   ddr_ck_n,
  inout                   ddr_ck_p,
  inout                   ddr_cke,
  inout                   ddr_cs_n,
  inout       [ 3:0]      ddr_dm,
  inout       [ 31:0]     ddr_dq,
  inout       [ 3:0]      ddr_dqs_n,
  inout       [ 3:0]      ddr_dqs_p,
  inout                   ddr_odt,
  inout                   ddr_ras_n,
  inout                   ddr_reset_n,
  inout                   ddr_we_n,

  inout                   fixed_io_ddr_vrn,
  inout                   fixed_io_ddr_vrp,
  inout       [ 53:0]     fixed_io_mio,
  inout                   fixed_io_ps_clk,
  inout                   fixed_io_ps_porb,
  inout                   fixed_io_ps_srstb,

  inout       [ 14:0]     gpio_bd,

  output                  hdmi_out_clk,
  output                  hdmi_vsync,
  output                  hdmi_hsync,
  output                  hdmi_data_e,
  output      [ 23:0]     hdmi_data,

  output                  spdif,

  input                   sys_rst,
  input                   sys_clk_p,
  input                   sys_clk_n,

  output      [ 13:0]     ddr3_addr,
  output      [ 2:0]      ddr3_ba,
  output                  ddr3_cas_n,
  output      [ 0:0]      ddr3_ck_n,
  output      [ 0:0]      ddr3_ck_p,
  output      [ 0:0]      ddr3_cke,
  output      [ 0:0]      ddr3_cs_n,
  output      [ 7:0]      ddr3_dm,
  inout       [ 63:0]     ddr3_dq,
  inout       [ 7:0]      ddr3_dqs_n,
  inout       [ 7:0]      ddr3_dqs_p,
  output      [ 0:0]      ddr3_odt,
  output                  ddr3_ras_n,
  output                  ddr3_reset_n,
  output                  ddr3_we_n,

  inout                   iic_scl,
  inout                   iic_sda,

  input                   rx_ref_clk_p,
  input                   rx_ref_clk_n,
  input                   rx_sysref_p,
  input                   rx_sysref_n,
  output                  rx_sync_p,
  output                  rx_sync_n,
  input       [ 3:0]      rx_data_p,
  input       [ 3:0]      rx_data_n,

  input                   tx_ref_clk_p,
  input                   tx_ref_clk_n,
  input                   tx_sysref_p,
  input                   tx_sysref_n,
  input                   tx_sync0_p,
  input                   tx_sync0_n,
  input                   tx_sync1_p,
  input                   tx_sync1_n,
  output      [ 7:0]      tx_data_p,
  output      [ 7:0]      tx_data_n,

  input                   trig_p,
  input                   trig_n,

  output                  spi_csn_clk,
  output                  spi_csn_dac,
  output                  spi_csn_adc,
  output                  spi_clk,
  inout                   spi_sdio,
  output                  spi_dir,

  output                  spi2_csn_adf4355_1,
  output                  spi2_csn_adf4355_2,
  output                  spi2_csn_hmc1044_1,
  output                  spi2_csn_hmc1044_2,
  output                  spi2_csn_hmc1044_3,
  output                  spi2_csn_adl5240_1,
  output                  spi2_csn_adl5240_2,
  output                  spi2_csn_hmc271_1,
  output                  spi2_csn_hmc271_2,
  output                  spi2_clk,
  output                  spi2_sdo,
  input                   spi2_sdi_hmc271_1,
  input                   spi2_sdi_hmc271_2,

  inout       [ 3:0]      clk_gpio,
  inout                   adc_fda,
  inout                   adc_fdb,
  inout                   dac_irq,
  inout                   adf4355_1_ld,
  inout                   adf4355_2_ld,
  inout                   xo_en,
  inout                   clk_sync,
  inout                   adf4355_2_pd,
  inout                   dac_txen0,
  inout                   dac_txen1,
  inout                   hmc271_1_reset,
  inout                   hmc271_2_reset,
  inout                   hmc349_sel,
  inout                   hmc922_a,
  inout                   hmc922_b);

  // internal registers

  reg             dac_drd = 'd0;
  reg    [ 63:0]  dac_ddata_0 = 'd0;
  reg    [ 63:0]  dac_ddata_1 = 'd0;
  reg    [ 63:0]  dac_ddata_2 = 'd0;
  reg    [ 63:0]  dac_ddata_3 = 'd0;
  reg             adc_dsync = 'd0;
  reg             adc_dwr = 'd0;
  reg    [127:0]  adc_ddata = 'd0;

  // internal signals

  wire   [ 63:0]  gpio_i;
  wire   [ 63:0]  gpio_o;
  wire   [ 63:0]  gpio_t;
  wire   [  2:0]  spi0_csn;
  wire            spi0_clk;
  wire            spi0_mosi;
  wire            spi0_miso;
  wire   [  2:0]  spi1_csn;
  wire            spi1_clk;
  wire            spi1_mosi;
  wire            spi1_miso;
  wire   [ 11:0]  spi2_csn;
  wire            spi2_mosi;
  wire            spi2_miso;
  wire            trig;
  wire            rx_ref_clk;
  wire            rx_sysref;
  wire            rx_sync;
  wire            tx_ref_clk;
  wire            tx_sysref;
  wire            tx_sync0;
  wire            tx_sync1;
  wire            tx_sync;

  // spi

  assign spi_csn_adc = spi0_csn[2];
  assign spi_csn_dac = spi0_csn[1];
  assign spi_csn_clk = spi0_csn[0];

  // instantiations

  IBUFDS_GTE2 i_ibufds_rx_ref_clk (
    .CEB (1'd0),
    .I (rx_ref_clk_p),
    .IB (rx_ref_clk_n),
    .O (rx_ref_clk),
    .ODIV2 ());

  IBUFDS i_ibufds_rx_sysref (
    .I (rx_sysref_p),
    .IB (rx_sysref_n),
    .O (rx_sysref));

  OBUFDS i_obufds_rx_sync (
    .I (rx_sync),
    .O (rx_sync_p),
    .OB (rx_sync_n));

  IBUFDS_GTE2 i_ibufds_tx_ref_clk (
    .CEB (1'd0),
    .I (tx_ref_clk_p),
    .IB (tx_ref_clk_n),
    .O (tx_ref_clk),
    .ODIV2 ());

  IBUFDS i_ibufds_tx_sysref (
    .I (tx_sysref_p),
    .IB (tx_sysref_n),
    .O (tx_sysref));

  IBUFDS i_ibufds_tx_sync0 (
    .I (tx_sync0_p),
    .IB (tx_sync0_n),
    .O (tx_sync0));

  IBUFDS i_ibufds_tx_sync1 (
    .I (tx_sync1_p),
    .IB (tx_sync1_n),
    .O (tx_sync1));

  assign tx_sync = tx_sync0 & tx_sync1;

  fmcomms7_spi i_spi (
    .spi_csn (spi0_csn),
    .spi_clk (spi_clk),
    .spi_mosi (spi0_mosi),
    .spi_miso (spi0_miso),
    .spi_sdio (spi_sdio),
    .spi_dir (spi_dir));

  IBUFDS i_ibufds_trig (
    .I (trig_p),
    .IB (trig_n),
    .O (trig));

  assign spi2_csn_adf4355_1 = spi2_csn[0];
  assign spi2_csn_adf4355_2 = spi2_csn[1];
  assign spi2_csn_hmc1044_1 = spi2_csn[2];
  assign spi2_csn_hmc1044_2 = spi2_csn[3];
  assign spi2_csn_hmc1044_3 = spi2_csn[4];
  assign spi2_csn_adl5240_1 = spi2_csn[5];
  assign spi2_csn_adl5240_2 = spi2_csn[6];
  assign spi2_csn_hmc271_1 = spi2_csn[7];
  assign spi2_csn_hmc271_2 = spi2_csn[8];
  assign spi2_sdo = spi2_mosi;
  assign spi2_miso =  (~spi2_csn[7]  & spi2_sdi_hmc271_1) |
                      (~spi2_csn[8]  & spi2_sdi_hmc271_2);

  assign gpio_i[51] = trig;
  assign spi_clk = spi0_clk;

  ad_iobuf #(.DATA_WIDTH(19)) i_iobuf (
    .dio_t (gpio_t[50:32]),
    .dio_i (gpio_o[50:32]),
    .dio_o (gpio_i[50:32]),
    .dio_p ({ xo_en,            // 50
              clk_sync,         // 49
              adf4355_2_pd,     // 48
              dac_txen0,        // 47
              dac_txen1,        // 46
              hmc271_1_reset,   // 45
              hmc271_2_reset,   // 44
              hmc349_sel,       // 43
              hmc922_a,         // 42
              hmc922_b,         // 41
              adf4355_2_ld,     // 40
              adf4355_1_ld,     // 39
              dac_irq,          // 38
              adc_fdb,          // 37
              adc_fda,          // 36
              clk_gpio[3],      // 35
              clk_gpio[2],      // 34
              clk_gpio[1],      // 33
              clk_gpio[0]}));   // 32

  ad_iobuf #(.DATA_WIDTH(15)) i_iobuf_bd (
    .dio_t (gpio_t[14:0]),
    .dio_i (gpio_o[14:0]),
    .dio_o (gpio_i[14:0]),
    .dio_p (gpio_bd));

  system_wrapper i_system_wrapper (
    .ddr3_addr (ddr3_addr),
    .ddr3_ba (ddr3_ba),
    .ddr3_cas_n (ddr3_cas_n),
    .ddr3_ck_n (ddr3_ck_n),
    .ddr3_ck_p (ddr3_ck_p),
    .ddr3_cke (ddr3_cke),
    .ddr3_cs_n (ddr3_cs_n),
    .ddr3_dm (ddr3_dm),
    .ddr3_dq (ddr3_dq),
    .ddr3_dqs_n (ddr3_dqs_n),
    .ddr3_dqs_p (ddr3_dqs_p),
    .ddr3_odt (ddr3_odt),
    .ddr3_ras_n (ddr3_ras_n),
    .ddr3_reset_n (ddr3_reset_n),
    .ddr3_we_n (ddr3_we_n),
    .ddr_addr (ddr_addr),
    .ddr_ba (ddr_ba),
    .ddr_cas_n (ddr_cas_n),
    .ddr_ck_n (ddr_ck_n),
    .ddr_ck_p (ddr_ck_p),
    .ddr_cke (ddr_cke),
    .ddr_cs_n (ddr_cs_n),
    .ddr_dm (ddr_dm),
    .ddr_dq (ddr_dq),
    .ddr_dqs_n (ddr_dqs_n),
    .ddr_dqs_p (ddr_dqs_p),
    .ddr_odt (ddr_odt),
    .ddr_ras_n (ddr_ras_n),
    .ddr_reset_n (ddr_reset_n),
    .ddr_we_n (ddr_we_n),
    .fixed_io_ddr_vrn (fixed_io_ddr_vrn),
    .fixed_io_ddr_vrp (fixed_io_ddr_vrp),
    .fixed_io_mio (fixed_io_mio),
    .fixed_io_ps_clk (fixed_io_ps_clk),
    .fixed_io_ps_porb (fixed_io_ps_porb),
    .fixed_io_ps_srstb (fixed_io_ps_srstb),
    .gpio_i (gpio_i),
    .gpio_o (gpio_o),
    .gpio_t (gpio_t),
    .hdmi_data (hdmi_data),
    .hdmi_data_e (hdmi_data_e),
    .hdmi_hsync (hdmi_hsync),
    .hdmi_out_clk (hdmi_out_clk),
    .hdmi_vsync (hdmi_vsync),
    .iic_main_scl_io (iic_scl),
    .iic_main_sda_io (iic_sda),
    .ps_intr_00 (1'b0),
    .ps_intr_01 (1'b0),
    .ps_intr_02 (1'b0),
    .ps_intr_03 (1'b0),
    .ps_intr_04 (1'b0),
    .ps_intr_05 (1'b0),
    .ps_intr_06 (1'b0),
    .ps_intr_07 (1'b0),
    .ps_intr_08 (1'b0),
    .ps_intr_11 (1'b0),
    .rx_data_0_n (rx_data_n[0]),
    .rx_data_0_p (rx_data_p[0]),
    .rx_data_1_n (rx_data_n[1]),
    .rx_data_1_p (rx_data_p[1]),
    .rx_data_2_n (rx_data_n[2]),
    .rx_data_2_p (rx_data_p[2]),
    .rx_data_3_n (rx_data_n[3]),
    .rx_data_3_p (rx_data_p[3]),
    .rx_ref_clk_0 (rx_ref_clk),
    .rx_sync_0 (rx_sync),
    .rx_sysref_0 (rx_sysref),
    .spdif (spdif),
    .spi0_clk_i (spi0_clk),
    .spi0_clk_o (spi0_clk),
    .spi0_csn_0_o (spi0_csn[0]),
    .spi0_csn_1_o (spi0_csn[1]),
    .spi0_csn_2_o (spi0_csn[2]),
    .spi0_csn_i (1'b1),
    .spi0_sdi_i (spi0_miso),
    .spi0_sdo_i (spi0_mosi),
    .spi0_sdo_o (spi0_mosi),
    .spi1_clk_i (spi1_clk),
    .spi1_clk_o (spi1_clk),
    .spi1_csn_0_o (spi1_csn[0]),
    .spi1_csn_1_o (spi1_csn[1]),
    .spi1_csn_2_o (spi1_csn[2]),
    .spi1_csn_i (1'b1),
    .spi1_sdi_i (1'b1),
    .spi1_sdo_i (spi1_mosi),
    .spi1_sdo_o (spi1_mosi),
    .spi2_clk_i (spi2_clk),
    .spi2_clk_o (spi2_clk),
    .spi2_csn_i (12'hfff),
    .spi2_csn_o (spi2_csn),
    .spi2_sdi_i (spi2_miso),
    .spi2_sdo_i (spi2_mosi),
    .spi2_sdo_o (spi2_mosi),
    .sys_clk_clk_n (sys_clk_n),
    .sys_clk_clk_p (sys_clk_p),
    .sys_rst (sys_rst),
    .tx_data_0_n (tx_data_n[0]),
    .tx_data_0_p (tx_data_p[0]),
    .tx_data_1_n (tx_data_n[1]),
    .tx_data_1_p (tx_data_p[1]),
    .tx_data_2_n (tx_data_n[2]),
    .tx_data_2_p (tx_data_p[2]),
    .tx_data_3_n (tx_data_n[3]),
    .tx_data_3_p (tx_data_p[3]),
    .tx_data_4_n (tx_data_n[4]),
    .tx_data_4_p (tx_data_p[4]),
    .tx_data_5_n (tx_data_n[5]),
    .tx_data_5_p (tx_data_p[5]),
    .tx_data_6_n (tx_data_n[6]),
    .tx_data_6_p (tx_data_p[6]),
    .tx_data_7_n (tx_data_n[7]),
    .tx_data_7_p (tx_data_p[7]),
    .tx_ref_clk_0 (tx_ref_clk),
    .tx_sync_0 (tx_sync),
    .tx_sysref_0 (tx_sysref));

endmodule

// ***************************************************************************
// ***************************************************************************
