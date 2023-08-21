(set-logic LIA)

( declare-const a Int )
( declare-const a! Int )
( declare-const n Int )
( declare-const n! Int )
( declare-const su Int )
( declare-const su! Int )
( declare-const t Int )
( declare-const t! Int )

( declare-const a_0 Int )
( declare-const a_1 Int )
( declare-const a_2 Int )
( declare-const n_0 Int )
( declare-const su_0 Int )
( declare-const t_0 Int )
( declare-const t_1 Int )
( declare-const t_2 Int )

( define-fun inv-f( ( a Int )( n Int )( su Int )( t Int ) ) Bool
SPLIT_HERE_asdfghjklzxcvbnmqwertyuiop
)

( define-fun pre-f ( ( a Int )( n Int )( su Int )( t Int )( a_0 Int )( a_1 Int )( a_2 Int )( n_0 Int )( su_0 Int )( t_0 Int )( t_1 Int )( t_2 Int ) ) Bool
	( and
		( = a a_0 )
		( = n n_0 )
		( = su su_0 )
		( = t t_0 )
		( = a_0 0 )
		( = su_0 1 )
		( = t_0 1 )
		( >= n_0 0 )
	)
)

( define-fun trans-f ( ( a Int )( n Int )( su Int )( t Int )( a! Int )( n! Int )( su! Int )( t! Int )( a_0 Int )( a_1 Int )( a_2 Int )( n_0 Int )( su_0 Int )( t_0 Int )( t_1 Int )( t_2 Int ) ) Bool
	( or
		( and
			( = a_1 a )
			( = t_1 t )
			( = a_1 a! )
			( = t_1 t! )
			( = su su_0 )
			( = su! su_0 )
			( = n n_0 )
			( = n! n_0 )
			( = a a! )
			( = t t! )
		)
		( and
			( = a_1 a )
			( = t_1 t )
			( <= su_0 n_0 )
			( = a_2 ( + a_1 1 ) )
			( = t_2 ( + t_1 2 ) )
			( = a_2 a! )
			( = t_2 t! )
			(= n n_0 )
			(= n! n_0 )
			(= su su_0 )
			(= su! su_0 )
		)
	)
)

( define-fun post-f ( ( a Int )( n Int )( su Int )( t Int )( a_0 Int )( a_1 Int )( a_2 Int )( n_0 Int )( su_0 Int )( t_0 Int )( t_1 Int )( t_2 Int ) ) Bool
	( and
		( or
			( not
				( and
					( = a a_1)
					( = n n_0)
					( = su su_0)
					( = t t_1)
				)
			)
			( not
				( and
					( not ( <= su_0 n_0 ) )
					( <= ( * a_1 a_1 ) n_0 )
					( not ( and ( <= ( * a_1 a_1 ) n_0 ) ( <= n_0 ( * ( + a_1 1 ) ( + a_1 1 ) ) ) ) )
				)
			)
		)
		( or
			( not
				( and
					( = a a_1)
					( = n n_0)
					( = su su_0)
					( = t t_1)
				)
			)
			( not
				( and
					( not ( <= su_0 n_0 ) )
					( not ( <= ( * a_1 a_1 ) n_0 ) )
					( not ( and ( <= ( * a_1 a_1 ) n_0 ) ( <= n_0 ( * ( + a_1 1 ) ( + a_1 1 ) ) ) ) )
				)
			)
		)
	)
)
SPLIT_HERE_asdfghjklzxcvbnmqwertyuiop
( assert ( not
	( =>
		( pre-f a n su t a_0 a_1 a_2 n_0 su_0 t_0 t_1 t_2  )
		( inv-f a n su t )
	)
))

SPLIT_HERE_asdfghjklzxcvbnmqwertyuiop
( assert ( not
	( =>
		( and
			( inv-f a n su t )
			( trans-f a n su t a! n! su! t! a_0 a_1 a_2 n_0 su_0 t_0 t_1 t_2 )
		)
		( inv-f a! n! su! t! )
	)
))

SPLIT_HERE_asdfghjklzxcvbnmqwertyuiop
( assert ( not
	( =>
		( inv-f a n su t  )
		( post-f a n su t a_0 a_1 a_2 n_0 su_0 t_0 t_1 t_2 )
	)
))

