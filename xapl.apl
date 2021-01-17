
⍝ Code page (prepended with space and newline):
⍝ 10/16 rows.

:Namespace xapl
    ⍝ Code page (prepended with space and newline):
    ⍝ 10/16 rows.
    code_page←∊(⎕UCS 32)(⎕UCS 10)'''←+-÷×*⍟⌹○!?|⌈'
    code_page,←'⊥⊤⊣⊢=≠≤<>≥≡≢∨∧⍲⍱'
    code_page,←'⊂⊃⊆⌷⍋⍒⍳⍸∊⍷∪∩~/\⌿'
    code_page,←'⍀,⍪⍴⌽⊖⍉¨⍨⍣.∘⍤⍥@⍞'
    code_page,←'⎕⍠⌸⌺⌶⍎⍕⋄⍝→⍵⍺∇¯⍬a'
    code_page,←'bcdefghijklmnopq'
    code_page,←'rstuvwxyz0123456'
    code_page,←'789ABCDEFGHIJKLM'
    code_page,←'NOPQRSTUVWXYZ()['
    code_page,←']{}%𝑓$⍫⍭∆§√φ⍩↑↓⌊'
    code_page,←'"'

    eval←{
        lhs←{('''[^'']+''|(',⍵,')')}
        rhs←{(≢⍵.Offsets)=1:⍵.Match⋄⍺⍺⍵}
        code←((lhs'%')⎕R({' (Percent) '}rhs))⍵
        code←((lhs'𝑓')⎕R({' (FancyF) '}rhs))code
        code←((lhs'⍭')⎕R({' (StileTilde) '}rhs))code
        code←((lhs'\$')⎕R({' (Dollar) '}rhs))code
        code←((lhs'⍎')⎕R({' (eval) '}rhs))code
        code←((lhs'…')⎕R({' (Range) '}rhs))code
        code←((lhs'⍳')⎕R({' (Iota) '}rhs))code
        code←((lhs'>')⎕R({' (Greater) '}rhs))code
        code←((lhs'<')⎕R({' (Lesser) '}rhs))code
        code←((lhs'§')⎕R({' (Inverse) '}rhs))code
        code←((lhs'√')⎕R({' (Root) '}rhs))code
        code←((lhs'φ')⎕R({' (Totient) '}rhs))code
        code←((lhs'~')⎕R({' (Tilde) '}rhs))code
        code←((lhs'⍩')⎕R({' (NthSatisfying) '}rhs))code
        code←((lhs'')⎕R({' ({⍵⊣⍵.⎕CY''dfns''}⎕NS⍬). '}rhs))code
        code←((lhs'"')⎕R({''''}rhs))code
        code←((⎕UCS 10)⎕R('⋄'))code
        ⍎code
    }

    ⍝ N-th root, by default square.
    Root←{⍺←2⋄⍵*÷⍺}
    ⍝ `⍣¯1` wrapped in a single operator.
    Inverse←{⍺←⊢⋄⍺(⍺⍺⍣¯1)⍵}
    ⍝ Predecessor of a number.
    Decrement←{⍵-1}
    ⍝ convert omega to base alpha, 2 by default.
    Percent←{⍺←2⋄(⍺∘⊥⍣¯1)⍵}
    ⍝ calculate omega-th fibonacci number
    FancyF←{⍺←0 1⋄0=⍵:⊃⍺⋄(1↓⍺,+/⍺)∇⍵-1}
    ⍝ filter operator
    StileTilde←{⍵/⍨⍺⍺⍵}
    ⍝ string formatting of alpha
    Dollar←{∊('⍝'(≠⊆⊢)⍺),¨⍕¨⍵,⊂⍬}
    ⍝ a better index generator
    Range←{
        0=⎕NC'⍺':{⍵<0:⌽-⍳|⍵⋄⍳⍵}⍵
        ⍺(⊣,⊣-∘(⍳∘|××)-)⍵
    }
    ⍝ monadic iota doesn't have a purpose, so we
    ⍝ use it to hold constants.
    Iota←{
        0=⎕NC'⍺':{
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
        }⍵
        ⍺⍳⍵
    }
    ⍝ greater than sign overload:
    ⍝ added monadic behavior - increment
    Greater←{
        0=⎕NC'⍺':⍵+1
        ⍺>⍵
    }
    ⍝ lesser than sign overload:
    ⍝ added monadic behavior - decrement
    Lesser←{
        0=⎕NC'⍺':⍵-1
        ⍺<⍵
    }
    ⍝ Monadic: Compute the value of Euler's totient.
    ⍝ Dyadic: True if there is ⍺ in ⍵.
    Totient←{
        0=⎕NC'⍺':(+/1=⊢∨⍳)⍵
        1=+/⍺=⍵
    }
    ⍝ Small negation domain extension.
    ⍝     ~ 0 1 2 1 0
    ⍝ 1 0 0 0 1
    Tilde←{
        0=⎕NC'⍺':0=⍵
        ⍺~⍵
    }
    ⍝ Monadic: Primality test.
    ⍝ Dyadic: repeat ⍵, ⍺ times.
    Prime←{
        0=⎕NC'⍺':1({⍵⊣⍵.⎕CY'dfns'}⎕NS⍬).pco ⍵
        (⍺×⍴⍵)⍴⍵
    }
    ⍝ Dyadic: pick n-th satisfying a criterion.
    NthSatisfying←{x←⍵⋄n←0⋄⍺⍺{y←1+⍵⋄n+←⍺⍺y⋄y}⍣{n=x}0}
:EndNamespace
