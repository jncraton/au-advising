all: html

.PHONY: html

catalogs:
	./stripcatalog references/2022-23/undergraduate-catalog.md
	./stripcatalog references/2023-24/undergraduate-catalog.md
	./stripcatalog references/2024-25/undergraduate-catalog.md
	./stripcatalog references/2025-26/undergraduate-catalog.md

html: skill.zip
	find . -name "*.md" -exec pandoc --standalone --metadata title="AU" -o "{}.html" "{}" \;
	tree -H . -L 3 --dirsfirst --filelimit 0 -o index.html

skill.zip:
	mkdir -p au-advising
	ln -s ../SKILL.md au-advising/
	ln -s ../references au-advising/
	zip -9 $@ au-advising/SKILL.md \
		au-advising/references/2023-24/*.md au-advising/references/2023-24/*.tsv \
		au-advising/references/2024-25/*.md au-advising/references/2024-25/*.tsv \
		au-advising/references/2025-26/*.md au-advising/references/2025-26/*.tsv \
		au-advising/references/2026-27/*.md au-advising/references/2026-27/*.tsv
	rm -rf au-advising


clean:
	rm -f *.html **/*.html skill.zip
