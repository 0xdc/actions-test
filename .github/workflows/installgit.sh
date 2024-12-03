#!/bin/bash

echo ::group::getuto
getuto
echo ::endgroup::
echo ::group::install git
emerge --update --quiet --getbinpkg dev-vcs/git "$@"
echo ::endgroup::
