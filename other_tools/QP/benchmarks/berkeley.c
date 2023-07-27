real  unowned, exclusive, nonexclusive, invalid, total;
@pre(invalid>=1);
exclusive = 0;
nonexclusive = 0;
unowned = 0;
total = invalid;
// We need a strong invariant so that we can add holes in the program
while (1>=0,  ( ( ((((exclusive >= 0 and nonexclusive >= 0) and unowned >= 0))) and invalid >= 0) and (total==[(unowned, invalid, exclusive, nonexclusive),1]))){
  ndif 
  {
    [assume(invalid >= 1)]{
        //nonexclusive = (nonexclusive + exclusive);
        nonexclusive = (nonexclusive + exclusive);
        unowned = (unowned + 1);
        invalid = (invalid - 1);
        exclusive = 0;  
    }

    [assume(invalid >= 1)]{

      invalid = ((invalid + exclusive) + ((nonexclusive + unowned) - 1));
    //invalid = [( (nonexclusive+ exclusive_+ invalid+ unowned), 1];
      exclusive = 1;
      nonexclusive = 0;
      unowned = 0;
    }   

    [assume(nonexclusive >= 1)]{
      invalid = (invalid + ((nonexclusive + unowned) - 1));
      //invalid = [(nonexclusive, exclusive, invalid, unowned), 1];
      exclusive = (exclusive + 1);
      nonexclusive = 0;
      unowned = 0;
    }

    [assume(unowned >= 1)]{
      invalid = (invalid + ((nonexclusive + unowned) - 1));
      //invalid = [(nonexclusive, exclusive, invalid, unowned), 1];
      exclusive = (exclusive + 1);
      nonexclusive = 0;
      unowned = 0;
    }
    }
}   
@post(1>=0);