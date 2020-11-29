#LENGTH:=$(shell cat guessinggame.sh | wc -l)
#CODE_LEN:=$(shell egrep -v '^#|^\s*$' guessinggame.sh | wc -l)
CODE=guessinggame.sh

all: README.md

README.md: ${CODE}
	echo "Guessing Game" > README.md
	echo "Make run at: $(shell date)" >> README.md
	printf "File ${CODE} has " >> README.md
	printf $(shell cat guessinggame.sh | wc -l) >> README.md 
	printf " lines of which " >> README.md
	printf "$(egrep -v '^#|^\s*$' ${CODE} | wc -l)" >> README.md
	printf " are code.\n" >> README.md

clean:
	rm README.md
