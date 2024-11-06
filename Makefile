all : levenshtein quicksort


quicksort : quicksort_compile
	gcc -shared -o ./build/quicksort/quicksort.so ./build/quicksort/quicksort.S

quicksort_compile: build
	mkdir -p build/quicksort ;
	jasminc -pasm ./quicksort/quicksort.jazz > build/quicksort/quicksort.S;
levenshtein: levenshtein_compile
	gcc -shared -o ./build//levenshtein/levenshtein.so ./build/levenshtein/levenshtein.S

levenshtein_compile: build
	mkdir -p build/levenshtein ;
	jasminc -pasm ./levenshtein/levenshtein.jazz > build/levenshtein/levenshtein.S;

build : 
	mkdir -p build

clean:
	rm -rf build
	find . -name "*.so" -exec rm {} \;