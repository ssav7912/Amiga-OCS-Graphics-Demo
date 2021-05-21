import sys
import glob


inglob = sys.argv[1]
out = sys.argv[2]
count = 0 
print(inglob)
for path in glob.glob(inglob):
    out =  sys.argv[2]
    out += "_{}.spr".format(count)
    print(path)
    with open (path, 'rb') as inputfile, open(out, 'wb') as outfile:
        offset = 10 #0a
        inputfile.seek(10)
        start = inputfile.read(1)
        print(start)
        inputfile.seek(int(start.hex(), base=16))
        data = inputfile.read()
        print(out,'\n')
        outfile.write(data)

    count += 1



