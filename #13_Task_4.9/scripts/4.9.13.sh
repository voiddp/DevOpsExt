#!/bin/bash
#Subtask 4.9.13
echo "============"
echo "Task 4.9.13"
echo "Download with wget to sdout, process stdin with lynx"
echo
wget -qO- ua.fm | lynx -stdin -dump
