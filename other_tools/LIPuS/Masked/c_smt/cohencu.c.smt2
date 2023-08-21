(set-logic LIA)

( declare-const n Int )
( declare-const n! Int )
( declare-const x Int )
( declare-const x! Int )
( declare-const y Int )
( declare-const y! Int )
( declare-const z Int )
( declare-const z! Int )
( declare-const tmp Int )
( declare-const tmp! Int )

( declare-const n_0 Int )
( declare-const n_1 Int )
( declare-const n_2 Int )
( declare-const x_0 Int )
( declare-const x_1 Int )
( declare-const x_2 Int )
( declare-const y_0 Int )
( declare-const y_1 Int )
( declare-const y_2 Int )
( declare-const z_0 Int )
( declare-const z_1 Int )
( declare-const z_2 Int )

( define-fun inv-f( ( n Int )( x Int )( y Int )( z Int )( tmp Int ) ) Bool
SPLIT_HERE_asdfghjklzxcvbnmqwertyuiop
)

( define-fun pre-f ( ( n Int )( x Int )( y Int )( z Int )( tmp Int )( n_0 Int )( n_1 Int )( n_2 Int )( x_0 Int )( x_1 Int )( x_2 Int )( y_0 Int )( y_1 Int )( y_2 Int )( z_0 Int )( z_1 Int )( z_2 Int ) ) Bool
	( and
		( = n n_0 )
		( = x x_0 )
		( = y y_0 )
		( = z z_0 )
		( = n_0 0 )
		( = x_0 0 )
		( = y_0 1 )
		( = z_0 6 )
	)
)

( define-fun trans-f ( ( n Int )( x Int )( y Int )( z Int )( tmp Int )( n! Int )( x! Int )( y! Int )( z! Int )( tmp! Int )( n_0 Int )( n_1 Int )( n_2 Int )( x_0 Int )( x_1 Int )( x_2 Int )( y_0 Int )( y_1 Int )( y_2 Int )( z_0 Int )( z_1 Int )( z_2 Int ) ) Bool
	( or
		( and
			( = n_1 n )
			( = x_1 x )
			( = y_1 y )
			( = z_1 z )
			( = n_1 n! )
			( = x_1 x! )
			( = y_1 y! )
			( = z_1 z! )
			( = n n! )
			( = x x! )
			( = y y! )
			( = z z! )
			(= tmp tmp! )
		)
		( and
			( = n_1 n )
			( = x_1 x )
			( = y_1 y )
			( = z_1 z )
			( = n_2 ( + n_1 1 ) )
			( = x_2 ( + x_1 y_1 ) )
			( = y_2 ( + y_1 z_1 ) )
			( = z_2 ( + z_1 6 ) )
			( = n_2 n! )
			( = x_2 x! )
			( = y_2 y! )
			( = z_2 z! )
			(= tmp tmp! )
		)
	)
)

( define-fun post-f ( ( n Int )( x Int )( y Int )( z Int )( tmp Int )( n_0 Int )( n_1 Int )( n_2 Int )( x_0 Int )( x_1 Int )( x_2 Int )( y_0 Int )( y_1 Int )( y_2 Int )( z_0 Int )( z_1 Int )( z_2 Int ) ) Bool
	( and
		( or
			( not
				( and
					( = n n_1)
					( = x x_1)
					( = y y_1)
					( = z z_1)
				)
			)
			( not
				( and
					( = z_1 ( + ( * 6 n_1 ) 6 ) )
					( = y_1 ( + ( + ( * ( * 3 n_1 ) n_1 ) ( * 3 n_1 ) ) 1 ) )
					( not ( and ( and ( = z_1 ( + ( * 6 n_1 ) 6 ) ) ( = y_1 ( + ( + ( * ( * 3 n_1 ) n_1 ) ( * 3 n_1 ) ) 1 ) ) ) ( = x_1 ( * ( * n_1 n_1 ) n_1 ) ) ) )
				)
			)
		)
		( or
			( not
				( and
					( = n n_1)
					( = x x_1)
					( = y y_1)
					( = z z_1)
				)
			)
			( not
				( and
					( = z_1 ( + ( * 6 n_1 ) 6 ) )
					( not ( = y_1 ( + ( + ( * ( * 3 n_1 ) n_1 ) ( * 3 n_1 ) ) 1 ) ) )
					( not ( and ( and ( = z_1 ( + ( * 6 n_1 ) 6 ) ) ( = y_1 ( + ( + ( * ( * 3 n_1 ) n_1 ) ( * 3 n_1 ) ) 1 ) ) ) ( = x_1 ( * ( * n_1 n_1 ) n_1 ) ) ) )
				)
			)
		)
		( or
			( not
				( and
					( = n n_1)
					( = x x_1)
					( = y y_1)
					( = z z_1)
				)
			)
			( not
				( and
					( not ( = z_1 ( + ( * 6 n_1 ) 6 ) ) )
					( not ( and ( and ( = z_1 ( + ( * 6 n_1 ) 6 ) ) ( = y_1 ( + ( + ( * ( * 3 n_1 ) n_1 ) ( * 3 n_1 ) ) 1 ) ) ) ( = x_1 ( * ( * n_1 n_1 ) n_1 ) ) ) )
				)
			)
		)
	)
)
SPLIT_HERE_asdfghjklzxcvbnmqwertyuiop
( assert ( not
	( =>
		( pre-f n x y z tmp n_0 n_1 n_2 x_0 x_1 x_2 y_0 y_1 y_2 z_0 z_1 z_2  )
		( inv-f n x y z tmp )
	)
))

SPLIT_HERE_asdfghjklzxcvbnmqwertyuiop
( assert ( not
	( =>
		( and
			( inv-f n x y z tmp )
			( trans-f n x y z tmp n! x! y! z! tmp! n_0 n_1 n_2 x_0 x_1 x_2 y_0 y_1 y_2 z_0 z_1 z_2 )
		)
		( inv-f n! x! y! z! tmp! )
	)
))

SPLIT_HERE_asdfghjklzxcvbnmqwertyuiop
( assert ( not
	( =>
		( inv-f n x y z tmp  )
		( post-f n x y z tmp n_0 n_1 n_2 x_0 x_1 x_2 y_0 y_1 y_2 z_0 z_1 z_2 )
	)
))

