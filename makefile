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
	install -d -m 755 $(INSTALLDIR)
	cp -r $(OUTDIR)/$(NAME)/* $(INSTALLDIR)
	chown -R root:root $(INSTALLDIR)/$(THEMENAME)-xfwm4-*/
	chmod -R u=rwX,go=rX $(INSTALLDIR)/$(THEMENAME)-xfwm4-*/

uninstall:
	rm -Rf $(INSTALLDIR)/$(THEMENAME)-xfwm4-*/

clean:
	rm -Rf $(OUTDIR)/$(NAME)

togit:
	git add .
	git commit -m "Updated from makefile"
	git push origin
