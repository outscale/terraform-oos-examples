#!/bin/bash
set -e
set -x
docker run --rm --volume $(pwd):/data fsfe/reuse:0.11.1 lint
