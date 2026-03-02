all: html

.PHONY: html

html: au-advising.skill au-degree-audit.skill
	find . -name "*.md" -exec pandoc --standalone --metadata title="AU" -o "{}.html" "{}" \;
	tree -H . -L 3 --dirsfirst --filelimit 0 -o index.html

au-advising.zip:
	mkdir -p au-advising
	ln -s ../SKILL.md au-advising/
	ln -s ../references au-advising/
	zip -9 $@ au-advising/SKILL.md \
		au-advising/references/*.md \
		au-advising/references/2021-22/*.md au-advising/references/2021-22/*.tsv \
		au-advising/references/2022-23/*.md au-advising/references/2022-23/*.tsv \
		au-advising/references/2023-24/*.md au-advising/references/2023-24/*.tsv \
		au-advising/references/2024-25/*.md au-advising/references/2024-25/*.tsv \
		au-advising/references/2025-26/*.md au-advising/references/2025-26/*.tsv \
		au-advising/references/2026-27/*.md au-advising/references/2026-27/*.tsv
	rm -rf au-advising

au-degree-audit.zip:
	mkdir -p au-degree-audit
	ln -s ../SKILL.md au-degree-audit/
	ln -s ../references au-degree-audit/
	zip -9 $@ au-degree-audit/SKILL.md \
		au-degree-audit/references/*.md \
	au-degree-audit/references/2021-22/*.md \
	au-degree-audit/references/2022-23/*.md \
	au-degree-audit/references/2023-24/*.md
	rm -rf au-degree-audit

%.skill: %.zip
	cp $< $@

clean:
	rm -f *.html references/*/*.html *.zip *.skill
