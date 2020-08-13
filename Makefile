SOURCE_DIR=/home/michael/prospectus
TEX_DIR=/home/michael/prospectus/tex


all:
	echo "Building pdf..."
	pandoc "$(SOURCE_DIR)/prospectus.md" \
	  -o "$(SOURCE_DIR)/output.pdf" \
	  -H "$(TEX_DIR)/preamble.tex" \
	  --pdf-engine=xelatex \
	  --template="$(TEX_DIR)/template.tex" \
	  --bibliography="$(TEX_DIR)/refs.bib" \
	  --csl "$(TEX_DIR)/nature.csl"

tex:
	pandoc "$(INPUTDIR)"/*.md \
	-o "$(OUTPUTDIR)/thesis.tex" \
	-H "preamble.tex" \
	--bibliography="" \
	-V fontsize=12pt \
	-V papersize=a4paper \
	-V documentclass=report \
	-N \
	--csl="$(STYLEDIR)/ref_format.csl" \
	--pdf-engine=xelatex
