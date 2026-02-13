all: html

.PHONY: html

html:
	find . -name "*.md" -exec pandoc --standalone --metadata title="AU" -o "{}.html" "{}" \;
	tree -H . -L 3 --dirsfirst --filelimit 0 -o index.html

clean:
	rm -f *.html **/*.html
