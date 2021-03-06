# ip

source ../scripts/adi_env.tcl
source $ad_hdl_dir/library/scripts/adi_ip.tcl

adi_ip_create axi_adc_decimate
adi_ip_files axi_adc_decimate [list \
  "$ad_hdl_dir/library/common/up_xfer_cntrl.v" \
  "$ad_hdl_dir/library/common/up_axi.v" \
  "$ad_hdl_dir/library/common/ad_iqcor.v" \
  "axi_adc_decimate_constr.xdc" \
  "fir_decim.v" \
  "cic_decim.v" \
  "axi_adc_decimate_filter.v" \
  "axi_adc_decimate_reg.v" \
  "axi_adc_decimate.v" ]

adi_ip_properties axi_adc_decimate

adi_ip_add_core_dependencies { \
  analog.com:user:util_cic:1.0 \
}

ipx::associate_bus_interfaces -busif s_axi -clock s_axi_aclk [ipx::current_core]

ipx::save_core [ipx::current_core]

