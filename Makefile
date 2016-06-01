#
# Makefile
#
# Author:  Lars Thoms <lars.thoms@spacecafe.org>
# Version: 2016-04-27
#
# Compile LaTex to PDF
#


# =====[ Configuration ]========================================================

TEX = pdflatex --shell-escape
BIB = biber

FILE = Bericht
IMAGEPATH = .images/


# =====[ Targets ]==============================================================

.PHONY: clean

compile: $(FILE).pdf clean

%.pdf: %.tex %.bbl
	$(TEX) $< 

%.bbl: %.bcf
	$(BIB) $<

%.bcf: %.tex
	$(TEX) $<

clean:
	@rm -f $(IMAGEPATH)*-eps-converted-to.pdf
	@rm -f *.{aux,bbl,bcf,blg,log,nav,out,run.xml,snm,toc,vrb}
