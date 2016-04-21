THEMENAME='retrosmart'
SUFFIX='-xfwm4-themes'
NAME=$(THEMENAME)$(SUFFIX)
SRCDIR='src'
OUTDIR='.'
PREFIX='/usr'
INSTALLDIR=$(PREFIX)'/share/themes'

$(NAME): clean
	mkdir $(OUTDIR)/$(NAME)
	cp -r $(SRCDIR)/$(THEMENAME)-*/ $(OUTDIR)/$(NAME)/

install: uninstall $(NAME)
	mkdir -p $(INSTALLDIR)
	cp -r $(OUTDIR)/$(NAME)/* $(INSTALLDIR)
	chown -R root:root $(INSTALLDIR)/$(THEMENAME)-*/gtk-*/
	chmod -R u=rwX,go=rX $(INSTALLDIR)/$(THEMENAME)-*/gtk-*/

uninstall:
	rm -Rf $(INSTALLDIR)/$(THEMENAME)-xfwm4-*/

clean:
	rm -Rf $(OUTDIR)/$(NAME)

