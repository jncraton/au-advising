all: html skill.zip

.PHONY: html

catalogs:
	./stripcatalog references/2022-23/undergraduate-catalog.md
	./stripcatalog references/2023-24/undergraduate-catalog.md
	./stripcatalog references/2024-25/undergraduate-catalog.md
	./stripcatalog references/2025-26/undergraduate-catalog.md

html: catalogs
	find . -name "*.md" -exec pandoc --standalone --metadata title="AU" -o "{}.html" "{}" \;
	tree -H . -L 3 --dirsfirst --filelimit 0 -o index.html

skill.zip:
	zip -9 $@ SKILL.md references/2023-24/*.md references/2023-24/*.tsv \
                     references/2024-25/*.md references/2024-25/*.tsv \
                     references/2025-26/*.md references/2025-26/*.tsv \
                     references/2026-27/*.md references/2026-27/*.tsv


clean:
	rm -f *.html **/*.html skill.zip
