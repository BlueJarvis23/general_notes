{-# OPTIONS_GHC -Wall #-}
module LogAnalysis where

import Log
import Prelude

parseMessage :: String -> LogMessage
parseMessage s
  | w == "I" = LogMessage Info xi ( unwords( y : zs ))
  | w == "W" = LogMessage Warning xi ( unwords( y : zs ))
  | w == "E" = LogMessage (Error xi) yi ( unwords( zs ))
  | otherwise = Unknown s
  where (w:x:y:zs) = words s
        xi = read x :: Int
        yi = read y :: Int

parse :: String -> [LogMessage]
parse s = map parseMessage sx
  where sx = lines s



--parseMessage n = LogMessage Info 123 "Message"


e = parseMessage "E 2 562 help help"
     == LogMessage (Error 2) 562 "help help"

i = parseMessage "I 29 la la la"
     == LogMessage Info 29 "la la la"

u = parseMessage "This is not in the right format"
     == Unknown "This is not in the right format"

