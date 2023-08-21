(set-logic LIA)

( declare-const x1 Int )
( declare-const x1! Int )
( declare-const x2 Int )
( declare-const x2! Int )
( declare-const y1 Int )
( declare-const y1! Int )
( declare-const y2 Int )
( declare-const y2! Int )
( declare-const y3 Int )
( declare-const y3! Int )

( declare-const x1_0 Int )
( declare-const x2_0 Int )
( declare-const y1_0 Int )
( declare-const y1_1 Int )
( declare-const y1_2 Int )
( declare-const y1_3 Int )
( declare-const y2_0 Int )
( declare-const y2_1 Int )
( declare-const y2_2 Int )
( declare-const y2_3 Int )
( declare-const y2_4 Int )
( declare-const y3_0 Int )
( declare-const y3_1 Int )
( declare-const y3_2 Int )
( declare-const y3_3 Int )
( declare-const y3_4 Int )

( define-fun inv-f( ( x1 Int )( x2 Int )( y1 Int )( y2 Int )( y3 Int ) ) Bool
SPLIT_HERE_asdfghjklzxcvbnmqwertyuiop
)

( define-fun pre-f ( ( x1 Int )( x2 Int )( y1 Int )( y2 Int )( y3 Int )( x1_0 Int )( x2_0 Int )( y1_0 Int )( y1_1 Int )( y1_2 Int )( y1_3 Int )( y2_0 Int )( y2_1 Int )( y2_2 Int )( y2_3 Int )( y2_4 Int )( y3_0 Int )( y3_1 Int )( y3_2 Int )( y3_3 Int )( y3_4 Int ) ) Bool
	( and
		( = x1 x1_0 )
		( = y1 y1_0 )
		( = y2 y2_0 )
		( = y3 y3_0 )
		( = y1_0 0 )
		( = y2_0 0 )
	)
)

( define-fun trans-f ( ( x1 Int )( x2 Int )( y1 Int )( y2 Int )( y3 Int )( x1! Int )( x2! Int )( y1! Int )( y2! Int )( y3! Int )( x1_0 Int )( x2_0 Int )( y1_0 Int )( y1_1 Int )( y1_2 Int )( y1_3 Int )( y2_0 Int )( y2_1 Int )( y2_2 Int )( y2_3 Int )( y2_4 Int )( y3_0 Int )( y3_1 Int )( y3_2 Int )( y3_3 Int )( y3_4 Int ) ) Bool
	( or
		( and
			( = y1_1 y1 )
			( = y2_1 y2 )
			( = y3_1 y3 )
			( = y1_1 y1! )
			( = y2_1 y2! )
			( = y3_1 y3! )
			( = x1 x1! )
			( = x2 x2! )
			( = y1 y1! )
			( = y2 y2! )
		)
		( and
			( = y1_1 y1 )
			( = y2_1 y2 )
			( = y3_1 y3 )
			( >= y3_1 0 )
			( = ( + y2_1 1 ) x2_0 )
			( = y1_2 ( + y1_1 1 ) )
			( = y2_2 0 )
			( = y3_2 ( - y3_1 1 ) )
			( = y1_3 y1_2 )
			( = y2_3 y2_2 )
			( = y3_3 y3_2 )
			( = y1_3 y1! )
			( = y2_3 y2! )
			( = y3_3 y3! )
			(= x1 x1_0 )
			(= x1! x1_0 )
			(= x2 x2_0 )
			(= x2! x2_0 )
		)
		( and
			( = y1_1 y1 )
			( = y2_1 y2 )
			( = y3_1 y3 )
			( >= y3_1 0 )
			( not ( = ( + y2_1 1 ) x2_0 ) )
			( = y2_4 ( + y2_1 1 ) )
			( = y3_4 ( - y3_1 1 ) )
			( = y1_3 y1_1 )
			( = y2_3 y2_4 )
			( = y3_3 y3_4 )
			( = y1_3 y1! )
			( = y2_3 y2! )
			( = y3_3 y3! )
			(= x1 x1_0 )
			(= x1! x1_0 )
			(= x2 x2_0 )
			(= x2! x2_0 )
		)
	)
)

( define-fun post-f ( ( x1 Int )( x2 Int )( y1 Int )( y2 Int )( y3 Int )( x1_0 Int )( x2_0 Int )( y1_0 Int )( y1_1 Int )( y1_2 Int )( y1_3 Int )( y2_0 Int )( y2_1 Int )( y2_2 Int )( y2_3 Int )( y2_4 Int )( y3_0 Int )( y3_1 Int )( y3_2 Int )( y3_3 Int )( y3_4 Int ) ) Bool
	( or
		( not
			( and
				( = x1 x1_0)
				( = x2 x2_0 )
				( = y1 y1_1)
				( = y2 y2_1)
				( = y3 y3_1)
			)
		)
		( not
			( and
				( not ( >= y3_1 0 ) )
				( not ( = x1_0 ( + ( + ( * y1_1 x2_0 ) y2_1 ) y3_1 ) ) )
			)
		)
	)
)
SPLIT_HERE_asdfghjklzxcvbnmqwertyuiop
( assert ( not
	( =>
		( pre-f x1 x2 y1 y2 y3 x1_0 x2_0 y1_0 y1_1 y1_2 y1_3 y2_0 y2_1 y2_2 y2_3 y2_4 y3_0 y3_1 y3_2 y3_3 y3_4  )
		( inv-f x1 x2 y1 y2 y3 )
	)
))

SPLIT_HERE_asdfghjklzxcvbnmqwertyuiop
( assert ( not
	( =>
		( and
			( inv-f x1 x2 y1 y2 y3 )
			( trans-f x1 x2 y1 y2 y3 x1! x2! y1! y2! y3! x1_0 x2_0 y1_0 y1_1 y1_2 y1_3 y2_0 y2_1 y2_2 y2_3 y2_4 y3_0 y3_1 y3_2 y3_3 y3_4 )
		)
		( inv-f x1! x2! y1! y2! y3! )
	)
))

SPLIT_HERE_asdfghjklzxcvbnmqwertyuiop
( assert ( not
	( =>
		( inv-f x1 x2 y1 y2 y3  )
		( post-f x1 x2 y1 y2 y3 x1_0 x2_0 y1_0 y1_1 y1_2 y1_3 y2_0 y2_1 y2_2 y2_3 y2_4 y3_0 y3_1 y3_2 y3_3 y3_4 )
	)
))

