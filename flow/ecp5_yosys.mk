#	ecp5_yosys.mk
#	((Anonymized)).  See LICENSE.

#	=== ECP5 / Open Source Flow

ECP5_OSS	?=
PNRFLAGS	?=	--lpf flow/ulx3s_v20.lpf \
				--85k --package CABGA381 --ignore-loops

#	build target

ECP5_BIT	=	$(BUILD)/ecp5.bit

#	synthesis

$(BUILD)/ecp5.json: $(BUILD) $(RTL) $(FW).hex
	$(ECP5_OSS)yosys -p "synth_ecp5 -json $@ -top ecp5_top" $(RTL)

#	pack

%.bit:	%.config
	$(ECP5_OSS)ecppack $< $@

%.svf:	%.config
	$(ECP5_OSS)ecppack --input $< --svf $@

#	place and route

%.config:	%.json
	$(ECP5_OSS)nextpnr-ecp5 --json $< --textcfg $@ $(PNRFLAGS)

#	same, but invoke a gui

%.gui:	%.json
	$(ECP5_OSS)nextpnr-ecp5 --gui --json $< --textcfg $@ $(PNRFLAGS)

#	===	helpers ===

#	program

prog:	$(ECP5_BIT)
	$(ECP5_OSS)fujprog $<

term:
	tio -b 1000000 -m INLCRNL /dev/ttyUSB0

#	generate a pll (for clock source)

pll_25_%.v:
	$(ECP5_OSS)ecppll \
		-i 25 \
		-o $(subst pll_25_,,$(basename $@)) \
		-n $(basename $@) \
		-f $@

