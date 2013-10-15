#!/bin/bash

# Farbod Samsamipour
# 88521068

declare AWK="/usr/bin/awk"
declare FREE="/usr/bin/free"
declare GREP="/bin/grep"
declare HEAD="/usr/bin/head"
declare PS="/bin/ps"
declare SORT="/usr/bin/sort"

N1=100
total_mem=`$FREE -m | $GREP Mem | $AWK '{print$2}'`
mem_usage_percent=`$PS aux | $SORT -nr -k 4 | $HEAD -1 | $AWK '{print$4}'`
PID=`$PS aux | $SORT -nr -k 4 | $HEAD -1 | $AWK '{print$2}'`
name=`$PS -p $PID -o comm=`

echo
echo "Total memory[MB]:"
echo $total_mem
echo
echo "PID of top memory usage:"
echo $PID
echo
echo "Name of PID:"
echo $name
echo
echo "Percentage of top memory usage:"
echo "${mem_usage_percent}%"
echo
echo "Top memory usage[MB]:"
echo "scale=3; $mem_usage_percent / $N1 * $total_mem" | bc
echo
