real((R,_), R).
imaginary((_, I), I).

conjugate((R, I), (R, NewI)) :-
  NewI is 0-I.

abs((R,I), Res) :-
  Res is (R^2 + I^2)^(1/2).

add((R1, I1), (R2, I2), (R, I)) :-
  R is R1 + R2,
  I is I1 + I2.

sub((R1, I1), (R2, I2), (R, I)) :-
  R is R1 - R2,
  I is I1 - I2.

mul((R1, I1), (R2, I2), (R, I)) :-
  R is R1 * R2 - I1 * I2,
  I is I1 * R2 + R1 * I2.

div((R1, I1), (R2, I2), (R, I)) :-
  R is (R1 * R2 + I1 * I2)/(R2^2 + I2^2),
  I is (I1 * R2 - R1 * I2)/(R2^2 + I2^2).
