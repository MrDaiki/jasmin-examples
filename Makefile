all : levenshtein

levenshtein: levenshtein_compile
	gcc -shared -o ./levenshtein/lev.so ./build/levenshtein/lev.S

levenshtein_compile: build
	mkdir -p build/levenshtein ;
	jasminc -pasm ./levenshtein/levenshtein.jazz > build/levenshtein/lev.S;

build : 
	mkdir -p build

clean:
	rm -rf build
	find . -name "*.so" -exec rm {} \;