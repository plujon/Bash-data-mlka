#!/bin/bash
# Author: Jonathan Duff <jonathan@dufffamily.org>

source global-vars.bash

# http://tldp.org/LDP/abs/html/functions.html

PrintError ()
{
    if [ -n "$1" ]; then
        echo -e "ERROR:\t" $1
    else
        echo
    fi
}

PrintInfo ()
{
    if [ -n "$1" ]; then
        echo -e "INFO:\t" $1
    else
        echo
    fi
}

SafeMove ()
{
    SOURCE_FILE="$1"
    DESTINATION_FILE="$2"

    if [ -n "$SOURCE_FILE" ] && [ -n "$DESTINATION_FILE" ]; then
        # if not exists then move
        if [ -e "$DESTINATION_FILE" ]; then
            return 1
        else
            mv "$SOURCE_FILE" "$DESTINATION_FILE"
            return 0
        fi
    else
        return 1
    fi
}

DisplayTable ()
{
    # Make sure the function arguments are set
    if [ -n "$1" ] && [ -n "$2" ] && [ -n "$3" ] && [ -n "$4" ]; then
        declare -a COLUMN1=("${!1}")
        declare -a COLUMN2=("${!2}")
        declare -a COLUMN3=("${!3}")
        declare -a COLUMN4=("${!4}")

        printf '\t'
        printf "   "
        printf $HEADER_COLUMN1
        printf '\t'
        printf "   "
        printf $HEADER_COLUMN2
        printf '\t'
        printf "   "
        printf $HEADER_COLUMN3
        printf '\t'
        printf "   "
        printf $HEADER_COLUMN4
        echo

        printf '\t'
        printf "  "
        printf "+"
        count=61
        while (( count > 0 )); do
            printf "-"
            (( count = count - 1))
        done
        printf "+"
        echo

        ARRAY_SIZE=${#COLUMN1[*]}
        for (( CURR_ROW = 0; CURR_ROW < ARRAY_SIZE; CURR_ROW++ )); do
            printf "row $CURR_ROW:"
            if (( CURR_ROW < 100 )); then
                printf '\t'
            fi
            printf "  "
            printf "|"
            printf ${COLUMN1[$CURR_ROW]}
            printf '\t'
            printf '\t'
            printf "|"
            printf ${COLUMN2[$CURR_ROW]}
            printf '\t'
            printf '\t'
            printf "|"
            printf ${COLUMN3[$CURR_ROW]}
            printf '\t'
            printf '\t'
            printf "|"
            printf ${COLUMN4[$CURR_ROW]}
            printf '\t'
            printf '\t'
            printf "|"
            echo
        done

        printf '\t'
        printf "  "
        printf "+"
        count=61
        while (( count > 0 )); do
            printf "-"
            (( count = count - 1))
        done
        printf "+"
        echo
    fi
}
