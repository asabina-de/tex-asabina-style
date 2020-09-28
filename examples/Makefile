SHELL = /bin/sh

XELATEX = xelatex
RM = rm -rf
DOCKER = docker

# https://hub.docker.com/r/adnrv/texlive/tags
# https://hub.docker.com/layers/adnrv/texlive/full/images/sha256-82483f20504026e7d9c6ad822042a44f5dad8a509406b6e260c3648bd19fbcb1?context=explore
DOCKER_IMAGE ?= adnrv/texlive@sha256:82483f20504026e7d9c6ad822042a44f5dad8a509406b6e260c3648bd19fbcb1

# Build the PDF
%.pdf: %.tex
	$(XELATEX) -halt-on-error $< && \
		echo =================== && \
		xelatex -halt-on-error $<
	
clean:
	$(RM) *.aux *.dvi *.log *.out *.toc *.pdf

# Run make layout.pdf from within a Docker environment
test:
	$(DOCKER) run \
		--rm \
		--user=$(shell id -u):$(shell id -g) \
		-v $(PWD)/..:/home \
		-w /home/examples \
		$(DOCKER_IMAGE) \
		make -B layout.pdf

.PHONY: clean test
