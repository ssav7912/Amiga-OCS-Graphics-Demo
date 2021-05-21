#!/bin/bash
rm ham
rm ../amigahd/ham
./vasmm68k_mot -kick1hunks -maxerrors=0 -Fhunkexe -o ham -nosym ham.asm
cp ham ../amigahd/ham


#-kick1hunks
#-Fhunk
