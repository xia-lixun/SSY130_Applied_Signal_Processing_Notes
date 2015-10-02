TARGET=main
CHAPTERS=lecture1.tex \
	lecture2.tex \
	lecture3.tex \
	lecture4.tex \
	lecture5.tex 

${TARGET}.dvi: ${TARGET}.tex ${CHAPTERS}
	latex ${TARGET}.tex
	latex ${TARGET}.tex && latex ${TARGET}.tex

${TARGET}.ps: ${TARGET}.dvi
	dvips -o ${TARGET}.ps ${TARGET}.dvi

${TARGET}.pdf: ${TARGET}.dvi
	dvipdf ${TARGET}.dvi

${TARGET}.tgz: Makefile *.bib *.tex *.ps *.pdf figures/* 
	tar chzf ${TARGET}-`date +%Y%m%d-%H%M`.tgz Makefile *.bib *.tex *.ps *.pdf figures/*


dvi: ${TARGET}.dvi

ps: ${TARGET}.ps

pdf: ${TARGET}.pdf

tgz: ${TARGET}.tgz

spell: 
	ispell ${TARGET}.tex ${CHAPTERS}

clean: 
	rm -f *.aux *.bak *.log *.toc *.bbl *.lof *.lot *.blg *.flc *.glo *.gls *.ilg *~

cleanall: clean 
	rm *.dvi *.ps *.pdf

