all: html

.PHONY: html

html:
	tree -H . -L 3 --dirsfirst --filelimit 0 -o index.html
	find . -name "*.md" -exec pandoc --standalone --metadata title="AU" -o "{}.html" "{}" \;

clean:
	rm -f *.html **/*.html
