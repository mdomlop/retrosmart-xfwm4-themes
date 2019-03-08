BASE = retrosmart-xfwm4
EXECUTABLE_NAME = $(BASE)-themes
PREFIX = '/usr'
DESTDIR = ''
DOCS = AUTHORS README.md

$(BASE):
	cp -r src/$(BASE)-* .

install: install_docs
	install -d -m 755 $(DESTDIR)/$(PREFIX)'/share/themes'
	cp -r src/$(BASE)-* $(DESTDIR)/$(PREFIX)'/share/themes'
	chown -R root:root $(DESTDIR)/$(PREFIX)'/share/themes'/$(BASE)-*/
	chmod -R u=rwX,go=rX $(DESTDIR)/$(PREFIX)'/share/themes'/$(BASE)-*/

install_docs: $(DOCS) COPYING
	install -dm 755 $(DESTDIR)$(PREFIX)/share/doc/$(EXECUTABLE_NAME)
	install -Dm 644 $(DOCS) $(DESTDIR)$(PREFIX)/share/doc/$(EXECUTABLE_NAME)

	install -dm 755 $(DESTDIR)$(PREFIX)/share/licenses/$(EXECUTABLE_NAME)
	install -Dm 644 COPYING $(DESTDIR)/$(PREFIX)/share/licenses/$(EXECUTABLE_NAME)

uninstall:
	rm -rf $(PREFIX)/share/themes/$(BASE)-*/
	rm -rf $(PREFIX)/share/licenses/$(EXECUTABLE_NAME)/
	rm -rf $(PREFIX)/share/doc/$(EXECUTABLE_NAME)/

clean:
	rm -rf $(BASE)-*

arch_pkg: ChangeLog
	makepkg -d

ocs: $(EXECUTABLE_NAME).tar.xz
$(EXECUTABLE_NAME).tar.xz:
	cd src/; tar cJf ../$(EXECUTABLE_NAME).tar.xz $(BASE)-*

user_install:
	mkdir -p ~/.themes/
	cp -r src/$(BASE)-*/ ~/.themes/

user_uninstall:
	rm -rf ~/.themes/$(BASE)-*/

