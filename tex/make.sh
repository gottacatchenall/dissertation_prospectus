pandoc ./tex/prospectus.md \
  -o "./output.pdf" \
  --pdf-engine=xelatex \
  --biblatex \
  --bibliography="./tex/renderer/refs.bib" \
  --template="./tex/renderer/template.tex" \
  --reference-links \
  -H "./tex/renderer/preamble.tex" \
  -N                    \
  --verbose
