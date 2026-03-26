SHELL := /bin/bash

LATEXMK ?= latexmk
LATEX_FLAGS := -xelatex -interaction=nonstopmode -halt-on-error -file-line-error

MAIN_TEX := main.tex
DEMO_TEX := demo/demo.tex
DEMO_ENV := TEXINPUTS=.:$(CURDIR):

TEXMFHOME ?= $(shell kpsewhich -var-value TEXMFHOME)
INSTALL_DIR := $(TEXMFHOME)/tex/latex/gdue-beamer-theme
THEME_FILES := beamerthemegdue.sty gdue.sty

.PHONY: all main demo check clean distclean install uninstall

all: check

main:
	$(LATEXMK) $(LATEX_FLAGS) $(MAIN_TEX)

demo:
	$(DEMO_ENV) $(LATEXMK) $(LATEX_FLAGS) $(DEMO_TEX)

check: main demo

clean:
	$(LATEXMK) -c $(MAIN_TEX)
	$(DEMO_ENV) $(LATEXMK) -c $(DEMO_TEX)

distclean: clean
	$(LATEXMK) -C $(MAIN_TEX)
	$(DEMO_ENV) $(LATEXMK) -C $(DEMO_TEX)
	$(RM) main.pdf demo/demo.pdf

install:
	@test -n "$(TEXMFHOME)" || (echo "TEXMFHOME not found"; exit 1)
	mkdir -p "$(INSTALL_DIR)"
	cp $(THEME_FILES) "$(INSTALL_DIR)/"
	-texhash "$(TEXMFHOME)" >/dev/null 2>&1 || true
	@echo "Installed theme files to $(INSTALL_DIR)"

uninstall:
	@test -n "$(TEXMFHOME)" || (echo "TEXMFHOME not found"; exit 1)
	$(RM) "$(INSTALL_DIR)/beamerthemegdue.sty" "$(INSTALL_DIR)/gdue.sty"
	-rmdir "$(INSTALL_DIR)" 2>/dev/null || true
	-texhash "$(TEXMFHOME)" >/dev/null 2>&1 || true
	@echo "Removed theme files from $(INSTALL_DIR)"
