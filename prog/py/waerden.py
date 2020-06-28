#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import sys
import getopt

def waerden(j, k, n, opts):
    for d in range(1, n+1):
        for i in range(1, n+1):
            if i+(j-1)*d <= n:
                lits = [f"{x}" for x in range(i, i+(j-1)*d+1, d)]
                print(" ".join(lits))
    for d in range(1, n+1):
        for i in range(1, n+1):
            if i+(k-1)*d <= n:
                lits = [f"~{x}" for x in range(i, i+(k-1)*d+1, d)]
                print(" ".join(lits))

def main():
    o, args = getopt.getopt(sys.argv[1:], "h")
    opts = dict(o)
    if "-h" in opts or len(args) != 3:
        print("Usage: %s j k n" % sys.argv[0])
        return
    j = int(args[0])
    k = int(args[1])
    n = int(args[2])
    waerden(j, k, n, opts)
    
if __name__ == "__main__":
    main()
