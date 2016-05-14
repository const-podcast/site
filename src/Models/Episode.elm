module Models.Episode (Episode, formatGuests, episodeNumber) where

import String exposing (padLeft, concat)

type alias Episode = {
    title : String
  , guests : List String
  , summary : String
  , identifier : String
  , episodeOfSeason : Int
  , season : Int
  , url : String
  , icon : String
  }

episodeNumber : Episode -> String
episodeNumber episode =
  concat [
    "season ", toString episode.season
  , ", "
  , "episode ", toString episode.episodeOfSeason
  ]

formatGuests : List String -> String
formatGuests guests =
  case guests of
    [] -> ""
    _ -> "with " ++ joinCommaAnd guests

joinCommaAnd : List String -> String
joinCommaAnd values =
  case values of
    [] -> ""
    (a::[]) -> a
    (a::b::[]) -> a ++ " and " ++ b
    (a::b::rest) -> a ++ ", " ++ joinCommaAnd (b::rest)
