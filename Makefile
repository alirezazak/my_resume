.PHONY: all

CC = xelatex
SRC_DIR = cv-sections
SRCS = $(shell find $(SRC_DIR) -name '*.tex')

all: $(foreach x, coverletter resume remove_dummy, $x.pdf)

resume.pdf: resume.tex $(SRCS)
	$(CC) -output-directory=. $<

coverletter.pdf: coverletter.tex $(SRCS)
	$(CC) -output-directory=. $<

remove_dummy.pdf:
	rm -rf *.aux
	rm -rf *.log
	rm -rf *.out
	rm -rf *.synctex.gz

clean:
	rm -rf ./*.pdf
