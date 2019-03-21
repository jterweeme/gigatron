all: spectrum.sof

spectrum.sof:
	quartus_sh --flow compile gigatron -c de2_115

clean:
	rm -Rvf db incremental_db simulation output_files greybox_tmp
	rm -Rvf *.sof *.pof *.bak *.rpt *.summary *.pin *.done *.qws *.smsg


