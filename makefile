CODE:=guessinggame.sh

all: README.md

README.md: ${CODE}
	# building README.md file
	@printf "# Guessing Game\n\n" > README.md
	@printf "Make run at: %s\n\n" "$(shell date)" >> README.md
	@printf "File ${CODE} has " >> README.md
	@printf $(shell cat ${CODE} | wc -l) >> README.md 
	@printf " lines of which " >> README.md
	# uses grep to count line that are neither comments nor blank 
	@printf "%s" "$(shell egrep -cv -e '^\s*#' -e '^\s*$$' ${CODE})" >> README.md
	@printf " are code.\n" >> README.md

clean:
	rm README.md
