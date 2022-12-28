# VARIABLES
A variable is a placeholder for values. The values being strings, numbers or booleans. Variable names consist of alphabetic characters, numbers and the underscore. A variable name cannot start with a number.

Examples of variable names:-
- nameFirst
- place123
- place_123
- number_1
- _var

## ASSIGNMENT
```python
    var = 1234
    var2 = 'A string'
# STRINGS
Strings are a sequence of characters enclosed by single quotes, double quotes or triple quotes. Triple quotes are used for multilines.

## PRINTING STRINGS
```python
print("Hello world :-)")
print("new text")
print(f"Hello world :)")
print("Enter text to be printed here")
print("word = 'python'")
word = 'python'
```
## STRING CONCATENATION ANN MULTIPLICATION
Strings can be concatenated with the '+' operator. E.g.
```python
    "Hello " + "world"
```
Should produce:
```python
    Hello world
```
Can also the '+=' operator:
```python
    myString = 'Hello '
    myString += 'world'
```
Multiplication can be achieved with the '*' operator. E.g.
```python
    'Hello ' * 3
```
Should produce:
```python
    Hello Hello Hello
```
## INDEXING STRINGS
```python
print("\nIndexing Strings")
print("================")
print(word[0] + word[1] + word[2] + word[3] + word[4] + word[-1])
print(word[0] + "   word[0]: Index starts at 0")
print(word[-1] + "   word[-1]: Last character starts at index -1")
```

## STRING SLICES
```python
print("\nString Slices")
print("=============")
print("Slicing used to obtain sub-matches")
print("word[0:2] would print %s", word[0:2])
print("Where '0' is the first index and\n 2 is position 1 (i.e. position 2 \
excluded)")

print("word[1:] prints %[", word[1:])

names = ['Phil', 'Duncan', 'Paul', 'Maggie', 'Pat', 'Alun']
print("\n\n\n \n", names)
```
