(set-logic LIA)

( declare-const d Int )
( declare-const d! Int )
( declare-const q Int )
( declare-const q! Int )
( declare-const r Int )
( declare-const r! Int )
( declare-const x Int )
( declare-const x! Int )
( declare-const y Int )
( declare-const y! Int )

( declare-const d_0 Int )
( declare-const q_0 Int )
( declare-const q_1 Int )
( declare-const q_2 Int )
( declare-const r_0 Int )
( declare-const r_1 Int )
( declare-const r_2 Int )
( declare-const x_0 Int )
( declare-const y_0 Int )

( define-fun inv-f( ( d Int )( q Int )( r Int )( x Int )( y Int ) ) Bool
SPLIT_HERE_asdfghjklzxcvbnmqwertyuiop
)

( define-fun pre-f ( ( d Int )( q Int )( r Int )( x Int )( y Int )( d_0 Int )( q_0 Int )( q_1 Int )( q_2 Int )( r_0 Int )( r_1 Int )( r_2 Int )( x_0 Int )( y_0 Int ) ) Bool
	( or
		( and
			( = d d_0 )
			( = q q_0 )
			( = r r_0 )
			( = x x_0 )
			( = y y_0 )
			( = r_0 x_0 )
			( = q_0 0 )
			( >= d_0 0 )
			( >= x_0 0 )
			( and ( >= x_0 0 ) ( >= y_0 0 ) )
		)
		( and
			( = d d_0 )
			( = q q_0 )
			( = r r_0 )
			( = x x_0 )
			( = y y_0 )
			( = r_0 x_0 )
			( = q_0 0 )
			( >= d_0 0 )
			( not ( >= x_0 0 ) )
			( and ( >= x_0 0 ) ( >= y_0 0 ) )
		)
	)
)

( define-fun trans-f ( ( d Int )( q Int )( r Int )( x Int )( y Int )( d! Int )( q! Int )( r! Int )( x! Int )( y! Int )( d_0 Int )( q_0 Int )( q_1 Int )( q_2 Int )( r_0 Int )( r_1 Int )( r_2 Int )( x_0 Int )( y_0 Int ) ) Bool
	( or
		( and
			( = q_1 q )
			( = r_1 r )
			( = q_1 q! )
			( = r_1 r! )
			( = y y_0 )
			( = y! y_0 )
			( = d d! )
			( = q q! )
			( = x x! )
		)
		( and
			( = q_1 q )
			( = r_1 r )
			( <= y_0 r_1 )
			( = r_2 ( - r_1 ( * y_0 d_0 ) ) )
			( = q_2 ( + q_1 d_0 ) )
			( = q_2 q! )
			( = r_2 r! )
			(= d d_0 )
			(= d! d_0 )
			(= x x_0 )
			(= x! x_0 )
			(= y y_0 )
			(= y! y_0 )
		)
	)
)

( define-fun post-f ( ( d Int )( q Int )( r Int )( x Int )( y Int )( d_0 Int )( q_0 Int )( q_1 Int )( q_2 Int )( r_0 Int )( r_1 Int )( r_2 Int )( x_0 Int )( y_0 Int ) ) Bool
	( or
		( not
			( and
				( = d d_0)
				( = q q_1)
				( = r r_1)
				( = x x_0)
				( = y y_0)
			)
		)
		( not
			( and
				( not ( <= y_0 r_1 ) )
				( not ( = x_0 ( + ( * q_1 y_0 ) r_1 ) ) )
			)
		)
	)
)
SPLIT_HERE_asdfghjklzxcvbnmqwertyuiop
( assert ( not
	( =>
		( pre-f d q r x y d_0 q_0 q_1 q_2 r_0 r_1 r_2 x_0 y_0  )
		( inv-f d q r x y )
	)
))

SPLIT_HERE_asdfghjklzxcvbnmqwertyuiop
( assert ( not
	( =>
		( and
			( inv-f d q r x y )
			( trans-f d q r x y d! q! r! x! y! d_0 q_0 q_1 q_2 r_0 r_1 r_2 x_0 y_0 )
		)
		( inv-f d! q! r! x! y! )
	)
))

SPLIT_HERE_asdfghjklzxcvbnmqwertyuiop
( assert ( not
	( =>
		( inv-f d q r x y  )
		( post-f d q r x y d_0 q_0 q_1 q_2 r_0 r_1 r_2 x_0 y_0 )
	)
))

