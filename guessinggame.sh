#!/usr/bin/env bash
# File: guessinggame.sh 
# Description: Continuously ask user to guess number of files in the current 
#	directory, until they guess the correct number. Inform user if their 
#	guess is too high or too low. Once the user guesses the correct number 
#	of files in the current directory they should be congratulated.

### Functions ###
# Check whether input is an integer.
function is_integer { 
    [[ $1 =~ ^-?[0-9]+$ ]] && return 0 || return 1
}

# Send warning message to std error that input is not an integer.
function warn_not_int {
    echo "WARNING: Expected an integer -- got \"$1\"." >&2
    return 1
}

### Main ###
# get number of files in current directory -- NB: assuming regular files.
#    (i.e. not directories, links etc.)
# WARNING: Fails if any filename contains a return character.
file_count=$(find . -type f -maxdepth 1 | wc -l)

while true
do
    # prompt for guess
    echo "Type how many files you guess are in the current directory, then hit 'Enter':"
    read guess
    
    # is guess correct
    if ! is_integer $guess
    then
        warn_not_int $guess

    elif [[ $guess -gt $file_count ]]
    then
        echo "Your guess was too high."
    
    elif [[ $guess -lt $file_count ]]
    then
        echo "Your guess was too low."
    
    else
        echo "Congratulations, you guessed correctly!"
        break
    
    fi
done
