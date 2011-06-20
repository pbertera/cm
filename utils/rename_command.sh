#!/bin/bash

set -e

[ -z $1 ] && ( echo "ERROR: command name is required"; exit -1)
[ -z $2 ] && ( echo "ERROR: command destination is required"; exit -1)

[ -e $1 ] || (echo "ERROR: $1 not exist"; exit -1)

# name  _name_complete  _name_help  _name_nocomplete  _name_priority  _name_syntax
mv $1 $2
mv _$1_complete _$2_complete
mv _$1_help _$2_help
mv _$1_priority _$2_priority
mv _$1_syntax _$2_syntax
[ -e _$1_nocomplete ] && mv _$1_nocomplete _$2_nocomplete
