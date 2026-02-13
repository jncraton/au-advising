all: html

.PHONY: html

catalogs:
	./stripcatalog 2023-24/ug-catalog-23-24.md > 2023-24/catalog.md

html: catalogs
	find . -name "*.md" -exec pandoc --standalone --metadata title="AU" -o "{}.html" "{}" \;
	tree -H . -L 3 --dirsfirst --filelimit 0 -o index.html

clean:
	rm -f *.html **/*.html
