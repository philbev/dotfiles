# My Markdown Cheat Sheet

## Live Preview

### Vscode
For Vscode when editing a markdown file, live preview can be enacted in one of
two ways:-

1. SHIFT-ALT-V toggles preview  mode.
2. ALT-K V - Splits the screen with the preview at the side.

### Vim / Neovim
With vim/neovim a web browser can if utilised for a live preview. The browser
will update on every save. Chromium and google-chrome need an extension to be
installed to display the text.A 'Markdown Preview Plus' is the current one.
'Markdown Preview Plus'  needs to be configured:-
1. In chromium or google-chrome, click on Menu->More Tools->Extensions, and
   then the 'Details' button in the 'Markdown Preview Plus' window tile.Then
   enable 'Allow access to file URLs'
2. Also note if Table of Contents option is enabled the internal links on the
   web page will not work though they will still work in the editor.
3. To enable the  'vim-markdown' plug-in to display normal text ':set
   conceallevel=0'

___
## Headers
There are 6 levels of headings in markdown analogous to the HTML headings h1
to h6. In markdown the pound sign (#) is used. The number of hashes signifies
the level, i.e. one hash signifies level 1, 2 hashes level 2 and so on. The
hashes must start the line and a space between the hash(es) and the heading must
exist. Some examples:-

```markdown
    ### Heading 3
    #### Heading 4
```
___
## Quotes


Quotes are defined by the  '>' symbol

Example

> This is an example quote

You can combine a header with a quote.

Example

> ## H2 Quote

___

## Text Decoration
### Bold
Bold text is preceded with two asterisks or underscores.

**bold text with asterisks.**

__Bold text with underscores.__

### Italics
Italic text is surrounded by single asterisks or underscores:-

*Italic text with asterisks.*

_Italic text with underscores._

___
## Horizontal Rule
A horizontal rule gives a visible line break.  You can create one by putting
three or more hypens, asterisks, or underscores

**NOTE!** When using vim / neovim do **not** use hypens as they confuse the folding
in plug-in 'vim-markdown'.

Examples of folding:-

    ---
    ***
    ___

***
## Lists

Create unordered lists using '-', '*', '+,

Examples with each :-
```markdown
    - item
    * item
    + item
    - sdfsd
```

You can create sublists by indenting:-
Example
```markdown
    - item
        - subitem
```
Create ordered lists using a number prefix

Example
```
    1. item 1
    2. item 2
    3. item 3
```
___
## Hyperlinks and References
### URL With No Text
For Hyperlinks to websites simply surround the URL with angled brackets:-

<https://www.google.com>

### URL With Text
Create a link with text by surrounding text with square brackets, [], and link
immediately following with parenthesis ():-

[google website](https://www.google.com)

### Link With References

What if you needed to reuse a link several times?  Well, you could copy and paste that link each time.  That means, if you need to update the link, you will have to do it each time its used.  There's a better way!

Create reference style links by defining your link with the a 'key' inside of brackets, colon, space, and the link

Example

```markdown
    [1]: http://jamesqquick.com/
```

Then use the reference style link by using your text inside of brackets followed by the link 'key' inside of bracket.

Example

```markdown
    [My Website][1]
```
## Images

Defining an image is similar to defining a link, except you prefix it with '!'

Example with using a web page:-
```
    ![James Quick](https://pbs.twimg.com/profile_images/887455546890211329/tAoS7KUm_400x400.jpg)
```

For images on local file system  do not use the internet protocol before the
file path and name of image as this does not work. See below:-
```
    ![Owl Avatar](/usr/local/pictures/owl_avatar_180x180.jpg)
```
A live example using local file system:-

![Owl Avatar](/usr/local/pictures/owl_avatar_180x180.jpg)

Just like links, you can define images by reference in the same format.

Define the reference
```
    [profile]: https://pbs.twimg.com/profile_images/887455546890211329/tAoS7KUm_400x400.jpg
```

Use the reference

```
    ![James Quick][profile]
```
A live example using local file system:-

[avatar]: /usr/local/pictures/owl_avatar_180x180.jpg

![owl][avatar]

 An example of an inline image ![owl][avatar] here.

___

## Code

You can do inline code with backticks
```
   `Inline code here.`
```
You can do blocks of code by surroung it with 3 backticks

Example

```
    var num = 0;
    var num2 = 0;
```

The above does not give language specific highlighting.  You can specify the
programming language immediately following the opening 3 backticks.  You Should
see a difference in highliting! **NOTE!** the  syntax highling is seen only in
the editor, not in the browser.


Example Javascript

```javascript
    var num = 0;
    var num2 = 0;
```

Example HTML

 ```html
    <div>
        <p>This is an html example</p>
    </div>
 ```
Example Python:-

```python
    def multiply:
        x = input("Enter a number: ")
        y = input("Ennter the next numner: ")
        return x + y
```
___

## Tables
Tables are useful for displaying rows and columns of data.  Column headers can
be defined in between pipes (|).  Headers are separated from table content with
a row of dashes (-) (still separated by pipes), and there must be at least 3
dashes between each header.  The row data follows beneath (still separated by
pipes).


Example

    | Header 1    | Header 2    | Header 3    |
    | ----------- | ----------- | ----------- |
    | Row 1 Col 1 | Row 1 Col 2 | Row 1 Col 3 |
    | Row 2 Col 1 | Row 2 Col 2 | Row 2 Col 3 |
    | Row 3 Col 1 | Row 3 Col 2 | Row 3 Col 3 |
    | Row 4 Col 1 | Row 4 Col 2 | Row 4 Col 3 |
    | Row 5 Col 1 | Row 5 Col 2 | Row 5 Col 3 |

The above should be rendered by the browser as:-

| Header 1    | Header 2    | Header 3    |
| ----------- | ----------- | ----------- |
| Row 1 Col 1 | Row 1 Col 2 | Row 1 Col 3 |
| Row 2 Col 1 | Row 2 Col 2 | Row 2 Col 3 |
| Row 3 Col 1 | Row 3 Col 2 | Row 3 Col 3 |
| Row 4 Col 1 | Row 4 Col 2 | Row 4 Col 3 |
| Row 5 Col 1 | Row 5 Col 2 | Row 5 Col 3 |


The column definitions and row definitions do not have to have the exact same
width sizes, but it would be much more readable.  Notice the output of the
following two tables are the same, but the second (the raw markdown) is much
more readable.


Example

    | Header 1                 | Header 2              |
    | ------------------------ | --------------------- |
    | Loooooooooooooong item 1 | looooooooooong item 2 |




Example

    | Header 1                 | Header 2              |
    | ------------------------ | --------------------- |
    | Loooooooooooooong item 1 | looooooooooong item 2 | --> |


You can also align (Center, left, right) the text in a column by using colons (:) in the line breaks between headers and rows.  No colon means the default **left alignment**.  Colons on each side signifies **center alignment**.  And a trailing colon means **right alignment**.



Example

    | Header Left       |    Header Centre    |      Header Right |
    | ----------------- | :-----------------: | ----------------: |
    | Left              |  Center             |  Right            |

Displays as:-

| Header Left       |    Header Centre    |      Header Right |
| ----------------- | :-----------------: | ----------------: |
| Left              |  Center             |             Right |

___


## Custom HTML

Since MarkDown gets automatically converted to HTML, you can add raw HTML
directly to your MarkDown.


```html
<p>Sample HTML Div</p>
```

Creates this

<p>Sample HTML Div</p>


___

## Custom CSS

You can also add custom CSS to your MarkDown to add additional styling to your
document. You can also include CSS by including a style tag.

```html
    <style>
        body {
            color:red;
        }
    </style>
```

___
</style>
## CSS Styles
<style>
body{
    color: #000000;
    background: #ffffff;
    font-size: 18px;
}
h1{
    color: blue;
    text-align: center;
    text-decoration-line: underline;
    text-decoration-color: blue;
}
h2{
    color: blue;
    text-align: left;
    text-decoration-line: underline;
}
h3{
    color: blue;
    text-align: left;
    text-decoration-line: underline;
}

code{
    color: blue;
    font-size: 20px;
}
    </style>

## Additional Resources
- [Markdown Cheat Sheet - Adam P on Github](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet#images)
- [Daring Fireball Markdown Syntax](https://daringfireball.net/projects/markdown/syntax)
- [MarkDown in Visual Studio Code](https://code.visualstudio.com/docs/languages/markdown)
