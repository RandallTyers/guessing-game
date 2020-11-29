#TEXT=$(shell cat guessinggame.sh)

#LENGTH=$(shell echo ${TEXT} | wc -l)
LENGTH=$(shell cat guessinggame.sh | wc -l)
#CODE_LEN=$(shell echo ${TEXT} | grep -v "^#|^\s+$" | wc -l)
CODE_LEN=$(shell cat guessinggame.sh | egrep -v "^#|^\s+$" | wc -l)
#shell echo "$(LENGTH): $(CODE_LEN)"


all: README.md

README.md: guessinggame.sh
	echo "Guessing Game" > README.md
	echo "Make run at: $(shell date)" >> README.md
	echo "File has ${LENGTH} lines of which "\
	  "${CODE_LEN} are code." >> README.md

clean:
	rm README.md
