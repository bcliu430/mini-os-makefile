#!/usr/bin/env python
## compare two dumped memory address, return different memory addresses

with open('dump1.log', 'r') as f1, \
     open('dump2.log', 'r') as f2, \
     open('diff.csv', 'a') as outfile:
    outfile.write('{:s},{:4s},{:4s}\n'.format('address','dump1','dump2'))
    for line1, line2 in zip(f1, f2):
        if line1 != line2:
            line1 = line1.split()
            line2 = line2.split()
            for ii in range(1,len(line1),2):
                if(line1[ii] != line2[ii]):
                    outfile.write('[0x{:08x}],{:4s},{:4s}\n'.format(
                            int(line1[0],16)+ii, line1[ii], line2[ii] ))
