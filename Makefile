SRCS=disasm.c disasm_op.c genasm.c io.c list.c os9calls.c rdump.c	\
	roflib.c util.c
OBJS=$(SRCS:c=o)
DEPS=$(SRCS:c=d)
TGTS=kdisasm

all: $(TGTS)

%.d: %.c
	gcc -MM $< >$@

include $(DEPS)

kdisasm: $(OBJS)
	$(CC) $(LDFLAGS) -o $@ $^

.PHONY: all clean distclean install

clean:
	rm -f $(OBJS) $(DEPS) *~ *#

distclean: clean
	rm -f $(TGTS)

install: $(TGTS)
	cp $(TGTS) $(BIN)
