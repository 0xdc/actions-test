#!/usr/bin/env python

import os
import sys
import portage

p = portage.db[portage.root]["porttree"].dbapi
is_github = 'GITHUB_STEP_SUMMARY' in os.environ

if is_github: sys.stderr.write(f"::group::{sys.argv[1]}\n")

bestmatch = p.xmatch("bestmatch-visible", sys.argv[1])
print(bestmatch)

if is_github:
    with open(os.environ['GITHUB_STEP_SUMMARY'], 'a') as summary:
        summary.write(f'- found version {bestmatch}\n')
    sys.stderr.write("::endgroup::\n")
