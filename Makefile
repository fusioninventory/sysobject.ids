
TYPES = NETWORKING|PRINTER|COMPUTER|STORAGE|VIDEO|PHONE|KVM|POWER

test: sysobject.ids
	@perl -ne '\
	  chomp;                                                                    \
	  next if (length == 0 || /^\s*\#/);                                        \
	  die "Found space after oid: $$_\n" if /^[0-9.]+( |\xc2\xa0)\t/ ;          \
	  die "Bad oid: $$_\n" unless /^[0-9.]+\t/ ;                                \
	  die "Found ending space: $$_\n" if /( |\xc2\xa0)+$$/ ;                    \
	  # 2 fields minimum                                                        \
	  die "Not enough fields: $$_\n" unless /^[0-9.]+\t[^\t]+/;                 \
	  die "Found space before manufacturer: $$_\n" if /^[0-9.]+\t( |\xc2\xa0)+[^\t]/ ; \
	  die "Found space after manufacturer: $$_\n" if /^[0-9.]+\t[^\t]( |\xc2\xa0)+\t/ ; \
	  next if /^[0-9.]+\t[^\t]+$$/;                                             \
	  # 3 fields                                                                \
	  die "Bad type: $$_\n" unless /^[0-9.]+\t[^\t]+\t($(TYPES))\t?/;           \
	  next if /^[0-9.]+\t[^\t]+\t($(TYPES))$$/; \
	  die "Found space before type: $$_\n" if /^[0-9.]+\t[^\t]\t( |\xc2\xa0)+($(TYPES))/ ; \
	  die "Found space after type: $$_\n" if /^[0-9.]+\t[^\t]\t($(TYPES))( |\xc2\xa0)/ ; \
	  # 4 fields                                                                \
	  die "Found space before model: $$_\n" if /^[0-9.]+\t[^\t]\t($(TYPES))\t( |\xc2\xa0)+/ ; \
	  die "Found space after model: $$_\n" if /^[0-9.]+\t[^\t]\t($(TYPES))\t[^\t]+( |\xc2\xa0)+\t/ ; \
	  next if /^[0-9.]+\t[^\t]+\t($(TYPES))\t[^\t]+$$/;                         \
	  # 5 fields (but accept empty model)                                       \
	  next if /^[0-9.]+\t[^\t]+\t($(TYPES))\t[^\t]*\t[^\t]+$$/;                 \
	  die "Too much fields: $$_\n";'                                            \
	  sysobject.ids
