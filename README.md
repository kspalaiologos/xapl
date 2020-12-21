# xapl
My golfing extensions to Dyalog APL

## Code page

```
  0123456789ABCDEF
0 ←+-÷×*⍟⌹○!?|⌈⌊⊥⊤
1 ⊣⊢=≠≤<>≥≡≢∨∧⍲⍱↑↓
2 ⊂⊃⊆⌷⍋⍒⍳⍸∊⍷∪∩~/\⌿
3 ⍀,⍪⍴⌽⊖⍉¨⍨⍣.∘⍤⍥@⍞
4 ⎕⍠⌸⌺⌶⍎⍕⋄⍝→⍵⍺∇¯⍬a
5 bcdefghijklmnopq
6 rstuvwxyz0123456
7 789ABCDEFGHIJKLM
8 NOPQRSTUVWXYZ()[
9 ]{}  '%𝑓$⍫⍭∆∇§√
A
B
C
D
E
F
```

Free glyps: 97. 0x93 and 0x94 are respectively space and newline. Consequently, xAPL programs should be scored according to the character amount.

## Loading

```
⎕FIX'file:///path/to/the/repository/xapl.apl'
```

## Basic usage

Evaluating a block of xAPL code:

```
      xapl.eval '√2'
1.414213562
```

Evaluating a line from `stdin`:

```
      xapl.eval ⍞
√2
1.414213562
```

## Extensions

`√`: Calculating the n-th root (second by default):
```
      xapl.eval '√2'
1.414213562
      xapl.eval '3×3√27'
9
```

`§`: Inverse, equivalent to `⍣¯1`.
```
      xapl.eval '((32∘+)∘(×∘1.8))§ 5'
¯15   ⍝ 5 degrees fahrenheit is -15 degrees celcius.
```

`∇` and `∆`: Decrement and increment, respectively:
```
      xapl.eval '∆1'
2
      xapl.eval '∇1'
0
```

`⍳`: Dyadic invocation unchanged, monadic invocation loads a constant:
```
  ⍵=0:'0123456789'
  ⍵=1:'abcdefghijklmnopqrstuvwxyz'
  ⍵=2:'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
  ⍵=3:'yaeiou'
  ⍵=4:'YAEIOU'
  ⍵=5:'YAEIOU'
  ⍵=6:819⌶⎕A~'YAEIOU'
  ⍵=7:⎕A~'YAEIOU'
  ⍵=8:4294967296
  ⍵=9:4294967295
  ⍵=10:2÷¯1+5*÷2  ⍝ golden ratio
```
For example:
```
      xapl.eval '⍳6'
bcdfghjklmnpqrstvwxz
```

`⍫`: A more reasonable index generator respecting `⎕IO`:
```
      xapl.eval '⍫5'
1 2 3 4 5
      xapl.eval '⍫¯5'
¯5 ¯4 ¯3 ¯2 ¯1
      xapl.eval '10⍫¯5'
10 9 8 7 6 5 4 3 2 1 0 ¯1 ¯2 ¯3 ¯4 ¯5
      xapl.eval '¯10⍫5'
¯10 ¯9 ¯8 ¯7 ¯6 ¯5 ¯4 ¯3 ¯2 ¯1 0 1 2 3 4 5
      xapl.eval '¯10⍫¯5'
¯10 ¯9 ¯8 ¯7 ¯6 ¯5
```

`⍎`: Also evaluates xAPL expressions.

`$`: String formatting (invocation analogical to `'a⍝b⍝c'$1 2`):
```
      xapl.eval '''a⍝b⍝c''$1 2'
a1b2c
```

`⍭`: Filter operator:
```
      xapl.eval '2∘|⍭⍫¯20'
¯19 ¯17 ¯15 ¯13 ¯11 ¯9 ¯7 ¯5 ¯3 ¯1
```

`𝑓`: Computing fibonacci sequence elements:
```
      xapl.eval '𝑓¨⍫20'
1 1 2 3 5 8 13 21 34 55 89 144 233 377 610 987 1597 2584 4181 6765
```

`%`: Convert `⍵` to base `⍺`:
```
      xapl.eval '2%123'
1 1 1 1 0 1 1
```
