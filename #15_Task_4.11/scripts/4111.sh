#!/bin/bash
##Task 4.11.1
echo
echo ===========
echo "Task 4.11.1. Files bigger than 20Mb in /usr:"
find /usr -type f -size +20M
