(set-logic LIA)

( declare-const a Int )
( declare-const a! Int )
( declare-const r Int )
( declare-const r! Int )
( declare-const x Int )
( declare-const x! Int )

( declare-const a_0 Int )
( declare-const a_1 Int )
( declare-const r_0 Int )
( declare-const r_1 Int )
( declare-const r_2 Int )
( declare-const r_3 Int )
( declare-const x_0 Int )
( declare-const x_1 Int )
( declare-const x_2 Int )

( define-fun inv-f( ( a Int )( r Int )( x Int ) ) Bool
SPLIT_HERE_asdfghjklzxcvbnmqwertyuiop
)

( define-fun pre-f ( ( a Int )( r Int )( x Int )( a_0 Int )( a_1 Int )( r_0 Int )( r_1 Int )( r_2 Int )( r_3 Int )( x_0 Int )( x_1 Int )( x_2 Int ) ) Bool
	( and
		( = a a_1 )
		( = r r_1 )
		( = x x_0 )
		( >= x_0 0 )
		( = r_1 0 )
		( = a_1 ( * 2 x_0 ) )
	)
)

( define-fun trans-f ( ( a Int )( r Int )( x Int )( a! Int )( r! Int )( x! Int )( a_0 Int )( a_1 Int )( r_0 Int )( r_1 Int )( r_2 Int )( r_3 Int )( x_0 Int )( x_1 Int )( x_2 Int ) ) Bool
	( or
		( and
			( = r_2 r )
			( = x_1 x )
			( = r_2 r! )
			( = x_1 x! )
			( = a a! )
		)
		( and
			( = r_2 r )
			( = x_1 x )
			( <= r_2 x_1 )
			( = x_2 ( - x_1 r_2 ) )
			( = r_3 ( + r_2 1 ) )
			( = r_3 r! )
			( = x_2 x! )
			(= a a_1 )
			(= a! a_1 )
		)
	)
)

( define-fun post-f ( ( a Int )( r Int )( x Int )( a_0 Int )( a_1 Int )( r_0 Int )( r_1 Int )( r_2 Int )( r_3 Int )( x_0 Int )( x_1 Int )( x_2 Int ) ) Bool
	( and
		( or
			( not
				( and
					( = a a_1)
					( = r r_2)
					( = x x_1)
				)
			)
			( not
				( and
					( not ( <= r_2 x_1 ) )
					( >= ( + ( * r_2 r_2 ) r_2 ) a_1 )
					( not ( and ( >= ( + ( * r_2 r_2 ) r_2 ) a_1 ) ( < ( - ( * r_2 r_2 ) r_2 ) a_1 ) ) )
				)
			)
		)
		( or
			( not
				( and
					( = a a_1)
					( = r r_2)
					( = x x_1)
				)
			)
			( not
				( and
					( not ( <= r_2 x_1 ) )
					( not ( >= ( + ( * r_2 r_2 ) r_2 ) a_1 ) )
					( not ( and ( >= ( + ( * r_2 r_2 ) r_2 ) a_1 ) ( < ( - ( * r_2 r_2 ) r_2 ) a_1 ) ) )
				)
			)
		)
	)
)
SPLIT_HERE_asdfghjklzxcvbnmqwertyuiop
( assert ( not
	( =>
		( pre-f a r x a_0 a_1 r_0 r_1 r_2 r_3 x_0 x_1 x_2  )
		( inv-f a r x )
	)
))

SPLIT_HERE_asdfghjklzxcvbnmqwertyuiop
( assert ( not
	( =>
		( and
			( inv-f a r x )
			( trans-f a r x a! r! x! a_0 a_1 r_0 r_1 r_2 r_3 x_0 x_1 x_2 )
		)
		( inv-f a! r! x! )
	)
))

SPLIT_HERE_asdfghjklzxcvbnmqwertyuiop
( assert ( not
	( =>
		( inv-f a r x  )
		( post-f a r x a_0 a_1 r_0 r_1 r_2 r_3 x_0 x_1 x_2 )
	)
))

