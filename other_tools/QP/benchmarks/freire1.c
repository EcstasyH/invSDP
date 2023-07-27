real a,x,r;
@pre( a >= 0 );
   x = (a*0.5);
   r = 0;
   while( (x>=(r)), ((a == [(x,r), 2] ) and (x>=0)))
   {
      x = (x - r);
      r = (r + 1);
   }
// @post(((((r*r) - r) >= (a-(2*r)))));
@post(((((r*r) - r) >= (a-(2*r))) and  (((r*r) - (r)) <= (a))));