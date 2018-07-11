uml2png:
	plantuml -tpng src/*.puml -o ../build/

uml2svg:
	plantuml -tsvg src/*.puml -o ../build/

clean:
	rm -r build
