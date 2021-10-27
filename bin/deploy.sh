#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd $DIR/../../ityreh.github.io
mkdocs gh-deploy --config-file ../mkdocs/mkdocs.yml --remote-branch main
