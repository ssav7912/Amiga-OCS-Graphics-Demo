#!/bin/bash
rm copper
rm ../amigahd/copper
./vasmm68k_mot -kick1hunks -maxerrors=0 -Fhunkexe -o copper -nosym copper.asm
cp copper ../amigahd/copper


#-kick1hunks
#-Fhunk
