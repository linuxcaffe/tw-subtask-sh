# tw-subtask-sh
A taskwarrior script to create and invoke subtasks, which are maintained as task annotations. 

A task can have any number of annotations, and using this script, any one of them could be a sub-task, as long as it starts with 
```
"[ ] " 
```
and something following the "[ ] " the description of the sub-task and any associated metadata, written as you would when you first create a task. A subtask can be created in two ways; using 'task annot", like;
```
$ tw 142 annot '[ ] Pick up letters at the Post office proj:admin pri:h +mail +car'
```
or (better) using subtw, as in;
```
$ subtw 142 Pick up letters at the Post office proj:admin pri:h +mail +car
```
Now task 142 has a(nother) subtask/annotation. It exists only as metadata of 142 until it is "invoked", with a command something like;
```
$ subtw 142
```
and then the next (in order of entry time-stamp) sub-task (annotation that starts with "[ ] ") of 142 is invoked ($ task add $WHATEVER_YOU_WROTE) and the "checkbox" is upgraded to "[o] ". Once a sub-task has been invoked, it becomes it's own, actual task, and a dependency of the original task. 

