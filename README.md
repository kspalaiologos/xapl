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
9 ]{}  '%𝑓$…⍭∆∇§√
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

`…`: A more reasonable index generator respecting `⎕IO`:
```
      xapl.eval '…5'
1 2 3 4 5
      xapl.eval '…¯5'
¯5 ¯4 ¯3 ¯2 ¯1
      xapl.eval '10…¯5'
10 9 8 7 6 5 4 3 2 1 0 ¯1 ¯2 ¯3 ¯4 ¯5
      xapl.eval '¯10…5'
¯10 ¯9 ¯8 ¯7 ¯6 ¯5 ¯4 ¯3 ¯2 ¯1 0 1 2 3 4 5
      xapl.eval '¯10…¯5'
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
      xapl.eval '𝑓¨…20'
1 1 2 3 5 8 13 21 34 55 89 144 233 377 610 987 1597 2584 4181 6765
```

`%`: Convert `⍵` to base `⍺`, `⍺=2` by default:
```
      xapl.eval '2%123'
1 1 1 1 0 1 1
      xapl.eval '10%123'
1 2 3
      xapl.eval '%123'
1 1 1 1 0 1 1
```

## TIO.run template

https://tio.run/##jVZtT9tWFP7uX3E/bLp242RxSoBY4wOjsNGuwKDd1r2pN/ZN4tXxde2bQIBM01ZladqgVgi1moQ0gfYmbdqHKqtUaV/gn/gX9B@wc23jGAIoURT53nOe5557znOOQ1w7a7aIzaonUtDfR6u0afkWc3TU1HL5cGuOuS3PqtY4kucUVG6hW6Ru2QStbdJ1Y7P1ICdJkr5E6tR3iUHRBnFtCcGHNokddJ5thQvxsWu@WMsY4y@/wfjrDMbbMlaD/kDFClbaiaMXOwaPD8CYW65UfMp9ZUbTxfI24UYtePIo6L@Bb34IM5hJASfLcBB@FyvBzt6qvIWRvEI9gzpcQbgN1IoCLBeD3u4/303hFohjtBYSmHC9GBf0/07B1rhl0zuWbdIxoF@9k0LeYLZNvLEO3EnBRKbHAX3/Wwq0SpwqHeuoVynUIuNkHFC3kwY5hkfr6QpchfwpnRA6PvLo9zNHNqnnj3W/7s/prDA2zlkyQkomgYEYr0QIh9MyY3zOC0qZrNuSFG3to6UsryEPolFFy5m0Qho2R/7DBvFoLvQSoYo2EX3QeVYIO2Jw7fg1rNsJzf2gf3j0j3YfrXvEdamJLAcR5FtO1aaIudQjnHkRX5yyIWXQO4jaTI5aLaIS3TPkX/GoSQ3q@8xDrALUTqNepjFjUr2Ic5DVhsBEE6OwxBTDMimYwUSUAKrTKkGcoTLxKSK2WyMqKqRSFVHFnX82TeF1ui@D3q8X3cggttGwCafRGaIMFavMHGIYVhxm6BsNhyFzHmnAnZ8BMj3o/Sg24Sgt6OzCo5p5D34VEPe5NFQsm1MvqUS4P5wfcQIA@8dpCVKR@tyDOqIK8@qEc/EoUilSEWU/HCYhRbcHGuzvY5iovwS9DhRWEeGoR0C7J34GatD7Iej/NSQnqEy5CM1yTLqBqtRJRRjOjjOzHe69s7c0B6e8wbqI@f28Hjz9LwvTYxtWoY5eiejTszeUVu8Qzj7MQkFk4dJ9uX384viFkk2m9DCmOlTBtAxkwRBCJqO@gzmqkSYIALkNz2U@VZHP0DpNIA1Qh8WFUGrMNoV8fE4c7sdKA6IrrpFsR2yDmbyO81rh@kRxcmq6hEfMmo5J2QABVmvWtw/susPch57PG831jdbmqHtBx7MfzN2YX/jwo8Wbtz6@vbS88snq2p27n372@b0vRt2v67hFqMUao6YJHd@bnV9cvjtqKl5umtSntVLw9F@48ux3l3pN6Vfbp/WJQmmiNDlVKE2OGEtDY3E0XXm9cPwaGjBThLFViApWhTJRB4HWLJYgzqsm0lKsDn3eMZO/H5K0Jgoqqhp3zJNHKlzA8DDBbckQxpOKsD4@AM39Ce9ECcywUUQVpMXPGjwXTzCWABENceMySmgaySShjOTQF16XWzDrO7uyuNnpVltsPQ8HvfiDlBOvbCRwJ/8D
