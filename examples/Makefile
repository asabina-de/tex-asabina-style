SHELL = /bin/sh

XELATEX = xelatex
RM = rm -rf
DOCKER = docker

BUILD_PASSES = 3

# https://hub.docker.com/r/adnrv/texlive/tags
# https://hub.docker.com/layers/adnrv/texlive/full/images/sha256-82483f20504026e7d9c6ad822042a44f5dad8a509406b6e260c3648bd19fbcb1?context=explore
DOCKER_IMAGE ?= adnrv/texlive@sha256:82483f20504026e7d9c6ad822042a44f5dad8a509406b6e260c3648bd19fbcb1

clean:
	$(RM) *.aux *.dvi *.log *.out *.toc *.pdf

# Build the pdf within a TeXlive Docker container
%.pdf: %.tex
	$(DOCKER) run \
		--name xelatex-asabina-style-test \
		--rm -it \
		--user=$(shell id -u):$(shell id -g) \
		-e "HOME=/home/examples" \
		-v $(PWD)/../tex:/home/examples/texmf/tex \
		-v $(PWD):/tmp/examples \
		-w /tmp/examples \
		$(DOCKER_IMAGE) \
		bash -c "\
			for i in {1..$(BUILD_PASSES)}; do \
				$(XELATEX) -shell-escape -halt-on-error $< || exit 1; \
			done"

test: layout.pdf

.PHONY: clean test
