# PATTERN MATCHING

## Basic Regular Expressions (BRE)

| Symbol | Action                                          |
|--------|-------------------------------------------------|
| .      | Match any character                             |
| *      | Match zero or more preceding character or group |
| $      | Match end of line                               |
| ^      | Match beginning of line                         |
| \      | Escape following character                      |
| [ ]    | Match each character in set                     |

## Extended Regular Expressions (ERE)

| Symbol   | Action                                            |
| -------- | ------------------------------------------------- |
| ( )      | Group or reference                                |
| { }      | Match a range of instances                        |
| < >      | Match whole word (beginning and end)              |
| +        | Match one or more preceding instances             |
| ?        | Match zero or one preceding instance              |
| \|       | Alternate matches                                 |
| ( )      | groups or alternatives or references              |

## Some Useful Vim Search Patterns:

| Symbol   | Matching Pattern                        |
| -------- | ----------------------------------------|
| \d       | digits 0-9 [0-9]                        |
| \D       | non-digits [^0-9]                       |
| \s       | whitespace - space and tab              |
| \S       | non-whitespace                          |
| \w       | word char: 0-9, a-z, and _ [0-9a-zA-Z_] |
| \W       | non-word char                           |
| \l       | lowercase char a-z                      |
| \u       | uppercase char A-Z                      |

## Replacement (Substitute) Metacharacters

| Symbol | ex | sed | ed | Action                                  |
| ------ | -- | --  | -- | ----------------------------------------|
| \\     | #  | #   | #  | Escape character following              |
| \n     | #  | #   | #  | Reuse pattern in \\( \\)                |
| &      | #  | #   |    | Substitute previous search pattern      |
| ~      | #  |     |    | Substitute previous replacement pattern |
| \u \U  | #  |     |    | Change characters to uppercase          |
| \l \L  | #  |     |    | Change charaxters to lowercase          |
| \E     | #  |     |    | Turn off previous \\U or \\L            |
| \e     | #  |     |    | Turn off previous \\u or \\l            |

