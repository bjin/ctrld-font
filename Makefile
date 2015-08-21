
BDFS := ctrld-fixed-16r.bdf ctrld-fixed-16b.bdf ctrld-fixed-16r-i.bdf ctrld-fixed-16b-i.bdf
BDFS += ctrld-fixed-13r.bdf ctrld-fixed-13b.bdf ctrld-fixed-13r-i.bdf ctrld-fixed-13b-i.bdf
BDFS += ctrld-fixed-10r.bdf ctrld-fixed-10b.bdf

PCFS := ${BDFS:.bdf=.pcf}

all: fonts.dir fonts.scale ${PCFS}
	xset fp default
	xset +fp `pwd`
	xset fp rehash

fonts.dir: ${PCFS} fonts.scale
	mkfontdir

fonts.scale: ${PCFS}
	mkfontscale

clean:
	rm -rf *.bak *-2x.bdf *.pcf fonts.dir fonts.scale

2x:
	for i in ${BDFS}; do bdfresize -f 2 "$$i" > $$(basename $$i .bdf)-2x.bdf; done

.SUFFIXES: .bdf .pcf

.bdf.pcf:
	bdftopcf -o $@ $<
