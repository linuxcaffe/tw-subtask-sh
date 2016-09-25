# tw-subtask-sh
A taskwarrior script to create and invoke subtasks, which are maintained as task annotations. 

A task can have any number of annotations, and using this script, any one of them could be a sub-task, as long as it starts with 
```
"[ ] " 
```
What follows the "[ ] " is the description of the sub-task and any associated metadata, written as you would when you first create a task, like
```
[ ] Pick up the mail proj:admin +car
```
because, when the sub-task is "invoked", with something like;
```
$ subtw 142
```
and the next (in order of entry time-stamp) sub-task (annotation that starts with "[ ] ") is invoked (task add $WHATEVER_YOU_WROTE, and the "checkbox" is upgraded to "[o] "). Once a sub-task has been invoked, it is added, and becomes it's own, 

If subtw is called with anything trailing a (valid) ID(s), then it creates a new sub-task/ annotation (and when used this way does not require a leading "[ ] ") so that a new sub-task would be created with;
```
subtw 142 'write, address and mail ThankYou cards' proj:party +mail
