(set-logic LIA)

( declare-const a Int )
( declare-const a! Int )
( declare-const e Int )
( declare-const e! Int )
( declare-const p Int )
( declare-const p! Int )
( declare-const q Int )
( declare-const q! Int )
( declare-const r Int )
( declare-const r! Int )

( declare-const a_0 Int )
( declare-const e_0 Int )
( declare-const p_0 Int )
( declare-const p_1 Int )
( declare-const p_2 Int )
( declare-const p_3 Int )
( declare-const p_4 Int )
( declare-const q_0 Int )
( declare-const q_1 Int )
( declare-const q_2 Int )
( declare-const q_3 Int )
( declare-const r_0 Int )
( declare-const r_1 Int )
( declare-const r_2 Int )
( declare-const r_3 Int )
( declare-const r_4 Int )

( define-fun inv-f( ( a Int )( e Int )( p Int )( q Int )( r Int ) ) Bool
SPLIT_HERE_asdfghjklzxcvbnmqwertyuiop
)

( define-fun pre-f ( ( a Int )( e Int )( p Int )( q Int )( r Int )( a_0 Int )( e_0 Int )( p_0 Int )( p_1 Int )( p_2 Int )( p_3 Int )( p_4 Int )( q_0 Int )( q_1 Int )( q_2 Int )( q_3 Int )( r_0 Int )( r_1 Int )( r_2 Int )( r_3 Int )( r_4 Int ) ) Bool
	( and
		( = a a_0 )
		( = e e_0 )
		( = p p_0 )
		( = q q_0 )
		( = r r_0 )
		( = r_0 ( - a_0 1 ) )
		( = q_0 1 )
		( = p_0 0.500000 )
		( >= e_0 0 )
		( >= a_0 1 )
	)
)

( define-fun trans-f ( ( a Int )( e Int )( p Int )( q Int )( r Int )( a! Int )( e! Int )( p! Int )( q! Int )( r! Int )( a_0 Int )( e_0 Int )( p_0 Int )( p_1 Int )( p_2 Int )( p_3 Int )( p_4 Int )( q_0 Int )( q_1 Int )( q_2 Int )( q_3 Int )( r_0 Int )( r_1 Int )( r_2 Int )( r_3 Int )( r_4 Int ) ) Bool
	( or
		( and
			( = p_1 p )
			( = q_1 q )
			( = r_1 r )
			( = p_1 p! )
			( = q_1 q! )
			( = r_1 r! )
			( = e e_0 )
			( = e! e_0 )
			( = a a! )
			( = q q! )
		)
		( and
			( = p_1 p )
			( = q_1 q )
			( = r_1 r )
			( <= e_0 ( * ( * 2 p_1 ) r_1 ) )
			( <= ( + p_1 ( * 2 q_1 ) ) ( * 2 r_1 ) )
			( = r_2 ( - ( - ( * 2 r_1 ) ( * 2 q_1 ) ) p_1 ) )
			( = q_2 ( + q_1 p_1 ) )
			( = p_2 ( / p_1 2 ) )
			( = p_3 p_2 )
			( = q_3 q_2 )
			( = r_3 r_2 )
			( = p_3 p! )
			( = q_3 q! )
			( = r_3 r! )
			(= a a_0 )
			(= a! a_0 )
			(= e e_0 )
			(= e! e_0 )
		)
		( and
			( = p_1 p )
			( = q_1 q )
			( = r_1 r )
			( <= e_0 ( * ( * 2 p_1 ) r_1 ) )
			( not ( <= ( + p_1 ( * 2 q_1 ) ) ( * 2 r_1 ) ) )
			( = r_4 ( * 2 r_1 ) )
			( = p_4 ( / p_1 2 ) )
			( = p_3 p_4 )
			( = q_3 q_1 )
			( = r_3 r_4 )
			( = p_3 p! )
			( = q_3 q! )
			( = r_3 r! )
			(= a a_0 )
			(= a! a_0 )
			(= e e_0 )
			(= e! e_0 )
		)
	)
)

( define-fun post-f ( ( a Int )( e Int )( p Int )( q Int )( r Int )( a_0 Int )( e_0 Int )( p_0 Int )( p_1 Int )( p_2 Int )( p_3 Int )( p_4 Int )( q_0 Int )( q_1 Int )( q_2 Int )( q_3 Int )( r_0 Int )( r_1 Int )( r_2 Int )( r_3 Int )( r_4 Int ) ) Bool
	( or
		( not
			( and
				( = a a_0)
				( = e e_0)
				( = p p_1)
				( = q q_1)
				( = r r_1)
			)
		)
		( not
			( and
				( not ( <= e_0 ( * ( * 2 p_1 ) r_1 ) ) )
				( not ( ^ ( <= ( - a_0 e_0 ) q_1 ) 2 ) )
			)
		)
	)
)
SPLIT_HERE_asdfghjklzxcvbnmqwertyuiop
( assert ( not
	( =>
		( pre-f a e p q r a_0 e_0 p_0 p_1 p_2 p_3 p_4 q_0 q_1 q_2 q_3 r_0 r_1 r_2 r_3 r_4  )
		( inv-f a e p q r )
	)
))

SPLIT_HERE_asdfghjklzxcvbnmqwertyuiop
( assert ( not
	( =>
		( and
			( inv-f a e p q r )
			( trans-f a e p q r a! e! p! q! r! a_0 e_0 p_0 p_1 p_2 p_3 p_4 q_0 q_1 q_2 q_3 r_0 r_1 r_2 r_3 r_4 )
		)
		( inv-f a! e! p! q! r! )
	)
))

SPLIT_HERE_asdfghjklzxcvbnmqwertyuiop
( assert ( not
	( =>
		( inv-f a e p q r  )
		( post-f a e p q r a_0 e_0 p_0 p_1 p_2 p_3 p_4 q_0 q_1 q_2 q_3 r_0 r_1 r_2 r_3 r_4 )
	)
))

