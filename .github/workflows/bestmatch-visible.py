#!/usr/bin/env python

import sys
import portage

p = portage.db[portage.root]["porttree"].dbapi

print( p.xmatch("bestmatch-visible", sys.argv[0]) )
