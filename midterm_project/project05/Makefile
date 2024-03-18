
default: comments.html
REXE = Rscript --no-save --no-restore --no-init-file

%.html: %.Rmd
	PATH=/usr/lib/rstudio/bin/pandoc:$$PATH \
	$(REXE) -e "rmarkdown::render(\"$*.Rmd\",output_format=\"html_document\")"

%.html: %.md
	PATH=/usr/lib/rstudio/bin/pandoc:$$PATH \
	$(REXE) -e "rmarkdown::render(\"$*.md\",output_format=\"html_document\")"



