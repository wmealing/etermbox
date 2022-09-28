PREFIX = tmp/priv
BUILD  = tmp/obj

TERMBOX_PATH = termbox2
TERMBOX_BUILD = tmp/termbox_build
ERTS_INCLUDE_DIR = /usr/lib64/erlang/usr/include/

LDFLAGS += -fPIC -static
CFLAGS += -fPIC

NIF_CFLAGS += -I$(ERTS_INCLUDE_DIR)  

SOURCES = termbox_bindings.c 

all: $(PREFIX)/termbox_bindings.so
	@:

$(TERMBOX_BUILD)/src/libtermbox.%: $(TERMBOX_BUILD)
	cd $(TERMBOX_PATH) && CFLAGS="$(CFLAGS)"  make

$(PREFIX)/termbox_bindings.so: $(SOURCES) $(PREFIX) 
	mkdir -p tmp/termbox_build/
	$(CC) $(CFLAGS) $(NIF_CFLAGS) -I$(TERMBOX_PATH) $(SOURCES) -c -o $(TERMBOX_BUILD)/termbox_bindings.o -D TB_OPT_V1_COMPAT
	$(CC) $(CFLAGS) $(NIF_CFLAGS) -I$(TERMBOX_PATH) $(TERMBOX_BUILD)/termbox_bindings.o $(TERMBOX_PATH)/libtermbox.a -shared -o $(TERMBOX_BUILD)/termbox_bindings.so 

$(PREFIX) $(TERMBOX_BUILD):
	mkdir -p $@

clean:
	rm -rf $(TERMBOX_BUILD) $(PREFIX)/termbox_bindings.so

.PHONY: list
list:
	@LC_ALL=C $(MAKE) -pRrq -f $(lastword $(MAKEFILE_LIST)) : 2>/dev/null | awk -v RS= -F: '/(^|\n)# Files(\n|$$)/,/(^|\n)# Finished Make data base/ {if ($$1 !~ "^[#.]") {print $$1}}' | sort | egrep -v -e '^[^[:alnum:]]' -e '^$@$$'

