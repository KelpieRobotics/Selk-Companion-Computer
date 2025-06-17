#!/usr/bin/env bash

REPO_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/../.." && pwd )"

$REPO_DIR/modules/selk_rc_receiver/build/main
