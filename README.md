# SMUDGE
## (The Many Faces Of)

This is a repository for a small graphics demo I wrote for an Amiga 500 OCS computer. A video of the demo is available on youtube at this link: https://www.youtube.com/watch?v=IKdTVNEWfDE

I wrote this as a side-project to explore assembly language and the hardware of the Amiga computer. It ended up turning into a year-long project, and I learned a lot over the course of the development. I was rather pleased by the architectural design of this computer, it has such an intelligent way of doing things that is quite forgiving to experiments and general poking. 

### Building
This program is intended to be assembed with the `vasm` assembler by Dr Volker Barthelmann. The included `buildcop.sh` script will invoke vasm with the appropriate assembler flags, placing a binary file named `copper` in the current directory. 

Note that for my own purposes this also copies the binary to a `../amigahd/` directory in the parent folder, to automatically update a virtual hard disk mapped in to an emulator for development iteration. Remove this from the script if you have no need of it.

If you want to load this onto hardware you will need to generate icon files for the binary, as the Workbench shell consumes too much memory to execute from there.

### Running
This has been tested on an Amiga OCS with 1MB of memory, running on Workbench 1.2 with Kickstart 1.3.

The binary is 404KB, which just barely fits into memory on a 1MB Amiga. Running the program on real hardware required me to load the binary onto a floppy disk and execute it directly off the disk. This is probably not great for your floppy. Since it's such a large blob, you will also likely need a totally fresh-from-boot Workbench environment to have enough defragmented memory to execute (and then only once). 

You could also try running it off a hard drive, but I have not tried this.

Pressing any key or clicking the left mouse button will cause the program to exit. 

### The Source
The meat is in `copper.asm`. 

Include files have a `.i` suffix. These contain data structures for the various graphics assets used.

Bitplanes are in ILBM format, with either the `.raw` or `.iff` suffix.

sprites are formatted in the expected Blitter format, with a `.spr` suffix. 

You will find a few hacked together scripts around the place I wrote to automate certain tedious tasks. I have documented these as best I can in comments.