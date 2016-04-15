module Models.Episode (Episode, properTitle) where

type alias Episode = {
    title : String
  , guests : List String
  , summary : String
  }

properTitle : Episode -> String
properTitle episode =
  episode.title ++ formatGuests episode.guests

formatGuests : List String -> String
formatGuests guests =
  case guests of
    [] -> ""
    _ -> " (with " ++ joinCommaAnd guests ++ ")"

joinCommaAnd : List String -> String
joinCommaAnd values =
  case values of
    [] -> ""
    (a::[]) -> a
    (a::b::[]) -> a ++ " and " ++ b
    (a::b::rest) -> a ++ ", " ++ joinCommaAnd (b::rest)
