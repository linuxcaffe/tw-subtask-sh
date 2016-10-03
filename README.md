# tw-subtask-sh

*A taskwarrior script to create, list and invoke subtasks, which are maintained as task annotations.*

STATUS: pre-alpha

```
Usage: subtw [-a] [-l|-L] [IDs] [filter] [command]
```
Using the subtw command allows the user to pack any number of subtasks into a single task. For example, the task "clean the garage" could have, as annotations;
```
[  ] stack the wood
[  ] put away tools
[  ] sweep the floor
[  ] take out garbage
```
etc, in a specific order, and until you decide to start cleaning the garage, none of these subtasks clutter up your task list. When you actually start the main task, those subtasks can be be upgraded (invoked) to become proper tasks, with attributes, that can made active, and be timed and will show up in your completion stats. It's a way of bundling all of the steps required of a more complex task, and keeping them out of the way until the main task is started.

Question: how is a sub-task different than a dependent task? 
Answer: A sub-task is not yet a "real" task, it is one of N annotations of an actual task, a dependent task is a regular task linked to it's parent with a dep:uuid. 

Question: how is a subtask different from any other annotation?
Answer: it starts with

```
"[ ] description" 
```

A subtask can also contain any associated metadata, written as you would when you first create a task.

### Creating a subtask

A subtask can be created in two ways; as a regular annotation using 'task annot", like;

```
$ tw 142 annot '[ ] Pick up letters at the Post office proj:admin pri:h +mail +car'
```

or (better) using subtw with the -c flag, as in;

```
$ subtw -c 142 Pick up letters at the Post office proj:admin pri:h +mail +car
```

then task 142 has a(nother) subtask/annotation. It exists only as metadata of 142 until it is "invoked".

### Listing subtasks
The -l flag is used to list matching subtasks.
```
$ subtw -l <filter>
```
By default, matching sub-tasks are listed in in timestamp-order, which is also the order in which they were enterred. To override this, and list in (alpha)numeric order (eg, if you numbered your steps) use the -n flag
```
$ subtw -ln <filter>
```
To also show subtasks that have already been invoked, add the -a flag
```
$ subtw -la <filter>
```
If subtw is called with NO arguments, or with the -h flag, it displays help text.

### Invoking a subtask

Subtasks are transformed from annotations to first-class-tasks with a command something like;
```
$ subtw 142
```
When a subtask is invoked;
* it is added as a new task with 'task add $SUBTASK_TEXT' verbatim, and gets it's own uuid.
* the new task is made a dependency of the main task.
* it inherits any project or tag attributes of the main task, merged with any subtask metadata.
* the annotation's leading "[ ] " is changed to "[o] ". (later changed to "[S] ", "[X] " or "[D] ")

Called with an ID and no other params, the next (in order of entry time-stamp) sub-task (annotation that starts with "[ ] ") of 142 is invoked ($ task add $WHATEVER_YOU_WROTE). To override the timestamp order, use the -a flag (alpha-numeric). Once a sub-task has been invoked, it becomes it's own, actual task, the "checkbox" is upgraded to "[o] " and the new task becomes a dependency of the original task. 

