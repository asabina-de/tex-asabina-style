%.pdf: %.tex
	xelatex -halt-on-error $< && \
		echo =================== && \
		xelatex -halt-on-error $<
	
clean:
	rm -rf *.aux *.dvi *.log *.out *.toc *.pdf

.PHONY: clean
