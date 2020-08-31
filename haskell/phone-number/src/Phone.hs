module Phone (number) where

import Data.Char (isNumber)

number :: String -> Maybe String
number xs =
  case (length sanitized, sanitized) of
    (11, '1':n:ns) -> validate $ n:ns
    (10, ns) -> validate ns
    _ -> Nothing
  where
    sanitized = filter isNumber xs

    validate ns =
      case (ns, drop 3 ns) of
        (n:_, e:_) -> if n > '1' && e > '1' then Just ns else Nothing
        _ -> Nothing
