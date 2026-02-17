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
	mkdir -p advising
	ln -s ../SKILL.md advising/
	ln -s ../references advising/
	zip -9 $@ advising/SKILL.md \
		advising/references/2023-24/*.md advising/references/2023-24/*.tsv \
		advising/references/2024-25/*.md advising/references/2024-25/*.tsv \
		advising/references/2025-26/*.md advising/references/2025-26/*.tsv \
		advising/references/2026-27/*.md advising/references/2026-27/*.tsv
	rm -rf advising


clean:
	rm -f *.html **/*.html skill.zip
