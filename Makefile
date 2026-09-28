app: app.c start.c sim.c sim.h
	clang app.c start.c sim.c -lSDL2 -o $@

app-opt.ll: app.c
	clang -emit-llvm -S $^ -o $@ -O2

run: app
	./app

ir: app-opt.ll

.PHONY: run ir