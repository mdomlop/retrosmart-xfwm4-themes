include makefile.mk
AUTHORS.md: AUTHORS
	@cat AUTHORS > AUTHORS.md
INSTALL.md: INSTALL
	@cat INSTALL > INSTALL.md
README.md: README
	@cat README > README.md
update-preview: preview.png README
	@echo ![retrosmart-preview]\(https://raw.githubusercontent.com/mdomlop/retrosmart-xfwm4-themes/master/preview.png \"Retrosmart look\"\) > README.md
	@echo >> README.md
	@cat README >> README.md
doc: AUTHORS.md INSTALL.md README.md
