# xapl
My golfing extensions to Dyalog APL

## Code page

xAPL programs should be scored according to the character amount.
The code page can be queried using `xapl.code_page`.

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

https://tio.run/##jVZtT9tWFP7uX3E/rLp247A4JUCs8YG1sNGtwKDd1r2pN/ZN4s3xde2bQAqZprVK07RBrRBqNQlpAu1N2rQPVVap0r7AP/Ev2D9g59rGNgRQoijyvec8zz33nOcch7h23mwTm9WOpWCwh1Zpy/It5uiopU0UJElfIg3qu8SgaIO4toTgQ1vEDrrPN8OF@Nh1X6xljPGX32D8dQ7jLRmrwWCoYgUrncTRix2DJ/tgnFiuVn3KfWVW08XyFuFGPXj6KBi8hW8hhRnMpICTZTgIX8FKsL27Km9iJK9Qz6AOVxDuALWiAMv5oP/2XuxkcAvEMdoLCUy4no8LBn9lYGvcsultyzbpGNCv3skgbzDbJt5YB25nYCLT44B@@DUDWiVOjY511OsMapFxMg6o182CHMOjjWwFLkM@ziaEjo88/O3UkS3q@WPdr/dTNiuMjXOWjJCSS2AgxksRwuGkzBif8YJSJuuOJEVbe2gpz@vIg2hUVGkjk1ZJ0@bIv98kHp0IvUSook1EH3SfF8OOGF49egPrTkJzLxgcHP6t3UPrHnFdaiLLQQT5llOzKWIu9QhnXsQXpyylDPr7UZvJUatFVKJ7Uv4Vj5rUoL7PPMSqQO00GxUaMybViziHeS0FJpoYhSWmGJbLwAwmogRQg9YI4gxViE8Rsd06UVExk6qIKu7802kKr9N7FfR/Oe9GBrGNpk04jc4QZahaFeYQw7DiMEPfaDikzAWkAXdhFsj0oP9QbMJRWtDdgUc19y78KiDuM2moWjanXlKJcD@dH3ECAPv7SQkykfrcgzqiKvMahHPxKFIpUhFlPxwmIUWvDxoc7GGYqD8H/S4UVhHhqIdAuyt@hmrQ/zEY/JmSE1ShXIRmOSbdQDXqZCIMZ8ep2Q733t5dug6nvMW6iPm9gh48@zcP02MLVqGOXovos7M3lFb/AM4@yENBZOHSe7V19PLopZJPpnQaUwOqYFoGsmAIIZNR38Ec1UkLBIDcpucyn6rIZ2idJpAmqMPiQih1ZptCPj4nDvdjpQHRJddItiO24WxBxwWteG2yNDU9U8YjZk3HpGKAAGt169vv7IbD3Puez5ut9Y32g1H3oo7n3r9@Y37hgw8Xb3708a2l5ZVPVtdu3/n0s8/vfjHqfk3HbUIt1hw1Ter47tz84vKdUVPpYtOUPqOVg2f/wJXnvr/Qa1q/3D6jTxbLk@Wp6WJ5asRYTo2l0XQV9OLRG2jAXAnGVjEqWA3KRB0EWrNYgjirmkhLsTr0ecdM/n5I0pooqKhq3DFPH6lwAcPDBHckQxiPq8L6ZB809we8EyUww0YJVZEWP2vwXDrGWAJENMSNiyihaSSThDKSQ194XW7CrO/uyOJmJ1sdsfUiHPTiD9KEeGUjgTv@Hw
