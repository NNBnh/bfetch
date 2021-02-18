PREFIX ?= /usr/local
MANDIR ?= $(PREFIX)/share/man

BIN    ?= bfetch


install:
	@mkdir -p $(PREFIX)/bin
	@mkdir -p $(MANDIR)/man1

	@cp -p bin/$(BIN)   $(PREFIX)/bin/
	@cp -p man/$(BIN).1 $(MANDIR)/man1/

	@chmod 755 $(PREFIX)/bin/$(BIN)


uninstall:
	@rm -rf $(PREFIX)/bin/$(BIN)
	@rm -rf $(MANDIR)/man1/$(BIN).1*
