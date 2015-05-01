PACKAGE_NAME=myscripts
#DESTINS=
BINDIR=/usr/bin

install:
	install -d -m 0755 -o root -g root $(DESTDIR)/etc
	install -d -m 0755 -o root -g root $(DESTDIR)/etc/default
	install -d -m 0755 -o root -g root $(DESTDIR)/usr/sbin
	install -d -m 0755 -o root -g root $(DESTDIR)/usr/bin
	install -d -m 0755 -o root -g root $(DESTDIR)/usr/share/doc/myscripts
	install -d -m 0755 -o root -g root $(DESTDIR)/usr/share/myscripts
	install -d -m 0755 -o root -g root $(DESTDIR)/usr/share/myscripts/my-cyclo-epreuve/
	install -d -m 0755 -o root -g root $(DESTDIR)/usr/share/myscripts/styles/
	install -m 0664 -o root -g root etc/default/* $(DESTDIR)/etc/default
	install -m 0664 -o root -g root etc/*-* $(DESTDIR)/etc
	install -m 0664 -o root -g root usr/share/doc/myscripts/* $(DESTDIR)/usr/share/doc/myscripts
	install -m 0664 -o root -g root usr/share/myscripts/*.* $(DESTDIR)/usr/share/myscripts
	install -m 0644 -o root -g root usr/share/myscripts/styles/*.* $(DESTDIR)/usr/share/myscripts/styles
	install -m 0644 -o root -g root usr/share/myscripts/my-cyclo-epreuve/*.* $(DESTDIR)/usr/share/myscripts/my-cyclo-epreuve
	install -m 0755 -o root -g root usr/bin/* $(DESTDIR)/usr/bin
	install -m 0755 -o root -g root usr/sbin/* $(DESTDIR)/usr/sbin
	chmod +x $(DESTDIR)/etc/my-firewall
	chmod 600 $(DESTDIR)/etc/default/my-saveldap

clean:
	rm -f configure-stamp build-stamp 

distclean: clean
	rm -rf debian/$(PACKAGE_NAME)
	
