pandoc ./*.md \
  -o "./output.pdf" \
  --pdf-engine=xelatex \
  --biblatex \
  --bibliography="./tex/refs.bib" \
  --template="./tex/template.tex" \
  --reference-links \
  -H "./tex/preamble.tex" \
 -N                    \
  --verbose
