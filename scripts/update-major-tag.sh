#!/bin/sh
set -eu

tag=$1
if ! printf '%s\n' "$tag" | grep -Eq '^v(0|[1-9][0-9]*)\.(0|[1-9][0-9]*)\.(0|[1-9][0-9]*)$'; then
    printf 'Expected a stable release tag such as v1.2.3, got %s\n' "$tag" >&2
    exit 1
fi

alias_ref="refs/tags/${tag%%.*}"
current=$(git ls-remote origin "$alias_ref" | cut -f1)
git push --force-with-lease="$alias_ref:$current" origin "HEAD:$alias_ref"
