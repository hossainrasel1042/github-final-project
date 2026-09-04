#!/bin/bash
# simple-interest.sh
# A simple Bash calculator for computing Simple Interest.
# Formula: SI = (P * R * T) / 100

echo "===== Simple Interest Calculator ====="

read -p "Enter Principal Amount: " principal
read -p "Enter Rate of Interest (in %): " rate
read -p "Enter Time Period (in years): " time

# Basic numeric validation
re='^[0-9]+([.][0-9]+)?$'
if ! [[ $principal =~ $re && $rate =~ $re && $time =~ $re ]]; then
    echo "Error: Please enter valid positive numbers for all fields."
    exit 1
fi

simple_interest=$(echo "scale=2; ($principal * $rate * $time) / 100" | bc)
total_amount=$(echo "scale=2; $principal + $simple_interest" | bc)

echo "---------------------------------------"
echo "Principal Amount   : $principal"
echo "Rate of Interest   : $rate%"
echo "Time Period        : $time year(s)"
echo "Simple Interest     : $simple_interest"
echo "Total Amount        : $total_amount"
echo "---------------------------------------"
