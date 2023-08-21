(set-logic LIA)

( declare-const n Int )
( declare-const n! Int )
( declare-const r Int )
( declare-const r! Int )
( declare-const rr Int )
( declare-const rr! Int )
( declare-const u Int )
( declare-const u! Int )
( declare-const v Int )
( declare-const v! Int )
( declare-const tmp Int )
( declare-const tmp! Int )

( declare-const n_0 Int )
( declare-const r_0 Int )
( declare-const r_1 Int )
( declare-const r_2 Int )
( declare-const r_3 Int )
( declare-const r_4 Int )
( declare-const r_5 Int )
( declare-const rr_0 Int )
( declare-const u_0 Int )
( declare-const u_1 Int )
( declare-const u_2 Int )
( declare-const u_3 Int )
( declare-const u_4 Int )
( declare-const v_0 Int )
( declare-const v_1 Int )
( declare-const v_2 Int )
( declare-const v_3 Int )
( declare-const v_4 Int )

( define-fun inv-f( ( n Int )( r Int )( rr Int )( u Int )( v Int )( tmp Int ) ) Bool
SPLIT_HERE_asdfghjklzxcvbnmqwertyuiop
)

( define-fun pre-f ( ( n Int )( r Int )( rr Int )( u Int )( v Int )( tmp Int )( n_0 Int )( r_0 Int )( r_1 Int )( r_2 Int )( r_3 Int )( r_4 Int )( r_5 Int )( rr_0 Int )( u_0 Int )( u_1 Int )( u_2 Int )( u_3 Int )( u_4 Int )( v_0 Int )( v_1 Int )( v_2 Int )( v_3 Int )( v_4 Int ) ) Bool
	( and
		( = n n_0 )
		( = r r_1 )
		( = rr rr_0 )
		( = u u_1 )
		( = v v_1 )
		( >= n_0 0 )
		( >= rr_0 0 )
		( = u_1 ( + ( * 2 rr_0 ) 1 ) )
		( = v_1 1 )
		( = r_1 ( - ( * rr_0 rr_0 ) n_0 ) )
	)
)

( define-fun trans-f ( ( n Int )( r Int )( rr Int )( u Int )( v Int )( tmp Int )( n! Int )( r! Int )( rr! Int )( u! Int )( v! Int )( tmp! Int )( n_0 Int )( r_0 Int )( r_1 Int )( r_2 Int )( r_3 Int )( r_4 Int )( r_5 Int )( rr_0 Int )( u_0 Int )( u_1 Int )( u_2 Int )( u_3 Int )( u_4 Int )( v_0 Int )( v_1 Int )( v_2 Int )( v_3 Int )( v_4 Int ) ) Bool
	( or
		( and
			( = r_2 r )
			( = u_2 u )
			( = v_2 v )
			( = r_2 r! )
			( = u_2 u! )
			( = v_2 v! )
			( = n n! )
			( = r r! )
			( = rr rr! )
			( = u u! )
			( = v v! )
			(= tmp tmp! )
		)
		( and
			( = r_2 r )
			( = u_2 u )
			( = v_2 v )
			( >= r_2 0 )
			( = r_3 ( - r_2 v_2 ) )
			( = v_3 ( + v_2 2 ) )
			( = r_4 r_3 )
			( = u_3 u_2 )
			( = v_4 v_3 )
			( = r_4 r! )
			( = u_3 u! )
			( = v_4 v! )
			(= n n_0 )
			(= n! n_0 )
			(= rr rr_0 )
			(= rr! rr_0 )
			(= tmp tmp! )
		)
		( and
			( = r_2 r )
			( = u_2 u )
			( = v_2 v )
			( not ( >= r_2 0 ) )
			( = r_5 ( + r_2 u_2 ) )
			( = u_4 ( + u_2 2 ) )
			( = r_4 r_5 )
			( = u_3 u_4 )
			( = v_4 v_2 )
			( = r_4 r! )
			( = u_3 u! )
			( = v_4 v! )
			(= n n_0 )
			(= n! n_0 )
			(= rr rr_0 )
			(= rr! rr_0 )
			(= tmp tmp! )
		)
	)
)

( define-fun post-f ( ( n Int )( r Int )( rr Int )( u Int )( v Int )( tmp Int )( n_0 Int )( r_0 Int )( r_1 Int )( r_2 Int )( r_3 Int )( r_4 Int )( r_5 Int )( rr_0 Int )( u_0 Int )( u_1 Int )( u_2 Int )( u_3 Int )( u_4 Int )( v_0 Int )( v_1 Int )( v_2 Int )( v_3 Int )( v_4 Int ) ) Bool
	( or
		( not
			( and
				( = n n_0)
				( = r r_2)
				( = rr rr_0)
				( = u u_2)
				( = v v_2)
			)
		)
		( not
			( and
				( not ( = ( + ( * 4 n_0 ) ( * 4 r_2 ) ) ( + ( - ( - ( * u_2 u_2 ) ( * v_2 v_2 ) ) ( * 2 u_2 ) ) ( * 2 v_2 ) ) ) )
			)
		)
	)
)
SPLIT_HERE_asdfghjklzxcvbnmqwertyuiop
( assert ( not
	( =>
		( pre-f n r rr u v tmp n_0 r_0 r_1 r_2 r_3 r_4 r_5 rr_0 u_0 u_1 u_2 u_3 u_4 v_0 v_1 v_2 v_3 v_4  )
		( inv-f n r rr u v tmp )
	)
))

SPLIT_HERE_asdfghjklzxcvbnmqwertyuiop
( assert ( not
	( =>
		( and
			( inv-f n r rr u v tmp )
			( trans-f n r rr u v tmp n! r! rr! u! v! tmp! n_0 r_0 r_1 r_2 r_3 r_4 r_5 rr_0 u_0 u_1 u_2 u_3 u_4 v_0 v_1 v_2 v_3 v_4 )
		)
		( inv-f n! r! rr! u! v! tmp! )
	)
))

SPLIT_HERE_asdfghjklzxcvbnmqwertyuiop
( assert ( not
	( =>
		( inv-f n r rr u v tmp  )
		( post-f n r rr u v tmp n_0 r_0 r_1 r_2 r_3 r_4 r_5 rr_0 u_0 u_1 u_2 u_3 u_4 v_0 v_1 v_2 v_3 v_4 )
	)
))

