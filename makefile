all: html

.PHONY: html

html:
	find . -name "*.md" -exec pandoc --standalone --metadata title="AU" -o "{}.html" "{}" \;

clean:
	rm -f *.html **/*.html
