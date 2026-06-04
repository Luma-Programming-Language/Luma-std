#!/usr/bin/env bash
set -euo pipefail

test="${1:-mem_test.lx}"
libs=(std/*.lx)
cmd="luma tests/$test -l ${libs[*]} -doc"

echo "$cmd"
echo
eval "$cmd"
