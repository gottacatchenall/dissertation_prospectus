SOURCE_DIR=/home/michael/prospectus
TEX_DIR=/home/michael/prospectus/tex


all:
	echo "Building pdf..."
	xelatex prospectus.tex -output-directory=./tex/
