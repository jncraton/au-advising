all: html

.PHONY: html

catalogs:
	./stripcatalog references/2022-23/2022-22-undergrad-catalog.md > references/2022-23/catalog.md
	./stripcatalog references/2023-24/ug-catalog-23-24.md > references/2023-24/catalog.md

html: catalogs
	find . -name "*.md" -exec pandoc --standalone --metadata title="AU" -o "{}.html" "{}" \;
	tree -H . -L 3 --dirsfirst --filelimit 0 -o index.html

clean:
	rm -f *.html **/*.html
