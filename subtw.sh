#!bin/bash
# create and invoke taskwarrior sub-tasks
#
# function: subtw_create

# function: subtw_invoke
## function: next_subtask
# task $ORIGIN_UUID add $*
# task $ORIGIN_UUID mod .. update checkbox somehow.. s/[ ]/[o]/
# task $ORIGIN_UUID mod dep:$SUB_TASK_UUID
