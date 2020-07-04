pandoc ./*.md \
  -o "./output.pdf" \
  --pdf-engine=xelatex \
  --template="./tex/template.tex" \
  -H "./tex/preamble.tex" \
  -N                    \
  --verbose
