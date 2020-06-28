#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import sys
import getopt

def langford(n, opts):
    cols1 = [f"d{i}" for i in range(1, n+1)]
    cols2 = [f"s{j}" for j in range(1, 2*n+1)]
    print(" ".join(cols1 + cols2))
    for i in range(1, n+1):
        for j in range(1, 2*n+1):
            k = i+j+1
            if k <= 2*n and (i < n or 2*j <= n):
                print(f"d{i} s{j} s{k}")

def main():
    o, args = getopt.getopt(sys.argv[1:], "h")
    opts = dict(o)
    if "-h" in opts or len(args) != 1:
        print("Usage: %s n" % sys.argv[0])
        return
    n = int(args[0])
    langford(n, opts)
    
if __name__ == "__main__":
    main()
