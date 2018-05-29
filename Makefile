PREFIX=/usr/share/vim/vim74
DESTDIR=

install:
	@mkdir -p $(DESTDIR)$(PREFIX)/syntax/
	@mkdir -p $(DESTDIR)$(PREFIX)/ftdetect/
	@mkdir -p $(DESTDIR)$(PREFIX)/ftplugin/
	cp -a syntax/ ftdetect/ ftplugin/ $(DESTDIR)$(PREFIX)
