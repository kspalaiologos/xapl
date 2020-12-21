
⍝ Revision: v1.0
⍝ Copyright (C) by Kamila Szewczyk.

:Namespace xapl
    eval←{
        lhs←{('''[^'']+''|(',⍵,')')}
        rhs←{(≢⍵.Offsets)=1:⍵.Match⋄⍺⍺0}
        code←((lhs'%')⎕R({' (Percent) '}rhs))⍵
        code←((lhs'𝑓')⎕R({' (FancyF) '}rhs))code
        code←((lhs'⍭')⎕R({' (StileTilde) '}rhs))code
        code←((lhs'\$')⎕R({' (Dollar) '}rhs))code
        code←((lhs'⍎')⎕R({' (eval) '}rhs))code
        code←((lhs'⍫')⎕R({' (DelTilde) '}rhs))code
        code←((lhs'⍳')⎕R({' (Iota) '}rhs))code
        code←((lhs'∆')⎕R({' (Increment) '}rhs))code
        code←((lhs'∇')⎕R({' (Decrement) '}rhs))code
        code←((lhs'§')⎕R({' (Inverse) '}rhs))code
        code←((lhs'√')⎕R({' (Root) '}rhs))code
        ⍎code
    }

    ⍝ N-th root, by default square.
    Root←{⍺←2⋄⍵*÷⍺}
    ⍝ `⍣¯1` wrapped in a single operator.
    Inverse←{⍺←⊢⋄⍺(⍺⍺⍣¯1)⍵}
    ⍝ Predecessor of a number.
    Decrement←{⍵-1}
    ⍝ Increment of a number.
    Increment←{⍵+1}
    ⍝ convert omega to base alpha, 2 by default.
    Percent←{⍺←2⋄(⍺∘⊥⍣¯1)⍵}
    ⍝ calculate omega-th fibonacci number
    FancyF←{⍺←0 1⋄0=⍵:⊃⍺⋄(1↓⍺,+/⍺)∇⍵-1}
    ⍝ filter operator
    StileTilde←{⍵/⍨⍺⍺⍵}
    ⍝ string formatting of alpha
    Dollar←{∊('⍝'(≠⊆⊢)⍺),¨⍕¨⍵,⊂⍬}
    ⍝ a better index generator
    DelTilde←{
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
:EndNamespace
