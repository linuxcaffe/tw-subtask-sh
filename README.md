# tw-subtask-sh

A taskwarrior script to create and invoke subtasks, which are maintained as task annotations.

Question: how is a sub-task different than a dependent task? 
Answer: A sub-task is not yet a "real" task, it is one of N annotations of an actual task, a dependent task is a "live" task linked to it's parent with a dep:uuid. 

Question: how is a subtask different from any other annotation?
Answer: it starts with

```
"[ ] description" 
```

The description of a sub-task can also contain any associated metadata, written as you would when you first create a task. 

### Creating a subtask

A subtask can be created in two ways; 1) as a regular annotation using 'task annot", like;

```
$ tw 142 annot '[ ] Pick up letters at the Post office proj:admin pri:h +mail +car'
```

or (better) using subtw, as in;

```
$ subtw 142 Pick up letters at the Post office proj:admin pri:h +mail +car
```

Now task 142 has a(nother) subtask/annotation. It exists only as metadata of 142 until it is "invoked".

### Invoking a subtask

Subtasks are transformed from annotations to first-class-tasks with a command something like;

```
$ subtw 142
```

Note the trailing task ID, and no other parameters.

Called with an ID and no other params, the next (in order of entry time-stamp) sub-task (annotation that starts with "[ ] ") of 142 is invoked ($ task add $WHATEVER_YOU_WROTE) and the "checkbox" is upgraded to "[o] ". Once a sub-task has been invoked, it becomes it's own, actual task, and a dependency of the original task. 

### Listing subtasks

If the second argument of subtw is NOT an ID, then the script performs a search for matching subtasks.

```
$ subtw office
```

would search all sub-tasks for "office" and list matches. Note that once a subtask has been invoked, the leading [  ] is changed to [o] so it no longer matches a 'subtw searchterm'.

If subtw is called with NO trailing arguments, it lists all [  ] sub-tasks.


