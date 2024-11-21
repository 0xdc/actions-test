#!/usr/bin/env python

import os
import sys
import portage

p = portage.db[portage.root]["porttree"].dbapi

print( "::group::bestmatch-visible" )
bestmatch = p.xmatch("bestmatch-visible", sys.argv[1])
with open(os.environ['GITHUB_STEP_SUMMARY'], 'a') as summary:
    print(bestmatch)
    summary.write(f'found version {bestmatch}\n')
print( "::endgroup::" )
