####################################################################################
####################################################################################
## Copyright 2011(c) Analog Devices, Inc.
## Auto-generated, do not modify!
####################################################################################
####################################################################################

M_DEPS += system_top.v
M_DEPS += system_project.tcl
M_DEPS += system_constr.xdc
M_DEPS += system_bd.tcl
M_DEPS += ../common/fmcomms2_bd.tcl
M_DEPS += ../../scripts/adi_project.tcl
M_DEPS += ../../scripts/adi_env.tcl
M_DEPS += ../../scripts/adi_board.tcl
M_DEPS += ../../common/kcu105/kcu105_system_mig.tcl
M_DEPS += ../../common/kcu105/kcu105_system_lutram_constr.xdc
M_DEPS += ../../common/kcu105/kcu105_system_constr.xdc
M_DEPS += ../../common/kcu105/kcu105_system_bd.tcl
M_DEPS += ../../../library/xilinx/common/ad_iobuf.v
M_DEPS += ../../../library/axi_ad9361/axi_ad9361_delay.tcl
M_DEPS += ../../../library/axi_ad9361/axi_ad9361.xpr
M_DEPS += ../../../library/axi_dmac/axi_dmac.xpr
M_DEPS += ../../../library/util_clkdiv/util_clkdiv.xpr
M_DEPS += ../../../library/util_cpack/util_cpack.xpr
M_DEPS += ../../../library/util_rfifo/util_rfifo.xpr
M_DEPS += ../../../library/util_tdd_sync/util_tdd_sync.xpr
M_DEPS += ../../../library/util_upack/util_upack.xpr
M_DEPS += ../../../library/util_wfifo/util_wfifo.xpr

M_VIVADO := vivado -mode batch -source

M_FLIST := *.cache
M_FLIST += *.data
M_FLIST += *.xpr
M_FLIST += *.log
M_FLIST += *.jou
M_FLIST +=  xgui
M_FLIST += *.runs
M_FLIST += *.srcs
M_FLIST += *.sdk
M_FLIST += *.hw
M_FLIST += *.sim
M_FLIST += .Xil
M_FLIST += *.ip_user_files



.PHONY: all lib clean clean-all
all: lib fmcomms2_kcu105.sdk/system_top.hdf


clean: 
	rm -rf $(M_FLIST)


clean-all:clean
	make -C ../../../library/axi_ad9361 clean
	make -C ../../../library/axi_dmac clean
	make -C ../../../library/util_clkdiv clean
	make -C ../../../library/util_cpack clean
	make -C ../../../library/util_rfifo clean
	make -C ../../../library/util_tdd_sync clean
	make -C ../../../library/util_upack clean
	make -C ../../../library/util_wfifo clean


fmcomms2_kcu105.sdk/system_top.hdf: $(M_DEPS)
	-rm -rf $(M_FLIST)
	$(M_VIVADO) system_project.tcl >> fmcomms2_kcu105_vivado.log 2>&1


lib:
	make -C ../../../library/axi_ad9361
	make -C ../../../library/axi_dmac
	make -C ../../../library/util_clkdiv
	make -C ../../../library/util_cpack
	make -C ../../../library/util_rfifo
	make -C ../../../library/util_tdd_sync
	make -C ../../../library/util_upack
	make -C ../../../library/util_wfifo

####################################################################################
####################################################################################
