#LENGTH:=$(shell cat guessinggame.sh | wc -l)
#CODE_LEN:=$(shell egrep -v '^#|^\s*$' guessinggame.sh | wc -l)
CODE='guessinggame.sh'

all: README.md

README.md: guessinggame.sh
	echo "Guessing Game" > README.md
	echo "Make run at: $(shell date)" >> README.md
	echo -n "File ${CODE} has " >> README.md
	echo -n $(shell cat guessinggame.sh | wc -l) >> README.md 
	echo -n " lines of which " >> README.md
	echo -n $(shell egrep -v '^#|^\s*$' guessinggame.sh | wc -l) >> README.md
	echo " are code." >> README.md

clean:
	rm README.md
