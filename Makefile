PREFIX=/usr/share/vim/vim74
DESTDIR=

install:
	@mkdir -p $(DESTDIR)$(PREFIX)/syntax/
	cp syntax/race.vim $(DESTDIR)$(PREFIX)/syntax/
	@mkdir -p $(DESTDIR)$(PREFIX)/ftplugin/
	cp ftplugin/race/race_cli.vim $(DESTDIR)$(PREFIX)/ftplugin/
	@mkdir -p $(DESTDIR)$(PREFIX)/ftdetect/
	cp ftdetect/race.vim $(DESTDIR)$(PREFIX)/ftdetect/
