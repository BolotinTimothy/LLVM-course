app: app.c start.c sim.c sim.h
	clang app.c start.c sim.c -lSDL2 -o $@

app-opt.ll: app.c
	clang -emit-llvm -S $^ -o $@ -O2

app-opt-with-usage.ll: app.c libPass.so
	clang -emit-llvm -S app.c -fpass-plugin=./libPass.so -o $@ -O2

libPass.so: pass.cpp
	clang++ pass.cpp -fPIC -shared -I"$(shell llvm-config --includedir)" -o $@

app-with-usage: libPass.so app.c start.c sim.c sim.h log.c
	clang app.c -c -fpass-plugin=./libPass.so -O2 -o app_with_usage.o
	clang start.c sim.c app_with_usage.o log.c -lSDL2 -O2 -o $@

run-with-usage: app-with-usage
	./app-with-usage > log.txt

run: app
	./app

analyze:
	python3 analyzer.py log.txt stats-$(len).csv $(len)

.PHONY: run run-with-usage