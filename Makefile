all: results.txt

results.txt:
	./run-all-benchmarks.sh

.PHONY: results.txt
