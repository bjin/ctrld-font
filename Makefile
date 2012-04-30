
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
	rm -rf *.pcf fonts.dir fonts.scale

.SUFFIXES: .bdf .pcf

.bdf.pcf:
	bdftopcf -o $@ $<
