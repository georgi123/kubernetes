#!/bin/bash
# Bash Menu Script Example

PS3='Please enter your choice: '
options=("complete -W '-eu -us -cl -kls -kl -ns -nl -l -jae -jau -cpe -cpu -s -lo -h' jj" "complete -W '$(cat /mnt/c/Users/georgi.dimi/Downloads/scripts/eunodes)' jj -l" "complete -W '$(cat /mnt/c/Users/georgi.dimi/Downloads/scripts/usnodes)' jj -l" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Option 1")
            echo "you chose choice 1"
            ;;
        "Option 2")
            echo "you chose choice 2"
            ;;
        "Option 3")
            echo "you chose choice $REPLY which is $opt"
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
