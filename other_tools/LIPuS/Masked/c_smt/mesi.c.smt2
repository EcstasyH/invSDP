(set-logic LIA)

( declare-const e Int )
( declare-const e! Int )
( declare-const i Int )
( declare-const i! Int )
( declare-const m Int )
( declare-const m! Int )
( declare-const s Int )
( declare-const s! Int )
( declare-const t Int )
( declare-const t! Int )
( declare-const tmp Int )
( declare-const tmp! Int )

( declare-const e_0 Int )
( declare-const e_1 Int )
( declare-const e_2 Int )
( declare-const e_3 Int )
( declare-const e_4 Int )
( declare-const e_5 Int )
( declare-const e_6 Int )
( declare-const i_0 Int )
( declare-const i_1 Int )
( declare-const i_2 Int )
( declare-const i_3 Int )
( declare-const i_4 Int )
( declare-const i_5 Int )
( declare-const m_0 Int )
( declare-const m_1 Int )
( declare-const m_2 Int )
( declare-const m_3 Int )
( declare-const m_4 Int )
( declare-const m_5 Int )
( declare-const m_6 Int )
( declare-const s_0 Int )
( declare-const s_1 Int )
( declare-const s_2 Int )
( declare-const s_3 Int )
( declare-const s_4 Int )
( declare-const s_5 Int )
( declare-const s_6 Int )
( declare-const t_0 Int )

( define-fun inv-f( ( e Int )( i Int )( m Int )( s Int )( t Int )( tmp Int ) ) Bool
SPLIT_HERE_asdfghjklzxcvbnmqwertyuiop
)

( define-fun pre-f ( ( e Int )( i Int )( m Int )( s Int )( t Int )( tmp Int )( e_0 Int )( e_1 Int )( e_2 Int )( e_3 Int )( e_4 Int )( e_5 Int )( e_6 Int )( i_0 Int )( i_1 Int )( i_2 Int )( i_3 Int )( i_4 Int )( i_5 Int )( m_0 Int )( m_1 Int )( m_2 Int )( m_3 Int )( m_4 Int )( m_5 Int )( m_6 Int )( s_0 Int )( s_1 Int )( s_2 Int )( s_3 Int )( s_4 Int )( s_5 Int )( s_6 Int )( t_0 Int ) ) Bool
	( and
		( = e e_0 )
		( = i i_0 )
		( = m m_0 )
		( = s s_0 )
		( = t t_0 )
		( = m_0 0 )
		( = s_0 0 )
		( = e_0 0 )
		( = t_0 i_0 )
		( >= i_0 1 )
	)
)

( define-fun trans-f ( ( e Int )( i Int )( m Int )( s Int )( t Int )( tmp Int )( e! Int )( i! Int )( m! Int )( s! Int )( t! Int )( tmp! Int )( e_0 Int )( e_1 Int )( e_2 Int )( e_3 Int )( e_4 Int )( e_5 Int )( e_6 Int )( i_0 Int )( i_1 Int )( i_2 Int )( i_3 Int )( i_4 Int )( i_5 Int )( m_0 Int )( m_1 Int )( m_2 Int )( m_3 Int )( m_4 Int )( m_5 Int )( m_6 Int )( s_0 Int )( s_1 Int )( s_2 Int )( s_3 Int )( s_4 Int )( s_5 Int )( s_6 Int )( t_0 Int ) ) Bool
	( or
		( and
			( = e_1 e )
			( = i_1 i )
			( = m_1 m )
			( = s_1 s )
			( = e_1 e! )
			( = i_1 i! )
			( = m_1 m! )
			( = s_1 s! )
			( = e e! )
			( = i i! )
			( = m m! )
			( = s s! )
			( = t t! )
			(= tmp tmp! )
		)
		( and
			(= e e_0 )
			(= e! e_0 )
			(= i i_0 )
			(= i! i_0 )
			(= m m_0 )
			(= m! m_0 )
			(= s s_0 )
			(= s! s_0 )
			(= t t_0 )
			(= t! t_0 )
			(= tmp tmp! )
		)
	)
)

( define-fun post-f ( ( e Int )( i Int )( m Int )( s Int )( t Int )( tmp Int )( e_0 Int )( e_1 Int )( e_2 Int )( e_3 Int )( e_4 Int )( e_5 Int )( e_6 Int )( i_0 Int )( i_1 Int )( i_2 Int )( i_3 Int )( i_4 Int )( i_5 Int )( m_0 Int )( m_1 Int )( m_2 Int )( m_3 Int )( m_4 Int )( m_5 Int )( m_6 Int )( s_0 Int )( s_1 Int )( s_2 Int )( s_3 Int )( s_4 Int )( s_5 Int )( s_6 Int )( t_0 Int ) ) Bool
	( or
		( not
			( and
				( = e e_1)
				( = i i_1)
				( = m m_1)
				( = s s_1)
				( = t t_0)
			)
		)
		( not
			( and
				( not ( = t_0 ( + ( + ( + m_1 s_1 ) e_1 ) i_1 ) ) )
			)
		)
	)
)
SPLIT_HERE_asdfghjklzxcvbnmqwertyuiop
( assert ( not
	( =>
		( pre-f e i m s t tmp e_0 e_1 e_2 e_3 e_4 e_5 e_6 i_0 i_1 i_2 i_3 i_4 i_5 m_0 m_1 m_2 m_3 m_4 m_5 m_6 s_0 s_1 s_2 s_3 s_4 s_5 s_6 t_0  )
		( inv-f e i m s t tmp )
	)
))

SPLIT_HERE_asdfghjklzxcvbnmqwertyuiop
( assert ( not
	( =>
		( and
			( inv-f e i m s t tmp )
			( trans-f e i m s t tmp e! i! m! s! t! tmp! e_0 e_1 e_2 e_3 e_4 e_5 e_6 i_0 i_1 i_2 i_3 i_4 i_5 m_0 m_1 m_2 m_3 m_4 m_5 m_6 s_0 s_1 s_2 s_3 s_4 s_5 s_6 t_0 )
		)
		( inv-f e! i! m! s! t! tmp! )
	)
))

SPLIT_HERE_asdfghjklzxcvbnmqwertyuiop
( assert ( not
	( =>
		( inv-f e i m s t tmp  )
		( post-f e i m s t tmp e_0 e_1 e_2 e_3 e_4 e_5 e_6 i_0 i_1 i_2 i_3 i_4 i_5 m_0 m_1 m_2 m_3 m_4 m_5 m_6 s_0 s_1 s_2 s_3 s_4 s_5 s_6 t_0 )
	)
))

