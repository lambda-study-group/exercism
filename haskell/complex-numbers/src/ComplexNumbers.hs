module ComplexNumbers
  ( Complex
  , conjugate
  , abs
  , exp
  , real
  , imaginary
  , mul
  , add
  , sub
  , div
  , complex
  ) where

import Prelude hiding (div, abs, exp)
import qualified Prelude as P

-- Data definition -------------------------------------------------------------

data Complex a = Complex a a deriving (Eq, Show)

complex :: (a, a) -> Complex a
complex = uncurry Complex

-- unary operators -------------------------------------------------------------
conjugate :: Num a => Complex a -> Complex a
conjugate (Complex r i) = Complex r (-i)

abs :: Floating a => Complex a -> a
abs (Complex r i) = sqrt $ r^2 + i^2

real :: Num a => Complex a -> a
real (Complex r _) = r

imaginary :: Num a => Complex a -> a
imaginary (Complex _ i) = i

exp :: Floating a => Complex a -> Complex a
exp (Complex a b) = Complex (P.exp a * cos b) (P.exp a * sin b)

-- binary operators ------------------------------------------------------------
add :: Num a => Complex a -> Complex a -> Complex a
add (Complex a b) (Complex c d) = Complex (a + c) (b + d)

sub :: Num a => Complex a -> Complex a -> Complex a
sub (Complex a b) (Complex c d) = Complex (a - c) (b - d)

mul :: Num a => Complex a -> Complex a -> Complex a
mul (Complex a b) (Complex c d) = Complex r i where
  r = (a * c - b * d)
  i = (b * c + a * d)

div :: Fractional a => Complex a -> Complex a -> Complex a
div (Complex a b) (Complex c d) = Complex r i where
  r = (a * c + b * d) / (c^2 + d^2)
  i = (b * c - a * d) / (c^2 + d^2)
