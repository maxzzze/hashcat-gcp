#!/bin/bash

if [ $# -ne 1 ]
  then
    echo "Usage ./rule_run.sh HASH_TYPE. "
        exit 1
fi

HASH_TYPE=$1

echo "Input hashed password file path to crack:"

echo $(ls)

read input_file
echo $input_file

if [ -e $input_file ];
    then
        sudo hashcat -m $HASH_TYPE -o cracked_rule.txt -r Hob0Rules/hob064.rule $input_file rockyou.txt
    else
        echo "$input_file doesnt exist!"
        exit 1
fi