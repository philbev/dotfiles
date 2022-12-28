# Zsh Tips and tricks

To find out if if an option is set or not:
```bash
    echo $options[<option name>]
```
## Arrays

To create an array (indexed):
>   array=(item1 item2 item3 ...)

Note! Array indexes start at 1 not 0 as in most other languages.

To print all elements of an array:
>   echo ${array[@]}
>   echo ${array}

To print the number of elements in an array:
>   echo ${#array[@]}
>   echo ${#array}
## History Expansion
###  ``` ^<string to be omitted>```
At the command line the *^<string>*, the *string* following the *^* character
is removed from the previous command in the history. E.g:-
>   % cal 1222 1995

outputs
>   cal: illegal month value: use 1-12

>    % ^22

outputs

```bash
    December 1995
Mo Tu We Th Fr Sa Su
             1  2  3
 4  5  6  7  8  9 10
11 12 13 14 15 16 17
18 19 20 21 22 23 24
25 26 27 28 29 30 31
```
### !:X
Where X is:-
```bash
       0      The first input word (command).
       n      The nth argument.
       ^      The first argument.  That is, 1.
       $      The last argument.
       %      The word matched by (the most recent) ?str search.
       x-y    A range of words; x defaults to 0.
       *      All the arguments, or a null value if there are none.
       x*     Abbreviates `x-$'.
       x-     Like `x*' but omitting word $.
```
