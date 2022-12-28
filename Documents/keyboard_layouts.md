# KEYBOARD LAYOUTS
## Plasma
### US Keyboards
1. System Settings->Input Devices: In Hardware tab select Generic 104-key PC for US layouts
2. Select Layouts Tab
3. Select 'Configure layouts'
4. Click on 'Add' tab
5. Select 'Layout' - EurKEY(US)

The pound sign can now be printed by pressing \<Alt-Rt>+<4>

The Euro character can be printed by pressing \<Alt_Rt>+<5>

### UK Keyboards
1. System Settings->Input Devices: In Hardware tab select Generic 105-key PC for UK layouts
2. Select Layouts Tab
3. Select 'Configure layouts'
4. Click on 'Add' tab
5. Select 'Layout' - gb



## Window Managers
The below examples are for the i3 window manager. Adjust for the WM in use.
### US Layout
> exec_always setxkbmap  -layout eu -model pc104

### GB Layout
> exec_always setxkbmap  -layout gb -model pc105

## Czech Characters

```
key <AB01>  { [ z,          Z, zcaron,             Zcaron    ] };
key <AB03>  { [ c,          C, ccaron,             Ccaron    ] };
key <AB05>  { [ b,          B, ssharp,             U1E9E     ] };
key <AB06>  { [ n,          N, ncaron,             Ncaron    ] };
key <AC01>  { [ a,          A, aacute,             Aacute    ] };
key <AC02>  { [ s,          S, scaron,             Scaron    ] };
key <AC03>  { [ d,          D, dcaron,             Dcaron    ] };
key <AD03>  { [ e,          E, ecaron,             Ecaron    ] };
key <AD04>  { [ r,          R, rcaron,             Rcaron    ] };
key <AD05>  { [ t,          T, tcaron,             Tcaron    ] };
key <AD06>  { [ y,          Y, yacute,             Yacute    ] };
key <AD07>  { [ u,          U, uring,              Uring     ] };
key <AD08>  { [ i,          I, iacute,             Iacute    ] };
key <AD09>  { [ o,          O, oacute,             Oacute    ] };
key <AE02>  { [ 2,         at, doublelowquotemark            ] };
key <AE03>  { [ 3, numbersign, eacute,             Eacute    ] };
key <AE07>  { [ 7,  ampersand, uacute,             Uacute    ] };
```

The above key configurations above can be inserted into the corresponding xkb layout files found in:
> **/usr/share/X11/xkb/symbols/**

For UK keyboards use:
>    **/usr/share/X11/xkb/symbols/gb**

For US keyboards use:
>    **/usr/share/X11/xkb/symbols/eu**
