#!/bin/bash
# A script to execute Degree planner
#Julia Buniak
read -p "Enter your name: " name
echo
read -p "Are you interested in getting Computer Science degree from Sierra College? Please reply Y or N > " reply
echo
case $reply in
        Y|y) echo "Great choice! Let's get started!";;
        N|n) echo "We are sorry that you don’t want to become next Larry Page and Sergey Brin!"
                echo "If you change your mind, we will be here for you!"
                exit ;;
        *) echo "Invalid choice. Good bye!"
                exit;;
esac
echo

echo "$name, let's set your path towards a degree in Computer Science at Sierra College!"
echo
echo "Tell us what classes you have already taken!"
echo


./part1.py
./part2.pl
./part3.sh
