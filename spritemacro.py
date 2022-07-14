import sys
import glob

inglob = sys.argv[1]
count = 0

macrolab = "sit_{}:"
macro = '        frame_gen {} "{}"' 

fulltext = " dc.w         $6d40+8*{} \n\
  dc.w         $c300 \n\
  incbin       \"{}\" \n\
  dc.w         $0000,0000 \n\
\n\
  CNOP         0,2\n"

framelists = []

spriteindex = 6
frames = -1
for path in glob.iglob(inglob):
    if (spriteindex > 5):
        print("\n")
        framelists.append([])
        frames += 1
        spriteindex = 0

    print(macrolab.format(path[-8:-4]))
    print(fulltext.format(path[-5], path))
    
    framelists[frames].append(macrolab.format(path[-8:-4]).replace(":", ""))

    spriteindex += 1

for i, frame in enumerate(framelists):
    print("sit_frame{}:".format(i))
    for item in frame:
        print("        dc.l     {}".format(item))

    print("        dc.l     $fffffffe")
    print("        CNOP     0,4\n")
