echo "Building pdf..."
mkdir -p tex_tmp
cp refs.bib tex_tmp/
cp prospectus.tex tex_tmp/
cd tex_tmp
ls
# dont know
pdflatex prospectus.tex && bibtex prospectus.aux && pdflatex prospectus.tex && pdflatex prospectus.tex
cd ..
mv tex_tmp/prospectus.pdf ./
rm -rf tex_tmp

